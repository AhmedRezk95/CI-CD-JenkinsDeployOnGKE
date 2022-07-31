pipeline {
    agent any

        stages {

            stage('test k8') {
                steps {
                    sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                    sh 'chmod u+x ./kubectl'  
                    sh "kubectl apply -f test.yaml"
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