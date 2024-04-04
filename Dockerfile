FROM node:18-alpine

WORKDIR /app
RUN apk add --no-cache build-base

COPY package.json ./

RUN npm install
RUN npm run build
COPY . .

EXPOSE 3000

CMD ["npm", "run", "start"]
