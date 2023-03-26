//node {
     //#import tool maven def mavenhome = ...
    // # properties ==> build trigger
  //   #stage(1)
//     # stage(2) {
//.         sh "... clean pacge"
//}

pipeline {
 
  agent any
  
  tools {
     maven 'maven3'
  } 
  
  triggers {
      pollSCM('* * * * *')
  }
  
  // options {}
  
  stages {
  
    stage('1 Clone') {
        steps {
          git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/SHLLC-Class/tomcat-webapp-war'
        }
    }
    
    stage('2 Build') {
        steps {
          sh "mvn clean package"
        }
    }
    
    stage('3 Sonar') {
        steps {
          sh "mvn sonar:sonar"
        }
    }
    
    stage('4 Nexus') {
        steps{
          sh "mvn deploy"
        }
    }
    
    stage('5 tomcat') {
        steps{
            deploy adapters: [tomcat9(credentialsId: '34331ea9-1337-4377-89dc-30b2b4adbed2', path: '', url: 'http://34.229.69.50:8080/')], contextPath: '/scripted', war: 'target/*war'
        }
    }
  }
 
}
