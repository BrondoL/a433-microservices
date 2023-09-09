################################################### STAGE 1
FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

################################################### STAGE 2
FROM nginx:stable-alpine

COPY --from=builder /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

# Provide a label to connect GitHub Package with the GitHub repository
LABEL org.opencontainers.image.source=https://github.com/brondol/a433-microservices

# Provide a description for the image in GitHub Package
LABEL org.opencontainers.image.description="karsajobs ui image"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]