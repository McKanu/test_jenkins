pipeline {
  agent any
  options {
      ansiColor('xterm')
  }
  stages {
    stage('init') {
      steps {
        ansiColor('xterm') {
            sh 'terraform init -input=false'
        }
      }
    }
    stage('plan') {
      steps {
        ansiColor('xterm') {
          sh 'terraform plan -input=false'
        }
      }
    }
    stage('apply') {
      steps {
        ansiColor('xterm') {
          sh 'terraform apply -input=false -auto-approve'
        }
      }
    }
  }
}
