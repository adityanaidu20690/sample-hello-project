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
    }
}
