# Docker will download the base image named node from Docker Hub with tag 14.
FROM node:14 AS builder

# Change the working directory to /app
WORKDIR /app

# Copy all files from the current local working directory to the container's working directory /app
COPY . .

# Set environment variables in the container
ENV NODE_ENV=production DB_HOST=item-db

# Run commands to install Node modules and then build the source code
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080 in the container
EXPOSE 8080

# Provide a label to connect GitHub Package with the GitHub repository
LABEL org.opencontainers.image.source=https://github.com/brondol/a433-microservices

# Provide a description for the image in GitHub Package
LABEL org.opencontainers.image.description="Dicoding microservices image"

# Command to be executed when the container starts
CMD [ "npm", "start" ]