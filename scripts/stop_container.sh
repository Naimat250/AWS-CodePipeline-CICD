
#!/bin/bash
set -e

# Get the container ID running the image and store in a variable
CONTAINER_ID=$(docker ps | awk '/naimat1233\/simple-python-flask-app/ {print $1}')

# If a container ID was found, stop and remove it
if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping container: $CONTAINER_ID"
  docker stop "$CONTAINER_ID"

  echo "Removing container: $CONTAINER_ID"
  docker rm "$CONTAINER_ID"
else
  echo "No running container found for naimat1233/simple-python-flask-app"
fi
