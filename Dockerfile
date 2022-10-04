FROM node:16-alpine as builder
# build phase, to install dependencies and build our application
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# copy something from build, epecify the location


