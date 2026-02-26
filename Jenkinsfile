pipeline {
    agent {label 'spc'}
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage ('git checkout') {
            steps {
                git url: 'https://github.com/chaitanya-singi-2710/spring-petclinic.git',
                    branch: 'main'
            }
        }
        stage ('build and scan') {
            steps {
             withSonarQubeEnv('sonar_id')
                sh 'mvn package sonar:sonar'
            }
        }
    }
}