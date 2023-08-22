FROM node:14

# Create app directory 
WORKDIR /usr/backend-nguyentrungkien

# Copy 2 file package.json và package-lock.json vào (WORKDIR) folder dự án backend-nguyentrungkien
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
# Copy tất cả các file tại máy tính của chúng ta vào (WORKDIR) folder dự án backend-nguyentrungkien
COPY . .

EXPOSE 8000

CMD [ "node", "index.js" ]
