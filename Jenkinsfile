pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/var/www/html'  // à adapter si tu utilises un autre chemin
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git branch: 'main', url: 'https://github.com/moussa04gueye/Continuous_deploie>
            }
        }

        stage('Déploiement') {
            steps {
                echo 'Déploiement de l’application…'
                // Supprimer les anciens fichiers
                sh 'sudo rm -rf $DEPLOY_DIR/*'
                // Copier les nouveaux fichiers
                sh 'sudo cp -r * $DEPLOY_DIR/'
            }
        }

        stage('Redémarrer Nginx') {
            steps {
                echo 'Redémarrage de Nginx…'
                sh 'sudo systemctl restart nginx'
            }
        }
    }
}

