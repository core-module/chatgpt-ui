FROM node:18-alpine

WORKDIR /app
RUN apk add --no-cache build-base python3 git

COPY package.json ./

RUN npm install
COPY . .

EXPOSE 4000

CMD ["npm", "run", "dev"]
