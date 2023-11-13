pipeline {
	agent none
	stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	bat 'mvn clean install'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	bat 'docker build -t hwang286/lab2welcome:latest .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          bat 'docker push hwang286/lab2welcome:latest'
        }
      }
    }
  }
}