pipeline {
    agent any

        stages {

            stage('install kubectl') {
                steps {
                    sh """
                     apt-get update
                     apt-get install -y ca-certificates curl
                     apt-get install -y apt-transport-https
                     curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
                     echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" |  tee /etc/apt/sources.list.d/kubernetes.list
                     apt-get update
                     apt-get install -y kubectl
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