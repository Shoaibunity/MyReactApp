# Stage 1: Build
FROM node:20
WORKDIR /app
COPY . /app/
RUN npm install
RUN npm run build 
# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

