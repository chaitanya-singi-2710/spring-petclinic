pipeline {
    agent {label 'spc'}
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('git checkout') {
            steps {
                git url: 'https://github.com/chaitanya-singi-2710/spring-petclinic.git',
                    branch: 'main'
            }
        }
        stage('build and scan') {
            steps {
             withCredentials([string(credentialsId: 'sonar_id', variable: 'SONAR_TOKEN')]) { 
             withSonarQubeEnv('SonarQube') {
                sh '''mvn package sonar:sonar \
                   -Dsonar.projectKey=chaitanya-singi-2710_spring-petclinic \
                   -Dsonar.organization=chaitanya-singi-2710 \
                   -Dsonar.host.url=https://sonarcloud.io/ \
                   -Dsonar.login=$SONAR_TOKEN'''
             }   
            }
          }
        }
    }
}