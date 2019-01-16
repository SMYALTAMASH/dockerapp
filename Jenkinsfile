#!groovy

node('master') {
       stage('Checkout'){
          checkout scm
	  sh('whoami')
       }
        stage('Clearning unused docker images and dead container'){
            sh 'docker system prune -af'
        }
       stage('Remove old container'){
          sh 'docker rm -f webapp'
       }
       stage('Build DockerFile'){
          sh 'docker build -t king/mywebsite:latest .'
       }
       stage('Deploying the webapp'){
	  sh 'docker run -d --name webapp -p 80:80 king/mywebsite:latest'
    }
}

