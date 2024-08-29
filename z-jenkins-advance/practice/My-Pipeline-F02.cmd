

pipeline {
    agent any // 어떤 노드에서 실행할 것인가
    stages {
    
        stage('Compile') {
            steps {
                echo "Compiled successfully!";
            }
        }

        stage('JUnit') {
            steps {
                echo "JUnit passed successfully!";
            }
        }

        stage('Code Analysis') {
            steps {
                echo "Code Analysis completed successfully!";
            }
        }

        stage('Deploy') {
            steps {
                echo "Deployed successfully!";
            }
        }

        post {
           always {
             echo "This will always run"
           }
           success {
             echo "This will run when the run finished successfully"
           }
           failure {
             echo "This will run if failed"
           }
           unstable {
             echo "This will run when the run was marked as unstable"
           }
           changed {
             echo "This will run when the state of the pipeline has changed"
           }
        }
    }
}