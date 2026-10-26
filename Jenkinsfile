
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                checkout scm
                bat 'echo "Git checkout completed"'
            }
        }

        stage('Telemetry Build') {
            steps {
                bat 'echo "Building fleet telemetry service"'
                bat 'test -f telemetry.conf'
                bat 'cat telemetry.conf'
            }
        }

        stage('Deploy Artifact') {
            steps {
                archiveArtifacts artifacts: 'telemetry.conf',
                                 fingerprint: true
                bat 'echo "Telemetry artifact archived"'
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
