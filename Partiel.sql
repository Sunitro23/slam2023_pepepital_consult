-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 30 nov. 2022 à 18:27
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `partiel`
--
CREATE DATABASE IF NOT EXISTS `partiel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `partiel`;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `medecin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_964685A66B899279` (`patient_id`),
  KEY `IDX_964685A64F31A84` (`medecin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `patient_id`, `medecin_id`) VALUES
(1, 2, 3),
(2, 4, 2),
(3, 3, 4),
(4, 1, 1),
(5, 3, 1),
(6, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221129141756', '2022-11-30 14:02:59', 521);

-- --------------------------------------------------------

--
-- Structure de la table `indication`
--

DROP TABLE IF EXISTS `indication`;
CREATE TABLE IF NOT EXISTS `indication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicaments_id` int(11) NOT NULL,
  `traitement_id` int(11) NOT NULL,
  `posologie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D15065D7C403D7FB` (`medicaments_id`),
  KEY `IDX_D15065D7DDA344B6` (`traitement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `indication`
--

INSERT INTO `indication` (`id`, `medicaments_id`, `traitement_id`, `posologie`) VALUES
(1, 13, 3, '3 fois par jour'),
(2, 5, 1, '1 fois par jour'),
(3, 11, 3, '3 fois par semaine'),
(4, 3, 5, '1 fois par jour'),
(5, 2, 4, '1 fois par mois'),
(6, 14, 6, '2 fois par jour');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`) VALUES
(1, 'Armand Massé'),
(2, 'Lael Vandervorst'),
(3, 'Basile Mercado'),
(4, 'Julien Miroux');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `methode_application_id` int(11) NOT NULL,
  `libelle` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9A9C723A72D2113D` (`methode_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `methode_application_id`, `libelle`) VALUES
(1, 1, 'Amoxicilline'),
(2, 1, 'Tramadole'),
(3, 1, 'Levothyrox'),
(4, 1, 'Ibuprofène'),
(5, 1, 'Paracétamol'),
(6, 1, 'Prednisolone'),
(7, 1, 'Alprazolam'),
(8, 1, 'Ketoprofène'),
(9, 3, 'Sébium'),
(10, 3, 'Acide Hyaluronique'),
(11, 5, 'Dulcolax'),
(12, 5, 'Algotropyl'),
(13, 4, 'Vick Inhaler'),
(14, 2, 'Insuline');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methode_application`
--

DROP TABLE IF EXISTS `methode_application`;
CREATE TABLE IF NOT EXISTS `methode_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `methode_application`
--

INSERT INTO `methode_application` (`id`, `libelle`) VALUES
(1, 'Orale'),
(2, 'Injectable'),
(3, 'Dermique'),
(4, 'Inhalée'),
(5, 'Rectale');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `nom`) VALUES
(1, 'Yasmine Achahboun'),
(2, 'Auxance Massé'),
(3, 'Angel Eduards'),
(4, 'Thibault Leriche');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_id` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A356D2762FF6CDF` (`consultation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `consultation_id`, `duree`, `date_debut`) VALUES
(1, 4, 2, '2022-11-06'),
(2, 1, 1, '2022-11-24'),
(3, 3, 1, '2020-11-11'),
(4, 4, 2, '2022-11-12'),
(5, 5, 3, '2022-08-16'),
(6, 6, 1, '2023-01-06');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FK_964685A64F31A84` FOREIGN KEY (`medecin_id`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `FK_964685A66B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `indication`
--
ALTER TABLE `indication`
  ADD CONSTRAINT `FK_D15065D7C403D7FB` FOREIGN KEY (`medicaments_id`) REFERENCES `medicament` (`id`),
  ADD CONSTRAINT `FK_D15065D7DDA344B6` FOREIGN KEY (`traitement_id`) REFERENCES `traitement` (`id`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `FK_9A9C723A72D2113D` FOREIGN KEY (`methode_application_id`) REFERENCES `methode_application` (`id`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `FK_2A356D2762FF6CDF` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
