
node {
  
  def mavenHome = tool name: "maven3"
  
  stage('1. SCM - clone code') { 
      echo "Cloning the code now" // the comment will show up in the console
      git branch: 'scripted', changelog: false, poll: false, url: 'https://github.com/SHLLC-Class/tomcat-webapp-war'
  }
  
  stage('2 Maven - build code') { 
      echo "Building code now"
      sh "${mavenHome}/bin/mvn clean package"
  }
  
  stage('3 Sonar - CodeQuality') { 
      echo "Running quality scan"
      sh "${mavenHome}/bin/mvn sonar:sonar"
  }
  
  stage('4 Nexus - Artifactory') { 
      echo "to artifactory"
      sh "${mavenHome}/bin/mvn deploy"
  }
  
}

