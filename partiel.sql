-- phpMyAdmin SQL Dump
-- version 5.2.0-1.fc36
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 02 déc. 2022 à 09:33
-- Version du serveur : 10.5.16-MariaDB
-- Version de PHP : 8.1.12

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

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medecin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
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
('DoctrineMigrations\\Version20221202092649', '2022-12-02 09:26:52', 190);

-- --------------------------------------------------------

--
-- Structure de la table `indication`
--

CREATE TABLE `indication` (
  `id` int(11) NOT NULL,
  `medicaments_id` int(11) NOT NULL,
  `traitement_id` int(11) NOT NULL,
  `posologie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `medecin` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL,
  `methode_application_id` int(11) NOT NULL,
  `libelle` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methode_application`
--

CREATE TABLE `methode_application` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `traitement` (
  `id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `date_debut` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `consultation_id`, `duree`, `date_debut`) VALUES
(1, 4, 2, '2022-11-06'),
(2, 1, 1, '2022-11-24'),
(3, 3, 1, '2020-11-11'),
(4, 4, 2, '2022-11-12'),
(5, 5, 3, '2022-08-16'),
(6, 6, 1, '2023-01-06'),
(8, 1, 6, '2023-05-07'),
(9, 4, 7, '2023-01-02');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'medecin', '[\"ROLE_MEDECIN\"]', '$2y$13$ji4F04yC3iAQ3uFGrizt9.hpkBw3dQnYlWL1NBRxcCGfYbOrB9IM.'),
(2, 'pharmacien', '[\"ROLE_PHARMACIEN\"]', '$2y$13$utP638RsUuSgtylJrS5U1uI.HdTvg99s1v0KjFou3sz8HOBB8D31i'),
(3, 'bernard-medecin', '[\"ROLE_MEDECIN\"]', '$2y$13$SP8y2SwKg/Ld9nCJ3yuRXe6TeYVeHxpPhjrG2Ds7Z0h4lQZLmYMd.'),
(4, 'gerard-pharmacien', '[\"ROLE_PHARMACIEN\"]', '$2y$13$N/5YDLTJIXQVqjZ1/juXqeUs.pbr8I0nfV5kTro8RF0ny90eoTzXW');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_964685A66B899279` (`patient_id`),
  ADD KEY `IDX_964685A64F31A84` (`medecin_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `indication`
--
ALTER TABLE `indication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D15065D7C403D7FB` (`medicaments_id`),
  ADD KEY `IDX_D15065D7DDA344B6` (`traitement_id`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9A9C723A72D2113D` (`methode_application_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `methode_application`
--
ALTER TABLE `methode_application`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2A356D2762FF6CDF` (`consultation_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `indication`
--
ALTER TABLE `indication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `methode_application`
--
ALTER TABLE `methode_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `traitement`
--
ALTER TABLE `traitement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
