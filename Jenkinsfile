pipeline {

    agent any

    environment {
        GIT_REPO = "https://github.com/McKanu/test_jenkins.git"

    }

    stages {
        stage('Preparation') {
            steps {
                git "${GIT_REPO}"
                sh "ls"
                sh '''
                  curl -o tf.zip https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_arm.zip ; yes | unzip tf.zip
                    ./terraform version
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh "cat main.tf"
                sh "./terraform init"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "./terraform apply -auto-approve"
            }
        }
    }
}
