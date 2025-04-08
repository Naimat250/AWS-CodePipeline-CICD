# Use an official Python runtime as a parent image
FROM python:3.9 AS backend-builder

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Flask and other dependencies (if needed)
RUN pip install --no-cache-dir flask

# Use a smaller Python image for the final build
FROM python:3.9-slim

# Set the working directory in the final image
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=backend-builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY --from=backend-builder /app /app

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable (if needed)
# ENV key=value

# Run app.py when the container launches
CMD ["python", "app.py"]

