#!/bin/bash
set -e

# Pull the Docker image from ECR
docker pull 133707302068.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 133707302068.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest
