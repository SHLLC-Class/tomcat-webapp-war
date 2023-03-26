
// Scripted pipeline

node {
  
 def mavenHome = tool name: "maven3"
  
  // properties([ pipelineTriggers([githubPush(repository: 'SHLLC-Class/tomcat-webapp-war', branches: 'dev')]) ])
  properties([ pollSCM('* * * * *') ])


   stage('1. clone') { 
        echo "Cloning Dev Branch"
        git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/SHLLC-Class/tomcat-webapp-war'
   }
  
   stage('2. MavenBuild') { 
       echo "build Dev code"
       sh "${mavenHome}/bin/mvn clean package"
   }
  
   stage('3. SonarScan') { 
       echo "Scan code"
       sh "${mavenHome}/bin/mvn sonar:sonar"
   }
   
   stage('4. DeployNexus') { 
       echo "Artifactory"
       sh "${mavenHome}/bin/mvn deploy"
   }
  
  // cont. delivery
  stage('5. Approval') {
       echo "Get Approval"
       timeout(time:5, unit: 'DAYS') {
         input message: 'please approve deployment'
     }
  }
  
  stage('6. Deploy') {
       echo "Deploy"
      deploy adapters: [tomcat9(credentialsId: '34331ea9-1337-4377-89dc-30b2b4adbed2', path: '', url: 'http://34.229.69.50:8080/')], contextPath: '/dev', war: 'target/*war' 
  }
   
}
