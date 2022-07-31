pipeline {
    agent any

        stages {

            stage('test k8') {
                steps {
                    script{
                        kubernetesDeploy(configs: "test.yaml", kubeconfigId: "kuberenetes")
                }
            }
        }
    }
}