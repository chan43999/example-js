pipeline{

    stages{
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