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

-- Listage des données de la table ssymfony.categorie : ~2 rows (environ)
INSERT INTO `categorie` (`id`, `categorie`) VALUES
	(1, 'Language'),
	(2, 'Bureautique');

-- Listage des données de la table ssymfony.doctrine_migration_versions : ~1 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230926081905', '2023-09-27 07:24:19', 433);

-- Listage des données de la table ssymfony.messenger_messages : ~0 rows (environ)

-- Listage des données de la table ssymfony.module : ~2 rows (environ)
INSERT INTO `module` (`id`, `categorie_id`, `module`) VALUES
	(1, 2, 'word'),
	(2, 1, 'Php');

-- Listage des données de la table ssymfony.programme : ~2 rows (environ)
INSERT INTO `programme` (`id`, `session_id`, `module_id`, `nb_jour`) VALUES
	(1, 2, 1, 5),
	(2, 1, 2, 3);

-- Listage des données de la table ssymfony.referent : ~2 rows (environ)
INSERT INTO `referent` (`id`, `nom_referent`, `prenom_referent`) VALUES
	(1, 'MURMANN', 'Mickael'),
	(2, 'MATHIEU', 'Quentin');

-- Listage des données de la table ssymfony.session : ~2 rows (environ)
INSERT INTO `session` (`id`, `referent_id`, `session`, `nb_place`, `date_debut`, `date_fin`) VALUES
	(1, 1, 'Programmation', 5, '2023-09-27 09:33:41', '2023-09-30 09:33:45'),
	(2, 2, 'Remise à niveau', 6, '2023-08-15 09:34:31', '2023-08-20 09:34:43');

-- Listage des données de la table ssymfony.session_stagiaire : ~0 rows (environ)

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
