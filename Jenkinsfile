pipeline {
    agent any

    stages {
        stage('Build app'){
            steps {
                sh 'docker build -t app:$BRANCH_NAME .'
            }
        }
        stage('Build robot tests') {
            steps {
                sh 'docker build -t robot:$BRANCH_NAME robot'
            }
        }
        stage('Robot tests'){
            steps {
                sh 'docker network create $BRANCH_NAME'
                sh 'docker run -d --network=$BRANCH_NAME --name selenium-$BRANCH_NAME selenium/standalone-firefox:latest' 
                sh 'docker run -d --network=$BRANCH_NAME --name app-$BRANCH_NAME app:$BRANCH_NAME'
                sh 'docker run --rm --network=$BRANCH_NAME -e SELENIUM_REMOTE_URL=http://selenium-$BRANCH_NAME:4444/wd/hub -e APPLICATION_HOST=app-$BRANCH_NAME robot:$BRANCH_NAME'
            }
            post {
                always {
                    sh 'docker rm -f selenium-$BRANCH_NAME app-$BRANCH-NAME || true'
                    sh 'docker network rm $BRANCH_NAME || true'
                    sh 'docker rmi $(docker images -q -f dangling=true) || true'
                }
            }
        }
    }
}
