FROM node:20-alpine

WORKDIR /app
RUN apk add --no-cache build-base python3 git

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
