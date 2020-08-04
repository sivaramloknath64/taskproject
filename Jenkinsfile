
pipeline {
   agent any
   tools {nodejs "node"}
 
   stages {
       stage('Git-Checkout') {
         steps {
            git 'https://github.com/sivaramloknath64/Angular-5-Sample-Demo.git'
         }
      }
	   stage('npm install package'){
                steps{
                    sh label: 'master', script: '''
                         npm install
                         
                     '''
                    }
            }
                stage('Build'){
                    steps{
                        sh 'npm run ng -- build --prod'  
                    }
                }
                
            stage('Build docker image and push to docker hub') {
         steps {
            sh label: 'master', script: '''
            docker login -u sivaramloknath64 -p 8099558143
            docker build -t sivaramloknath64/test .
            docker push sivaramloknath64/test
            '''
         }
      }    
	  
}
}
