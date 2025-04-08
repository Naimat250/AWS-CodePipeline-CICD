pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'naimat1233/flask-app:latest'
        CONTAINER_NAME = 'myapp_container'
        SONAR_HOME = tool name: 'sonar'
    }
    
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Naimat250/DevOpsProjects.git'
                echo 'Clone Successful'
            }
        }
        
        stage('SonarQube Analysis'){
            steps {
                withSonarQubeEnv('sonar'){ // Updated to match the server name in Jenkins
                    sh "${SONAR_HOME}/bin/sonar-scanner -Dsonar.projectName=Flask-App -Dsonar.projectKey=Flask-App"
                }
            }
        }
        
        stage('SonarQube Quality Gates'){
            steps{
                timeout(time: 5, unit: "MINUTES") {
                    waitForQualityGate abortPipeline: false
                }
            }
        }
        
        
        
        
        stage('Docker Compose Down and Up') {
            steps {
                dir('Multistage-Flask-App') {
                    // Bring down any existing containers
                    sh 'docker-compose down'
                    echo 'Docker Compose Down Successful'
                    
                    // Build and run services using Docker Compose
                    sh 'docker-compose up -d --build'
                    echo 'Docker Compose Up Successful'
                }
            }
        }
        
        stage('Image Scanning with Trivy') {
            steps {
                sh 'trivy image naimat1233/flask-app:latest'
                echo 'Image Scannned with Trivy Successfully'
            }
        }
        
        stage(' Dependencies Check with OWASP'){
            steps {
                dependencyCheck additionalArguments: '..scan ./', odcInstallation: 'OWASP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }     
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "DockerHubCreds", passwordVariable: "dockerPass", usernameVariable: "dockerUser")]) {
                    sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                    sh "docker tag naimat1233/flask-app:latest ${env.dockerUser}/flask-app:latest"
                    sh "docker push ${env.dockerUser}/flask-app:latest"
                    echo 'Pushed to Docker Hub successfully'
                }
            }
        }
    }
}
