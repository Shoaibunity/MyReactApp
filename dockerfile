# Stage 1: build
FROM node:20 AS build
WORKDIR /app
COPY package.json package-lock.json ./
COPY . /app/
RUN npm install
RUN npm run build 
# Stage 2: Serve with Nginx
FROM nginx:latest
COPY --from=build build/app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

