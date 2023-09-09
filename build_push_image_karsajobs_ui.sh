# Build an image based on the Dockerfile in the current directory
docker build -t karsajobs-ui:latest .

# View the list of local images
docker images ls

# Rename the image to push it to the GitHub container registry
docker tag karsajobs-ui:latest ghcr.io/brondol/karsajobs-ui:latest

# Log in to GitHub to push the image to the container registry
echo $REGISTRY_PASS | docker login ghcr.io -u brondol --password-stdin

# Push the image to the GitHub Package repository
docker push ghcr.io/brondol/karsajobs-ui:latest