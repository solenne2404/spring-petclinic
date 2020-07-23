pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
            sh 'mvn package'
            archiveArtifacts artifacts: 'target/spring-petclinic-*.jar', fingerprint: true
            }
        }
        stage('Test') {
            steps {
                junit 'target/surefire-reports/*.xml'
            }
        }
        stage('Copie') {
            steps {
                sh 'sudo rm -rf /var/www/target/*.jar'
                copyArtifacts (projectName: 'pet_clinic', selector: lastSuccessful(),
                target: '/var/www')
            }
        }
        stage('Deployed') {
            steps {
                sh 'mv /var/www/target/spring-petclinic-*.jar /var/www/target/spring-petclinic-prod.jar'
                sh 'sudo systemctl restart petclinic'
            }
        }
    }
}
