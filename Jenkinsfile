#!groovy

node('master') {
       stage('Checkout'){
          checkout scm
	  sh('whoami')
       }
        stage('Clearning unused docker images and dead container'){
            sh 'sudo docker system prune -af'
        }
	stage('deleting old container')
	{
	  sh 'sudo docker rm -f webapp'
	}
       stage('Build DockerFile'){
          sh 'sudo docker build -t smyaltamash/webapp:latest .'
       }
       stage('push to repo'){
	sh 'sudo bash pushToRepo.sh'
       }
       stage('pull from repo'){
	sh 'sudo bash pullFromRepo.sh'
       }
       stage('Deploying the webapp'){
	  sh 'sudo docker run -d --name webapp -p 80:80 smyaltamash/webapp:latest'
    }
}
