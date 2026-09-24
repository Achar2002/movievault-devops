pipeline {

    agent any

    tools {
        jdk 'jdk21'
        maven 'maven'
    }

    environment {
        DOCKER_IMAGE = 'YOUR_USERNAME/movievault'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
                        docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:latest
                        docker push ${DOCKER_IMAGE}:latest
                    '''
                }
            }
        }

    }

    post {
        success {
            echo 'MovieVault CI/CD pipeline completed successfully.'
        }

        failure {
            echo 'MovieVault CI/CD pipeline failed.'
        }
    }
}
