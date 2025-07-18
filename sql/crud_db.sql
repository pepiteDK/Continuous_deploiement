-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 13 juil. 2025 à 17:35
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `crud_db`
--
CREATE DATABASE IF NOT EXISTS `crud_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `crud_db`;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Base de données : `gestion_db`
--
CREATE DATABASE IF NOT EXISTS `gestion_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_db`;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Prénom` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Base de données : `qrcode`
--
CREATE DATABASE IF NOT EXISTS `qrcode` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `qrcode`;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `id_historique` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `id_Qrcode` int DEFAULT NULL,
  `date_scan` date DEFAULT NULL,
  PRIMARY KEY (`id_historique`),
  KEY `id_Qrcode` (`id_Qrcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `qrcode`
--

DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE IF NOT EXISTS `qrcode` (
  `id_qrcode` int NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `date_creation` date NOT NULL,
  `id_utilisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_qrcode`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `scanner`
--

DROP TABLE IF EXISTS `scanner`;
CREATE TABLE IF NOT EXISTS `scanner` (
  `id_utilisateur` int DEFAULT NULL,
  `id_historique` int DEFAULT NULL,
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_historique` (`id_historique`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `date_inscription` date DEFAULT (curdate()),
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `Identifiant` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `prenom`, `nom`, `Email`, `mot_de_passe`, `date_inscription`) VALUES
(17, 'Mamadou', 'Tine', 'tinem214@gmail.com', '$2y$10$fgmR7kKCoXh7pXyL9rFNqOrQF/iRMJiHiH3qCsbJ8nmjWyVXm.s3q', '2024-11-29'),
(18, 'Sokhna', 'TOP', 's6695119@gmail.com', '$2y$10$njC1iJtt4P0su1CZ9XH8MeGIHLuUdFvPHsD0I3oZCnPFScHQp0/aC', '2024-12-22'),
(19, 'Abass', 'TOP', 'topabass577@gmail.com', '$2y$10$OVRgaAlyxDo1yZf40rr/F.CLCYZ0E/fRhPGVwchtEXS3/3wAkDR6W', '2024-12-22'),
(20, 'Seynabo', 'TOP', 'topseynabou666@gmail.com', '$2y$10$LBnZIWOjFkPUhojVZl32MO9cPou5P5BIHkWcZ84Sl0V9b0yumuW52', '2024-12-22'),
(21, 'Laouratou', 'Traoré', 'traorelaouratou@gmail.com', '$2y$10$AHPz4GSzHN.UoagUyHfNeu.k95F0ylvotQR5EH8.mW6Nl4Kf5j67q', '2024-12-28');
--
-- Base de données : `qrcoder`
--
CREATE DATABASE IF NOT EXISTS `qrcoder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `qrcoder`;
--
-- Base de données : `qr codes`
--
CREATE DATABASE IF NOT EXISTS `qr codes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `qr codes`;
--
-- Base de données : `qrcode_db`
--
CREATE DATABASE IF NOT EXISTS `qrcode_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `qrcode_db`;
--
-- Base de données : `registration`
--
CREATE DATABASE IF NOT EXISTS `registration` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `registration`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
