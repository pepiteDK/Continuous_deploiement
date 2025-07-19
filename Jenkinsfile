pipeline {
    agent any

    environment {
        DEPLOY_DIR = "/usr/share/nginx/html"  // Dossier Nginx RHEL
    }

    stages {
        stage('Préparation') {
            steps {
                echo '✅ Étape 1 : Nettoyage du workspace Jenkins'
                cleanWs()
            }
        }

        stage('Cloner le dépôt Git') {
            steps {
                echo '✅ Étape 2 : Clonage du code depuis GitHub'
                git branch: 'main', url: 'https://github.com/TON_UTILISATEUR/TON_DEPOT.git'
            }
        }

        stage('Déploiement dans Nginx') {
            steps {
                echo '✅ Étape 3 : Déploiement des fichiers PHP dans Nginx'

                // Supprime les anciens fichiers (optionnel)
                sh """
                    sudo rm -rf ${DEPLOY_DIR}/*
                    sudo cp -r * ${DEPLOY_DIR}/
                """
            }
        }

        stage('Droits d’accès') {
            steps {
                echo '✅ Étape 4 : Changement des permissions'
                sh """
                    sudo chown -R nginx:nginx ${DEPLOY_DIR}
                    sudo chmod -R 755 ${DEPLOY_DIR}
                """
            }
        }

        stage('Redémarrage de Nginx') {
            steps {
                echo '✅ Étape 5 : Redémarrage du serveur web Nginx'
                sh 'sudo systemctl restart nginx'
            }
        }
    }

    post {
        success {
            echo '✅ Déploiement terminé avec succès !'
        }
        failure {
            echo '❌ Le déploiement a échoué.'
        }
    }
}
