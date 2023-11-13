pipeline {
    agent any
    tools {
            maven "MAVEN3"
            jdk "JDK"
        }
    stages {
             stage('Checkout') {
                 steps {
                     checkout scm
                 }
             }

             stage('Build Maven Project') {
                 steps {
                     script {
                         def mavenHome = tool 'Maven'
                         def mavenCMD = "${mavenHome}/bin/mvn"
                         sh "${mavenCMD} clean package"
                     }
                 }
             }

             stage('Add Docker Hub Credentials') {
                 steps {
                     withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                         // The credentials are automatically loaded into environment variables DOCKER_USERNAME and DOCKER_PASSWORD
                     }
                 }
             }

             stage('Docker Build') {
                 steps {
                     script {
                         def dockerImage = docker.build("your-docker-username/your-webapp:latest")
                     }
                 }
             }

             stage('Docker Login') {
                 steps {
                     script {
                         withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                             sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                         }
                     }
                 }
             }

             stage('Docker Push') {
                 steps {
                     script {
                         def dockerImage = docker.build("hwang286/lab2welcome:latest")
                         docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials-id') {
                             dockerImage.push()
                         }
                     }
                 }
             }
         }
}