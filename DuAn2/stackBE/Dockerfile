# Khi ta thêm -alpine vào sau 1 phiên bản thư viện nào đó thì nó sẽ giúp làm giảm dung lượng của thư viện đó xuống
# bằng cách loại bỏ đi những package không cần thiết
FROM node:14-alpine

WORKDIR /usr/backend-nguyentrungkien

# Copy 2 file package.json và package-lock.json vào (WORKDIR) folder dự án backend-nguyentrungkien
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Copy tất cả các file tại máy tính của chúng ta vào (WORKDIR) folder dự án backend-nguyentrungkien
COPY . .

EXPOSE 8000

CMD [ "node", "index.js" ]
