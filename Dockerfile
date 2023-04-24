FROM node:16

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production
RUN npm ci --only=production

RUN npm install
RUN npm install -g serve

# Bundle app source
COPY . .
RUN npm run build

EXPOSE 3000

# Bundle C Code
RUN apt update
RUN apt upgrade -y

CMD [ "serve", "-s", "build", "-p", "3000"]
