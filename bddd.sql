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
CREATE DATABASE IF NOT EXISTS `ssymfony` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ssymfony`;

-- Listage de la structure de table ssymfony. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.categorie : ~2 rows (environ)
INSERT INTO `categorie` (`id`, `categorie`) VALUES
	(1, 'Language'),
	(2, 'Bureautique');

-- Listage de la structure de table ssymfony. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table ssymfony.doctrine_migration_versions : ~1 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230926081905', '2023-09-27 07:24:19', 433);

-- Listage de la structure de table ssymfony. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C242628BCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_C242628BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.module : ~3 rows (environ)
INSERT INTO `module` (`id`, `categorie_id`, `module`) VALUES
	(1, 2, 'word'),
	(2, 1, 'Php'),
	(3, 1, 'Html');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.programme : ~3 rows (environ)
INSERT INTO `programme` (`id`, `session_id`, `module_id`, `nb_jour`) VALUES
	(1, 2, 1, 5),
	(2, 1, 2, 3),
	(3, 3, 3, 5);

-- Listage de la structure de table ssymfony. referent
CREATE TABLE IF NOT EXISTS `referent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_referent` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_referent` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `session` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_place` int NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D435E47E35` (`referent_id`),
  CONSTRAINT `FK_D044D5D435E47E35` FOREIGN KEY (`referent_id`) REFERENCES `referent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.session : ~3 rows (environ)
INSERT INTO `session` (`id`, `referent_id`, `session`, `nb_place`, `date_debut`, `date_fin`) VALUES
	(1, 1, 'Programmation', 5, '2023-09-27 09:33:41', '2023-09-30 09:33:45'),
	(2, 2, 'Remise à niveau', 6, '2023-08-15 09:34:31', '2023-08-20 09:34:43'),
	(3, 1, 'Recyclage', 10, '2023-10-10 14:42:42', '2023-10-15 14:42:51');

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

-- Listage des données de la table ssymfony.session_stagiaire : ~5 rows (environ)
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 1),
	(1, 4),
	(2, 2),
	(3, 1),
	(3, 3);

-- Listage de la structure de table ssymfony. stagiaire
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` datetime NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courriel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ssymfony.stagiaire : ~4 rows (environ)
INSERT INTO `stagiaire` (`id`, `nom`, `prenom`, `ville`, `date_naissance`, `telephone`, `courriel`) VALUES
	(1, 'DERDECHE', 'Foued', 'strasbourg', '1984-09-27 09:26:36', '0102030405', 'foued@gmail.com'),
	(2, 'SUCU', 'Cemil', 'Strasbourg', '1990-09-13 09:27:39', '0605425963', 'cemil@gmail.com'),
	(3, 'CHAMAEV', 'Mansour', 'strasbourg', '1995-09-27 09:29:17', '0750563269', 'mansour@gmail.com'),
	(4, 'BAISANGOUR', 'Aliev', 'Illkirch', '1996-05-03 09:31:42', '0650203020', 'aliev@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;