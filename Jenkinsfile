pipeline {
	agent none
	tools {
                maven "MAVEN3"
                jdk "JDK"
    }
	stages {
  	stage('Maven Install') {

      steps {
      	bat 'mvn clean install'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t hwang286/lab2welcome:latest .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push hwang286/lab2welcome:latest'
        }
      }
    }
  }
}