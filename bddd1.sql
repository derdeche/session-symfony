-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour ssymfony
CREATE DATABASE IF NOT EXISTS `ssymfony` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ssymfony`;

-- Listage de la structure de table ssymfony. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.categorie : ~2 rows (environ)
INSERT INTO `categorie` (`id`, `categorie`) VALUES
	(1, 'Language'),
	(2, 'Bureautique');

-- Listage de la structure de table ssymfony. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table ssymfony.doctrine_migration_versions : ~0 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230928083651', '2023-09-28 08:37:13', 349),
	('DoctrineMigrations\\Version20231003114159', '2023-10-03 11:42:33', 34);

-- Listage de la structure de table ssymfony. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table ssymfony. module
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie_id` int NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C242628BCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_C242628BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.module : ~4 rows (environ)
INSERT INTO `module` (`id`, `categorie_id`, `module`) VALUES
	(1, 2, 'Word'),
	(2, 1, 'Php'),
	(3, 1, 'Html'),
	(4, 1, 'Css');

-- Listage de la structure de table ssymfony. programme
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `module_id` int NOT NULL,
  `nb_jour` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DDCB9FF613FECDF` (`session_id`),
  KEY `IDX_3DDCB9FFAFC2B591` (`module_id`),
  CONSTRAINT `FK_3DDCB9FF613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_3DDCB9FFAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.programme : ~4 rows (environ)
INSERT INTO `programme` (`id`, `session_id`, `module_id`, `nb_jour`) VALUES
	(1, 2, 1, 5),
	(2, 1, 2, 3),
	(3, 3, 3, 10),
	(4, 1, 4, 3);

-- Listage de la structure de table ssymfony. referent
CREATE TABLE IF NOT EXISTS `referent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_referent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_referent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.referent : ~2 rows (environ)
INSERT INTO `referent` (`id`, `nom_referent`, `prenom_referent`) VALUES
	(1, 'MURMANN', 'Mickael'),
	(2, 'MATHIEU', 'Quentin');

-- Listage de la structure de table ssymfony. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referent_id` int NOT NULL,
  `session` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_place` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D435E47E35` (`referent_id`),
  CONSTRAINT `FK_D044D5D435E47E35` FOREIGN KEY (`referent_id`) REFERENCES `referent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.session : ~4 rows (environ)
INSERT INTO `session` (`id`, `referent_id`, `session`, `nb_place`, `date_debut`, `date_fin`) VALUES
	(1, 1, 'Programmation', 5, '2023-09-24', '2023-09-30'),
	(2, 2, 'Remise à niveau', 6, '2023-09-20', '2023-09-23'),
	(3, 1, 'Recyclage', 10, '2023-08-10', '2023-08-20'),
	(4, 1, 'lecture', 3, '2023-01-01', '2018-01-01');

-- Listage de la structure de table ssymfony. session_stagiaire
CREATE TABLE IF NOT EXISTS `session_stagiaire` (
  `session_id` int NOT NULL,
  `stagiaire_id` int NOT NULL,
  PRIMARY KEY (`session_id`,`stagiaire_id`),
  KEY `IDX_C80B23B613FECDF` (`session_id`),
  KEY `IDX_C80B23BBBA93DD6` (`stagiaire_id`),
  CONSTRAINT `FK_C80B23B613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C80B23BBBA93DD6` FOREIGN KEY (`stagiaire_id`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.session_stagiaire : ~4 rows (environ)
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 2),
	(3, 3),
	(4, 3);

-- Listage de la structure de table ssymfony. stagiaire
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `courriel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.stagiaire : ~4 rows (environ)
INSERT INTO `stagiaire` (`id`, `nom`, `prenom`, `ville`, `date_naissance`, `telephone`, `courriel`) VALUES
	(1, 'DERDECHE', 'Foued', 'STRASBOURG', '1984-04-13', '0605020365', 'foued@gmail.com'),
	(2, 'SUCU', 'Cemil', 'STRASBOURG', '1980-05-23', '0506040508', 'cemil@gmail.com'),
	(3, 'CHAMAEV', 'Mansour', 'STRASBOURG', '1990-12-23', '0605040908', 'mansour@gmail.com'),
	(4, 'BAISANGOUR', 'Aliev', 'ILLKIRCH', '1995-12-25', '0750563269', 'aliev@gmail.com');

-- Listage de la structure de table ssymfony. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.user : ~1 rows (environ)
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`) VALUES
	(1, 'foued676767@gmail.com', '[]', '$2y$13$ebaIh/t4.BLX4nqCEgsATu1poLg6wydOkUB052CpDBY4UQTF3DVt.', 'foued');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
