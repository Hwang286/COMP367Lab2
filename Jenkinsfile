pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "JDK"
    }
    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/Hwang286/COMP367Lab2.git'

            }
        }
        stage('Maven Build') {
            steps {
                // To run Maven on a Windows agent, use
                 bat "mvn clean compile"
            }

        }
    }
}