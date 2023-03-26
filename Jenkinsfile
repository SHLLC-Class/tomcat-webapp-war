
// Scripted pipeline

node {
  
 def mavenHome = tool name: "maven3"
  
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
  
  stage('5. Approval') {
       timeout(time:5, unit: 'DAYS') {
         input message: 'please approve deployment'
     }
  }
   
}
