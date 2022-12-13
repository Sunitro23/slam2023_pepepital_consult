-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 13 déc. 2022 à 20:39
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
  `date_consult` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_964685A66B899279` (`patient_id`),
  KEY `IDX_964685A64F31A84` (`medecin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `patient_id`, `medecin_id`, `date_consult`) VALUES
(1, 2, 3, '2022-12-13'),
(2, 4, 2, '2022-11-08'),
(3, 3, 4, '2022-12-14'),
(4, 1, 1, '2022-12-16'),
(5, 3, 1, '2022-12-16'),
(6, 3, 2, '2022-12-16'),
(7, 2, 1, '2022-12-17'),
(8, 1, 1, '2022-12-13');

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
('DoctrineMigrations\\Version20221129141756', '2022-11-30 14:02:59', 521),
('DoctrineMigrations\\Version20221129143236', '2022-12-02 08:07:39', 21),
('DoctrineMigrations\\Version20221129144411', '2022-12-02 08:08:05', 21),
('DoctrineMigrations\\Version20221202074736', '2022-12-02 09:26:17', 152),
('DoctrineMigrations\\Version20221202075308', '2022-12-02 08:08:36', 932),
('DoctrineMigrations\\Version20221202092649', '2022-12-02 09:26:52', 190),
('DoctrineMigrations\\Version20221212183820', '2022-12-12 18:38:23', 165),
('DoctrineMigrations\\Version20221213192952', '2022-12-13 19:31:44', 690),
('DoctrineMigrations\\Version20221213193256', '2022-12-13 19:33:02', 89);

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
(2, 5, 1, '1 fois par jour'),
(4, 3, 5, '1 fois par jour'),
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, 2, 'Insuline'),
(15, 4, 'Papouthoxiliane');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `consultation_id`, `duree`, `date_debut`) VALUES
(1, 4, 2, '2022-11-06'),
(5, 5, 3, '2022-08-16'),
(6, 6, 1, '2023-01-06'),
(9, 4, 7, '2023-01-02'),
(11, 3, 5, '2017-01-01'),
(12, 1, 5, '2023-01-24');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'medecin', '[\"ROLE_MEDECIN\"]', '$2y$13$ji4F04yC3iAQ3uFGrizt9.hpkBw3dQnYlWL1NBRxcCGfYbOrB9IM.'),
(2, 'pharmacien', '[\"ROLE_PHARMACIEN\"]', '$2y$13$utP638RsUuSgtylJrS5U1uI.HdTvg99s1v0KjFou3sz8HOBB8D31i'),
(3, 'bernard-medecin', '[\"ROLE_MEDECIN\"]', '$2y$13$SP8y2SwKg/Ld9nCJ3yuRXe6TeYVeHxpPhjrG2Ds7Z0h4lQZLmYMd.'),
(4, 'gerard-pharmacien', '[\"ROLE_PHARMACIEN\"]', '$2y$13$N/5YDLTJIXQVqjZ1/juXqeUs.pbr8I0nfV5kTro8RF0ny90eoTzXW');

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
