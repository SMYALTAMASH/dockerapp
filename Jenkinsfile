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
          sh 'sudo docker build -t king/mywebsite:latest .'
       }
       stage('Deploying the webapp'){
	  sh 'sudo docker run -d --name webapp -p 80:80 king/mywebsite:latest'
    }
}


