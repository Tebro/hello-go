pipeline {
    agent any

    stages {
        stage('Build'){
            steps {
                sh 'docker build -t app .'
            }
        }
        stage('Build robot tests') {
            steps {
                sh 'docker build -t robot robot'
            }
        }
        stage('Robot tests'){
            steps {
                sh 'docker run -d --network=host -p 4444:4444 --name selenium selenium/standalone-firefox:latest' 
                sh 'docker run -d --network=host -p 80:80 --name app app'
                sh 'docker run -it --rm --network=host robot'
            }
            post {
                always {
                    sh 'docker rm -f selenium app'
                    sh 'docker rmi $(docker images -f dangling=true)'
                }
            }
        }
    }
}
