pipeline {
    agent any

    environment {
        DEPLOY_DIR = "/var/www/html/Continuous_deploiement" // Répertoire web
        REPO_URL = "https://github.com/moussa04gueye/Continuous_deploiement.git"
        BRANCH = "main"
    }

    stages {
        stage('Build') {
            steps {
                echo '🔧 Clonage du dépôt...'
                git url: "${REPO_URL}", branch: "${BRANCH}"
            }
        }

        stage('Test') {
            steps {
                echo '✅ Vérification de la syntaxe PHP...'
                sh 'find . -name "*.php" -exec php -l {} \\;'
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Déploiement de l’application...'
                script {
                    sh """
                        sudo rm -rf ${DEPLOY_DIR}/*
                        sudo cp -r * ${DEPLOY_DIR}/
                        sudo systemctl restart nginx
                    """
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline terminé avec succès !'
        }
        failure {
            echo '❌ Le pipeline a échoué.'
        }
    }
}
