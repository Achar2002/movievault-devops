pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/Achar2002/movievault-devops.git'
            }
        }
        stage('Maven compilation') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Maven testing') {
            steps {
                sh 'mvn test'
            }
        }
         stage('Maven packaging') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
    steps {
       sh "docker build -t movievault:${BUILD_NUMBER} ."
    }
}
stage('Docker Push') {
    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'docker-cred',
                usernameVariable: 'DOCKER_USERNAME',
                passwordVariable: 'DOCKER_PASSWORD'
            )
        ]) {
            sh """
                echo "\$DOCKER_PASSWORD" | docker login -u "sanathachari" --password-stdin

                docker tag movievault:${BUILD_NUMBER} sanathachari/movievault:${BUILD_NUMBER}

                docker push sanathachari/movievault:${BUILD_NUMBER}

                docker tag movievault:${BUILD_NUMBER} sanathachari/movievault:latest

                docker push sanathachari/movievault:latest

                docker logout
            """
        }
    }
}
stage('Kubernetes Deploy') {
    steps {
        sh '''
            kubectl apply -f k8s/deployment.yaml
            kubectl apply -f k8s/service.yaml
            kubectl rollout status deployment/movievault-deployment
        '''
    }
}
    }
}
