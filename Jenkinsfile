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
  	stage('Maven Build') {

      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Hwang286/COMP367Lab2.git']])
      	bat 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t hwang286/lab2welcome .'
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
      	sh 'docker push hwang286/lab2welcome'
      }
    }
  }
}