FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build  # /build folder will be created in current directory - /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


