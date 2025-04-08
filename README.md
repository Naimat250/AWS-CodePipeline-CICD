# Jenkins Pipeline

## Pipeline Overview

This Jenkins pipeline automates the build, test, and deployment process of a Flask application. It includes the following stages:

1. **Clone**: Clones the repository from GitHub.
2. **SonarQube Analysis**: Analyzes the code using SonarQube for code quality and security checks.
3. **SonarQube Quality Gates**: Waits for the quality gate status from SonarQube to pass.
4. **Docker Compose Down and Up**: Manages Docker containers using Docker Compose.
5. **Image Scanning with Trivy**: Scans Docker images for vulnerabilities using Trivy.
6. **Dependencies Check with OWASP**: Checks dependencies for security vulnerabilities using OWASP Dependency Check.
7. **Push to Docker Hub**: Pushes Docker images to Docker Hub.

## Usage

1. **Clone the Repository**: Clone this repository to your Jenkins server.
2. **Configure Jenkins**: Set up Jenkins with necessary plugins including SonarQube, Docker, Trivy, and OWASP Dependency Check.
3. **Set Credentials**: Configure Jenkins credentials (`DockerHubCreds`) for Docker Hub authentication.
4. **Create Pipeline**: Create a new pipeline job in Jenkins, referencing this repository and the Jenkinsfile.
5. **Run Pipeline**: Trigger the pipeline to build, test, and deploy your Flask application.
