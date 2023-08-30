# Docker hỗ trợ chúng ta 1 keywork đó là build-stage. Nghĩa là chúng ta chỉ cần viết theo thứ tự là nó sẽ
# chạy lần lượt theo thứ tự từ trên xuống dưới. Khi nào thằng trên thực hiện xong thì thằng bên dưới mới được phép chạy

# Vì con react (frontend) là 1 phần của con nginx nên chúng ta thường sẽ build con react trong con nginx luôn

# Stage 1
# Thằng build-stage nó giống như 1 cái cache (bộ nhớ đệm) vậy. Việc chúng ta đã build xong hoàn toàn cục Stage 1 này thì nó sẽ lưu trữ
# vào cache (bộ nhớ đệm)
FROM node:14-alpine as build-stage

WORKDIR /usr/frontend-nguyentrungkien

# Copy toàn bộ folder stackFE vào trong con docker
COPY stackFE/ .
# Cài node_modules
RUN npm install
# Build cục frontend react
RUN npm run build

# Stage 2
FROM nginx:1.23

# --from:build-stage Có nghĩa là chúng ta sẽ sử dụng lại bước build-stage trước đó (ở trên (Stage 1)). (Lưu trữ trong bộ nhớ đệm cache)
# Chúng ta sẽ copy thư mục build trong /usr/frontend-nguyentrungkien bên trong con docker và ghi đè lại folder html trong /usr/share/nginx
# của con nginx
COPY --from=build-stage /usr/frontend-nguyentrungkien/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
