pipeline {
    agent {
        node {
            label 'maven'
        }
    }
        environment {
    
    PATH = "/opt/apache-maven-3.9.4/bin:$PATH"
}
    stages {
        stage('Hello') {
            steps {
                git 'https://github.com/adityanaidu20690/calculator.git'
            }
        }

        stage('maven') {
            steps {
                echo "---------build started-------------"
                sh 'mvn clean install -Dmaven.test.skip=true'
                echo "---------build completed-------------"
            }
        }
	 stage('SonarQube analysis') {
            environment {

    scannerHome = tool 'sonartest'
}
            steps {
                withSonarQubeEnv('sonartest') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
    }
            }
        }
        stage("Quality Gate"){
            steps{
                    script{
                        timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
                    }
            }

        }
	stage('Docker Build'){
          steps{
	sh '''docker build -t calc .
docker tag calc adityanaidu20690/calc:latest
'''
	}
    }
    stage ('Image scanning'){
        steps{
            sh '''trivy image adityanaidu20690/calc:latest'''
        }
    }
	stage('Docker Hub'){
          steps{
	sh '''docker build -t calc .
docker tag calc adityanaidu20690/calc:latest
docker push adityanaidu20690/calc:latest'''
	}
	}
    stage('Deploy'){
        steps{
            sh 'docker run -d -it --name addycalc -p 8085:8085 adityanaidu20690/calc:latest'
        }
    }
    
        }
}