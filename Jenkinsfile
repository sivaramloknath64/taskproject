pipeline {
  environment {
    registry = "sivaramloknath64/taskproject"
    registryCredential = 'docker_hub_loknath'
    dockerImage = ''
  }
agent any
  
  tools {nodejs "node12"}
 
stages {

          stage('npm install package'){
                steps{
                  echo "installing the npm package "
                    sh 'npm install'
                         
                     
                    }
            }
                stage('Build'){
                    steps{
                      
                        sh 'npm run build --prod'  
                    }
                }
      
   stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
   
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      
      }
    }


   stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
  
  
    stage ('Deploy to dev Environment') {
      steps{
        echo "deploying to dev environment"
        
     sh "docker rm -f angulardemo || true"
     sh " docker run -d --name=angulardemo -p 8083:8080 sivaramloknath64/taskproject"     
              
        
        }
      }
  
  
  
  
  
  
   
  
  
  
}
}

