#!/bin/bash
# Khai báo tên miền website của chúng ta
domains=(nguyentrungkien08112000.click www.nguyentrungkien08112000.click)
rsa_key_size=4096
# data_path="./certbot" => Đây là nơi mà chúng ta sẽ lưu trữ dữ liệu (tất cả các chứng chỉ ssl chúng ta sẽ lưu ở đây)
data_path="./certbot"
# Cung cấp email cho Let's encrypt. Nếu chứng chỉ SSL của chúng ta hết hạn thì Let's encrypt sẽ gửi email về cho chúng ta
email="nguyenkien11202000@gmail.com" 
# staging: 1 là môi trường test
# staging: 0 là môi trường production
staging=0
# Kiểm tra xem chúng ta đã tạo các chứng chỉ SSL chưa
if [ -d "$data_path" ]; then
  read -p "Existing data found for $domains. Continue and replace existing certificate? (y/N) " decision
  if [ "$decision" != "Y" ] && [ "$decision" != "y" ]; then
    exit
  fi
fi

# Download các tham số từ con certbot về
if [ ! -e "$data_path/conf/options-ssl-nginx.conf" ] || [ ! -e "$data_path/conf/ssl-dhparams.pem" ]; then
  echo "### Downloading recommended TLS parameters ..."
  mkdir -p "$data_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$data_path/conf/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$data_path/conf/ssl-dhparams.pem"
  echo
fi

# Tạo ra chứng chỉ fake ssl (certificate) với con certbot
# fake ssl (certificate) để nó chạy con nginx lên
echo "### Creating dummy certificate for $domains ..."
path="/etc/letsencrypt/live/$domains"
mkdir -p "$data_path/conf/live/$domains"
docker compose run --rm --entrypoint "\
  openssl req -x509 -nodes -newkey rsa:$rsa_key_size -days 1\
    -keyout '$path/privkey.pem' \
    -out '$path/fullchain.pem' \
    -subj '/CN=localhost'" certbot
echo

# Thằng nginx bắt buộc phải chạy được thì chúng ta mới lấy được chứng chỉ SSL (certificate). Mà thằng nginx đang phụ thuộc vào thằng backend thằng backend 
# lại phụ thuộc vào thằng mysqldb nên chúng ta cũng sẽ chạy đồng thời 2 thằng mysqldb và backend luôn
# echo "### Starting nginx ..."
docker compose -p nguyentrungkien up -d mysqldb
docker compose -p nguyentrungkien up -d backend
docker compose -p nguyentrungkien up --force-recreate -d nginx
# echo

# step 2, get real certificate
# Xóa certificate (chứng chỉ SSL) fake của chúng ta đi
echo "### Deleting dummy certificate for $domains ..."
docker compose run --rm --entrypoint "\
  rm -Rf /etc/letsencrypt/live/$domains && \
  rm -Rf /etc/letsencrypt/archive/$domains && \
  rm -Rf /etc/letsencrypt/renewal/$domains.conf" certbot
echo

# Đăng ký thông tin cho Let's Encrypt để lấy về chứng chỉ SSL (certificate)
echo "### Requesting Let's Encrypt certificate for $domains ..."
#Join $domains to -d args (Khai báo tên miền)
domain_args=""
for domain in "${domains[@]}"; do
  domain_args="$domain_args -d $domain"
done

# Select appropriate email arg (Khai báo email)
case "$email" in
  "") email_arg="--register-unsafely-without-email" ;;
  *) email_arg="--email $email" ;;
esac

# Enable staging mode if needed 
if [ $staging != "0" ]; then staging_arg="--staging"; fi

# Tạo ra 1 certificate (chứng chỉ SSL) thật
docker compose run --rm --entrypoint "\
  certbot certonly --webroot -w /var/www/certbot \
    $staging_arg \
    $email_arg \
    $domain_args \
    --rsa-key-size $rsa_key_size \
    --agree-tos \
    --force-renewal" certbot
echo

echo "### Reloading nginx ..."
docker compose -p nguyentrungkien exec nginx nginx -s reload
