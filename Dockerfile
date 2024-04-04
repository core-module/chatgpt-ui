FROM node:20-alpine

WORKDIR /app
RUN apk add --no-cache build-base python3 git

COPY package.json .env ./

RUN npm install
RUN npm run build
COPY . .

EXPOSE 3000

CMD ["npm", "run", "start"]
