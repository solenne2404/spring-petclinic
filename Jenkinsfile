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
                sh 'sudo rm -rf /var/www/target'
                copieArtifacts (projectName: 'pet_clinic', selector: lastSuccessful())
            }
        }
        stage('Deployed') {
            steps {
                sh 'sudo mv /var/www/target/spring-petclinic-*.jar /var/www/target/spring-petclinic-prod.jar'
                sh 'sudo systemctl restart petclinic.service'
            }
        }
    }
}
