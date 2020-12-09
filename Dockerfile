FROM node:12-alpine
WORKDIR /home/nodejs/src
COPY package.json package-lock.json tsconfig.json tslint.json ./
COPY . .
RUN npm install
CMD ["npm", "start"]

#start the project:  .docker-compose exec server npm restart

