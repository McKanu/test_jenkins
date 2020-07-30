pipeline {
  agent any
  options {
      ansiColor('xterm')
  }
  stages {
    stage('init') {
      steps {
        ansiColor('xterm') {
            sh 'terraform init'
        }
      }
    }
    stage('plan') {
      steps {
        ansiColor('xterm') {
          sh './terraform plan'
        }
      }
    }
    stage('apply') {
      steps {
        ansiColor('xterm') {
          sh './terraform apply -auto-approve'
        }
      }
    }
  }
}
