-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 28 avr. 2023 à 03:57
-- Version du serveur : 8.0.33
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `supraelectronics`
--

-- --------------------------------------------------------

--
-- Structure de la table `bracelet`
--

DROP TABLE IF EXISTS `bracelet`;
CREATE TABLE IF NOT EXISTS `bracelet` (
  `id_bracelet` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_bracelet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id_company` int NOT NULL AUTO_INCREMENT,
  `name_company` varchar(45) NOT NULL,
  `factory` int DEFAULT NULL,
  PRIMARY KEY (`id_company`),
  KEY `factory_id_company_idx` (`factory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `factory`
--

DROP TABLE IF EXISTS `factory`;
CREATE TABLE IF NOT EXISTS `factory` (
  `id_factory` int NOT NULL AUTO_INCREMENT,
  `address_factory` varchar(45) NOT NULL,
  `city_factory` varchar(45) NOT NULL,
  `country_factory` varchar(45) NOT NULL,
  PRIMARY KEY (`id_factory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username_user` varchar(15) NOT NULL,
  `password_user` varchar(45) NOT NULL,
  `lastname_user` varchar(15) NOT NULL,
  `firstname_user` varchar(15) NOT NULL,
  `email_user` varchar(45) NOT NULL,
  `status_user` int DEFAULT '0',
  `bracelet` int DEFAULT NULL,
  `company` int DEFAULT NULL,
  `factory` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_bracelet_user_idx` (`bracelet`),
  KEY `id_company_user_idx` (`company`),
  KEY `id_factory_user_idx` (`factory`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `username_user`, `password_user`, `lastname_user`, `firstname_user`, `email_user`, `status_user`, `bracelet`, `company`, `factory`) VALUES
(1, 'username', 'test', 'lecordier', 'julien', 'juli', 0, NULL, NULL, NULL),
(11, 'jule', 'test', 'lecordier', 'julien', 'julienlecordier16@gmail.com', 2, NULL, NULL, NULL),
(12, 'finaltest acc', 'password', 'bobo', 'baba', 'bubu', 0, NULL, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `factory_id_company` FOREIGN KEY (`factory`) REFERENCES `factory` (`id_factory`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `id_bracelet_user` FOREIGN KEY (`bracelet`) REFERENCES `bracelet` (`id_bracelet`),
  ADD CONSTRAINT `id_company_user` FOREIGN KEY (`company`) REFERENCES `company` (`id_company`),
  ADD CONSTRAINT `id_factory_user` FOREIGN KEY (`factory`) REFERENCES `factory` (`id_factory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
