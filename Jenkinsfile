
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                checkout scm
                bat 'echo Git checkout completed'
            }
        }

        stage('Telemetry Build') {
            steps {
                bat 'echo Building fleet telemetry service'

                // Verify that telemetry.conf exists
                bat '''
                    if not exist telemetry.conf (
                        echo ERROR: telemetry.conf not found
                        exit /b 1
                    )
                    echo telemetry.conf found
                '''

                // Display configuration file contents
                bat 'type telemetry.conf'
            }
        }

        stage('Deploy Artifact') {
            steps {
                archiveArtifacts artifacts: 'telemetry.conf',
                                 fingerprint: true
                bat 'echo Telemetry artifact archived'
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
