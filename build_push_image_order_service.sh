# Build an image based on the Dockerfile in the current directory
docker build -t order-service:latest .

# View the list of local images
docker images ls

# Rename the image to push it to the GitHub container registry
docker tag order-service:latest ghcr.io/brondol/order-service:latest

# Log in to GitHub to push the image to the container registry
echo $REGISTRY_PASS | docker login ghcr.io -u brondol --password-stdin

# Push the image to the GitHub Package repository
docker push ghcr.io/brondol/order-service:latest