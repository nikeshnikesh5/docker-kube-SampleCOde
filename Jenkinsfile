pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "https://hub.docker.com/u/techhunt/mynodeapp"
        TAG = "latest"
    }

    stages {

        stage('Clone Code') {
    steps {
        git branch: 'develop', url: 'https://github.com/nikeshnikesh5/docker-kube-SampleCOde.git'
    }
}

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-cred',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$TAG'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s-app.yaml
                '''
            }
        }

    }
}