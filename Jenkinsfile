pipeline {
    agent { label 'SPC' }

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

        // stage('build and scan') {
        //     steps {
        //         withCredentials([string(credentialsId: 's_id', variable: 'SONAR_TOKEN')]) { 
        //             withSonarQubeEnv('Sonarqube') {
        //                 sh '''mvn package sonar:sonar \
        //                 -Dsonar.projectKey=chaitanya-singi-2710_spring-petclinic \
        //                 -Dsonar.organization=chaitanya-singi-2710 \
        //                 -Dsonar.host.url=https://sonarcloud.io/ \
        //                 -Dsonar.login=$SONAR_TOKEN'''
        //             }  
        //         }
        //     }
        // }

        // stage('Quality Gate') {
        //     steps {
        //         timeout(time: 5, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

        stage('docker image pull') {
            steps {
                sh '''
                docker pull nginx:1.29 && \
                aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 635457411502.dkr.ecr.ap-south-1.amazonaws.com && \
                docker tag nginx:1.29 635457411502.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest && \
                docker push 635457411502.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest
                '''
            }
        }

    }  // ✅ stages block ends correctly
}