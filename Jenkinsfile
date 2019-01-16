#!groovy

node('build-slave') {
       stage('Checkout'){
          checkout scm
       }
       stage('Delete existing Containers'){
          sh ("docker rm -f $(docker ps -aq)")
        }
       stage('Delete existing images'){
          sh ("docker rmi -f $(docker images -aq)")
        }
        stage('Clearning unused docker images and dead container'){
            sh("docker system prune -af")
        }
       stage('Build DockerFile'){
          sh("docker build -t king/mywebsite:latest .")
       }
       stage('Deploying the webapp in port 80'){
	  sh('docker run -dit --name webapp -p 80:80 king/mywebsite:latest')
    }
}

