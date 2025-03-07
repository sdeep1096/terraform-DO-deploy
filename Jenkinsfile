pipeline {
    agent any
    environment {
        DO_token = credentials('DO_token')
    }
    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scm // Use Jenkins' built-in Git support
                }
            }
        }
        stage('Initialise Terraform') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Formatting Terraform Code') {
            steps {
                script {
                    sh 'terraform fmt'
                }
            }
        }
        stage('Validating Terraform') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
        stage('Previewing the Infra using Terraform') {
            steps {
                script {
                    sh "terraform plan -var=\"do_token=${DO_token}\""
                }
            }
        }
        stage('Creating or Destroying the Kubernetes Cluster') {
            steps {
                script {
                    sh "terraform ${action} --auto-approve -var=\"do_token=${DO_token}\""
                }
            }
        }
    }
}
