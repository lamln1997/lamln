FROM node:12
WORKDIR /app
COPY package.json package-lock.json tsconfig.json tslint.json ./
COPY . .
RUN npm install && npm start && npm restart
EXPOSE 3000
