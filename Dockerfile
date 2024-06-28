FROM node:18-alpine as builder
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package.json .
RUN npm install
COPY . .

FROM alpine
RUN mkdir /app
WORKDIR /app
COPY --from=builder /home/node/app .
RUN apk add --update && apk add nodejs && apk add npm
RUN npm run build && npm i -g serve
EXPOSE 3000
CMD [ "serve", "-s", "dist" ]