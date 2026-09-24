pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Achar2002/movievault-devops.git'
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
    }
}
