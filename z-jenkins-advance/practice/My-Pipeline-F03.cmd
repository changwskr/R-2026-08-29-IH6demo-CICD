pipeline {
    agent any
    stages {
        stage('Git clone') {
            steps {
                git 'https://github.com/joneconsulting/jenkins_pipeline_script.git'

            }
        }

        stage('Compile') {
            steps {
                echo "Compiled successfully!";
                sh './build.sh'
            }
        }

        stage('JUnit') {
            steps {
                echo "JUnit passed successfully!";
                sh './unit.sh'
            }
        }

        stage('Code Analysis') {
            steps {
                echo "Code Analysis completed successfully!";
                sh './quality.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deployed successfully!";
                sh './deploy.sh'
            }
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