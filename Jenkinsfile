pipeline {
environment {
registry = "sivaramloknath64/new"
registryCredential = 'dockerhub'
dockerImage = ''
}
agent any
  tools {nodejs "node"}
  
stages {
stage('Cloning our Git') {
steps {
git 'https://github.com/sivaramloknath64/Angular-5-Sample-Demo.git'
}
}

   
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
dockerImage.push()
}
}
}
}
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}
