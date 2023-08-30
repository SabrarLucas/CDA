-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 30 août 2023 à 15:53
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` date NOT NULL,
  `numfou` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Fournis`
--

CREATE TABLE `Fournis` (
  `numfou` varchar(25) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

CREATE TABLE `ligcom` (
  `numlig` tinyint(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` varchar(50) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` datetime NOT NULL,
  `codart` varchar(4) NOT NULL,
  `numcom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `codart` varchar(4) NOT NULL,
  `libart` varchar(5) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Vente`
--

CREATE TABLE `Vente` (
  `codart` varchar(4) NOT NULL,
  `numfou` varchar(25) NOT NULL,
  `delliv` tinyint(4) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` varchar(50) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` varchar(50) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`numcom`),
  ADD KEY `numfou` (`numfou`);

--
-- Index pour la table `Fournis`
--
ALTER TABLE `Fournis`
  ADD PRIMARY KEY (`numfou`);

--
-- Index pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`numlig`),
  ADD KEY `codart` (`codart`),
  ADD KEY `numcom` (`numcom`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`codart`);

--
-- Index pour la table `Vente`
--
ALTER TABLE `Vente`
  ADD PRIMARY KEY (`codart`,`numfou`),
  ADD KEY `numfou` (`numfou`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `Fournis` (`numfou`);

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`),
  ADD CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`);

--
-- Contraintes pour la table `Vente`
--
ALTER TABLE `Vente`
  ADD CONSTRAINT `Vente_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`),
  ADD CONSTRAINT `Vente_ibfk_2` FOREIGN KEY (`numfou`) REFERENCES `Fournis` (`numfou`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
