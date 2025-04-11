
#!/bin/bash
set -e

# Get the container ID running the image and store in a variable
CONTAINER_ID=$(docker ps | awk '133707302068.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest {print $1}')

# If a container ID was found, stop and remove it
if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping container: $CONTAINER_ID"
  docker stop "$CONTAINER_ID"

  echo "Removing container: $CONTAINER_ID"
  docker rm "$CONTAINER_ID"
else
  echo "No running container found for 133707302068.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest"
fi
