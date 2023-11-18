FROM node:18-alpine

RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Create and determine the working directory, namely /app
WORKDIR /app

# Copy all files in the same folder as Dockerfile to the current directory, namely /app as workdir
COPY . .

# Add environment variables in the form of NODE_ENV and DB_HOST, environment variables can be seen using the 'env' command in the container
ENV NODE_ENV=production

# Run the npm install command to install production dependencies and bypass permissions when checking packages
RUN npm install --production --unsafe-perm

# Provide a label to connect GitHub Package with the GitHub repository
LABEL org.opencontainers.image.source=https://github.com/brondol/a433-microservices

# Provide a description for the image in GitHub Package
LABEL org.opencontainers.image.description="shipping service image"

# Commands to be executed while the container is running
CMD [ "npm", "start" ]