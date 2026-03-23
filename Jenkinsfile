pipeline {
    agent any

    environment {
     DOCKER_IMAGE = "techhunt/mynodeapp"
        TAG = "0.0.1"
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
        sh """
        ssh -o StrictHostKeyChecking=no root@192.168.122.158 \
        "kubectl set image deployment/mynode-deployment mynode-container=${DOCKER_IMAGE}:${TAG}"
        """
    }
}
}
    }
