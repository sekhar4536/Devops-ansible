pipeline {
  agent { label 'vagrant' }

  environment {
    PROVIDER = 'aws'
  }

  stages {
    stage('Test') {
      steps {
        checkout scm
        dir('deploy') {
          sh './vagrant-test.sh'
        }
      }
    }
  }
}
