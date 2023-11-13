pipeline {
	agent any
	environment{
	    DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
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
    stage('Docker Login') {
        	agent any
          steps {
          	sh "echo $DOCKERHUB_CREDENTIALS_PSW |docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
          }
        }
    stage('Docker Push') {
    	agent any
      steps {
      	sh 'docker push hwang286/lab2welcome:latest'
      }
    }
  }
}