pipeline {
    agent any

        stages {

            stage('install kubectl') {
                steps {
                    sh """
                    sudo apt-get update
                    sudo apt-get install -y ca-certificates curl
                    sudo apt-get install -y apt-transport-https
                    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
                    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
                    sudo apt-get update
                    sudo apt-get install -y kubectl
                    """
                }
            }

            // stage('Deploy Staging') {
            // steps{
            //     git url: 'https://github.com/viglesiasce/sample-app'
            //     step([$class: 'KubernetesEngineBuilder', 
            //             projectId: "my-project-id",
            //             clusterName: "staging",
            //             zone: "us-central1-f",
            //             manifestPattern: 'k8s/staging/',
            //             credentialsId: "gke-service-account",
            //             verifyDeployments: true])
            //     }
            // }
        }
    
}