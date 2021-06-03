pipeline{

    agent none

    options {
        skipDefaultCheckout true
    }

    stages{
        stage('Quality Control') {
            agent {
                label 'nodejs'
            }
            stages{
                stage('Checkout'){
                    checkout scm
                }
                stage('Download Dependencies'){
                    steps{
                        sh 'yarn add --modules-folder ./node_modules ./app/hello-1'
                        sh 'yarn add --modules-folder ./node_modules ./app/hello-2'
                    }
                }
                stage('Unit Test') {
                    steps{
                        sh 'yarn run test'
                    }
                }
            }
        }
        stage('Build hello-1 app'){
            steps{
                sh "docker login -u {USERNAME} -p {PASSWORD} && docker build -t {IMAGE_REGISTRY}/hello-1:beta -f Dockerfile ./app/hello-1 && docker push {IMAGE_REGISTRY}/hello-1:beta"
            }
        }
        stage('Build hello-2 app'){
            steps{
                sh "docker login -u {USERNAME} -p {PASSWORD} && docker build -t {IMAGE_REGISTRY}/hello-2:beta -f Dockerfile ./app/hello-2 && docker push {IMAGE_REGISTRY}/hello-2:beta"
            }
        }
    }
}