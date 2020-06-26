node('ansible') {
    stage('get kubectl pod names') {
        sh "kubectl get pods"
    }
}
