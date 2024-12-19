 
# This script initializes a local Docker registry for Kubernetes
 
# Set registry name and port
REGISTRY_NAME='my-registry'
REGISTRY_PORT='5000'
 
# Create a Docker registry container
docker run -d -p ${REGISTRY_PORT}:5000 --name ${REGISTRY_NAME} --restart=always registry:2
 
# Verify the registry is running
if [ "$(docker ps -q -f name=${REGISTRY_NAME})" ]; then
    echo "Local Docker registry '${REGISTRY_NAME}' is running on port ${REGISTRY_PORT}."
else
    echo "Failed to start local Docker registry '${REGISTRY_NAME}'."
    exit 1
fi