# Build an image based on the Dockerfile in the current directory
docker build -t item-app:v1 .

# View the list of local images
docker images ls

# Rename the image to push it to the GitHub container registry
docker tag item-app:v1 ghcr.io/brondol/item-app:v1

# Log in to GitHub to push the image to the container registry
echo $REGISTRY_PASS | docker login ghcr.io -u brondol --password-stdin

# Push the image to the GitHub Package repository
docker push ghcr.io/brondol/item-app:v1
