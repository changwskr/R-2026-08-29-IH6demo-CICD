
# 1. 사전작업
Dashboard
    Jenkins 관리
        Tools
            Tools
                Maven installations
                Maven installations
                    Edited
                        Add Maven
                            Maven
                                Name
                                    Maven3.8.5

                    Install automatically
                        ?
                        Install from Apache
                        Version
                            3.8.5

# 2. 파이프라인 작성

pipeline {
    agent any
    tools {
      maven 'Maven3.8.5'   # tools에서 입력한 maven 이름 입력
    }
    stages {
        stage('github clone') {
            steps {
                git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project.git';
            }
        }

        stage('build') {
            steps {
                sh '''
                    echo build start
                    mvn clean compile package -DskipTests=true
                '''
            }
        }
    }
}