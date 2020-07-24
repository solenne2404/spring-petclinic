pipeline {
  agent any

  stages {
    stage('Checkout code') {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn -B jacoco:report checkstyle:checkstyle install'
        // archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
        sh 'docker image save'
        sh 'docker build -t petclinic .'
      }
    }
    stage('Publish Test Coverage Report and Code Analysis') {
      steps {
        jacoco()
        recordIssues(tools: [checkStyle(), junitParser(), mavenConsole()])
      }
    }
    stage('Deploy') {
      steps {
         // copyArtefact....
         // sh 'sudo systemctl restart petclinic'
         sh 'docker stop $(cat .dockerpidfile)'
         sh 'docker run -p 8088:8080 -d petclinic > .dockerpidfile'
      }
    }
  }
}
