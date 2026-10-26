
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                checkout scm
                sh 'echo "Git checkout completed"'
            }
        }

        stage('Telemetry Build') {
            steps {
                sh 'echo "Building fleet telemetry service"'
                sh 'test -f telemetry.conf'
                sh 'cat telemetry.conf'
            }
        }

        stage('Deploy Artifact') {
            steps {
                archiveArtifacts artifacts: 'telemetry.conf',
                                 fingerprint: true
                sh 'echo "Telemetry artifact archived"'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
