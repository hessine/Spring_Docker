pipeline {

    agent any

    tools {

 

        maven "Maven"

    }
    
    environment {
        
    registry = "hessine/reservation-service"
    
    registryCredential = 'dockerhub'
    
    dockerImage = ''
    
    }
    stages {
        
        stage("clone code") {

            steps {

                script {

             

                    git 'https://github.com/hessine/Spring_Docker.git';

                }

            }

        }

        stage("clean") {

            steps {

                script {

                    // Let's clone the source

                    sh "mvn clean"

                }

            }
        }
        
        stage("mvn build package") {

            steps {

                script {

                 

                    sh "mvn -B package -DskipTests=true"

                }

            }

        }
        
        stage('Create image') {
            
            steps{
        
                script {
                    
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                
                    
                }
            }
        }
        
        stage('Deploy Image') {
      
            steps{
        
                script {
          
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
}
