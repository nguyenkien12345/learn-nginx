#!/bin/bash
# Khai báo tên miền website của chúng ta
domains=(hoidanitexample.xyz www.hoidanitexample.xyz)
rsa_key_size=4096
# data_path="./certbot" => Đây là nơi mà chúng ta sẽ lưu trữ dữ liệu (tất cả các chứng chỉ ssl chúng ta sẽ lưu ở đây)
data_path="./certbot"
# Cung cấp email cho Let's encrypt. Nếu chứng chỉ SSL của chúng ta hết hạn thì Let's encrypt sẽ gửi email về cho chúng ta
email="abc@gmail.com" 
# staging: 1 là môi trường test
# staging: 0 là môi trường production
staging=1 
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
echo "### Creating dummy certificate for $domains ..."
path="/etc/letsencrypt/live/$domains"
mkdir -p "$data_path/conf/live/$domains"
docker compose run --rm --entrypoint "\
  openssl req -x509 -nodes -newkey rsa:$rsa_key_size -days 1\
    -keyout '$path/privkey.pem' \
    -out '$path/fullchain.pem' \
    -subj '/CN=localhost'" certbot
echo


echo "### Starting nginx ..."
docker compose up --force-recreate -d nginx
echo
