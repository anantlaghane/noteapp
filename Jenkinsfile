
pipeline {
    agent any
    environment {
        DB_NAME = 'notes_db'
        DB_USER = 'root'
        DB_PASSWORD = 'rootpass'
        DB_HOST = 'host.docker.internal'
        DB_PORT = '3306'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: "https://github.com/anantlaghane/django-notes-app.git", branch: "main"
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t notes-app:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                docker rm -f notes-app-running || true
                docker run -d --name notes-app-running -p 8000:8000                   -e DB_NAME=$DB_NAME                   -e DB_USER=$DB_USER                   -e DB_PASSWORD=$DB_PASSWORD                   -e DB_HOST=$DB_HOST                   -e DB_PORT=$DB_PORT                   notes-app:latest
                '''
            }
        }
    }
}
