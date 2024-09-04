

#-----------------------------------------
pipeline {
    agent any
    tools {
        maven 'mvn3.9.9'
    }
    stages {
        stage('github clone') {
            steps {
                git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project.git'
            }
        }
        stage('build') {
            steps {
                sh '''
                    echo build start
                    mvn clean compile package -DskipTests=true
                '''

     //         sh 'mvn clean compile package -DskipTests=true'
            }
        }
        stage('deploy') {
            steps {
              deploy adapters: [tomcat9(credentialsId: 'admin_user', path: '', url: 'http://10.250.127.193:8081/')], contextPath: null, war: '**/*.war'
            }
        }
        stage('ssh publisher') {
            steps {
               sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t changwskr/jenkin-pipeline-item2-tomcat .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}



소나큐버 등록
#----------------------------------
pipeline {
    agent any
    tools {
        maven 'maven3.9.9'
    }

    stages {
        stage('github clone') {
            steps {
                git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project.git'
            }
        }
        stage('build') {
            steps {
                sh '''
                    echo build start
                    mvn clean compile package -DskipTests=true
                '''

     //         sh 'mvn clean compile package -DskipTests=true'
            }
        }
        stage('deploy') {
            steps {
              deploy adapters: [tomcat9(credentialsId: 'admin_user', path: '', url: 'http://192.168.0.6:8081/')], contextPath: null, war: '**/*.war'
            }
        }
        stage('ssh publisher') {
            steps {
               sshPublisher(publishers: [sshPublisherDesc(configName: 'doker-server (inner)', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t changwskr/jenkin-pipeline-item2-tomcat .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }
}