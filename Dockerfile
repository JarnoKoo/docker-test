# Build phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- kaikki tiedostot ovat tuolla

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx käynnistyy automaattisesti ilman komentoa
