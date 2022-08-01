pipeline {
    agent any

        stages {

            stage('install k8') {
                steps {
                    sh """
                     kubectl apply -f application-deployment.yaml
                     kubectl apply -f application-service.yaml
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