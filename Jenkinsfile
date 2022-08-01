pipeline {
    agent any

        stages {

            stage('install kubectl') {
                steps {
                    sh """
                     kubectl create namespace app
                     kubectl apply -f test.yaml
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