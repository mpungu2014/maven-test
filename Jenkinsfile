pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
        registry = '567411888330.dkr.ecr.us-east-1.amazonaws.com/devops-ecr2'
        registryCredential = 'aws-credentials'
        dockerimage = ''
    }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/mpungu2014/maven-test.git'
            }
        }
    stage(Sonarqube scan) {
       steps{
       withSonarQubeEnv('sonar'){
    sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=mpungu2014_geolocation2'                    
                     }  
       } 
    }
        stage('Code Build') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy alex') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}
