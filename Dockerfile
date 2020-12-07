FROM node:12
WORKDIR /home/nodejs/src
COPY package.json package-lock.json tsconfig.json tslint.json ./
COPY . .
RUN npm install
CMD ["npm", "restart"]
