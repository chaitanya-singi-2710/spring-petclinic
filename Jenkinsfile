pipeline {
    agent { label 'spc' }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/chaitanya-singi-2710/spring-petclinic.git',
                    branch: 'main'
            }
        }

        stage('Build and Sonar Scan') {
            steps {
                withCredentials([string(credentialsId: 's_id', variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('Sonarqube') {
                        sh '''
                        mvn clean package sonar:sonar \
                          -Dsonar.projectKey=chaitanya-singi-2710_spring-petclinic \
                          -Dsonar.organization=chaitanya-singi-2710 \
                          -Dsonar.host.url=https://sonarcloud.io \
                          -Dsonar.login=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}