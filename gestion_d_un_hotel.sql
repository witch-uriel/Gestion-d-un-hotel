-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 01 nov. 2023 à 13:47
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion d'un hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `ID_Chambre` int(11) NOT NULL,
  `Type_Chambre` varchar(20) DEFAULT NULL,
  `Caractéristique` varchar(50) DEFAULT NULL,
  `Vue` varchar(50) DEFAULT NULL,
  `Tarif` decimal(10,2) DEFAULT NULL,
  `Etat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `ID_Client` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  `Type_Client` varchar(20) DEFAULT NULL,
  `Origine` varchar(50) DEFAULT NULL,
  `Carte_Fidélité` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etat_hotel`
--

CREATE TABLE `etat_hotel` (
  `ID_Etat` int(11) NOT NULL,
  `Nom_Etat` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Requete_SQL` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `ID_Facture` int(11) NOT NULL,
  `ID_Client` int(11) DEFAULT NULL,
  `ID_Réservation` int(11) DEFAULT NULL,
  `Date_Facturation` date DEFAULT NULL,
  `Montant_Total` decimal(10,2) DEFAULT NULL,
  `Mode_Paiement` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `réservation`
--

CREATE TABLE `réservation` (
  `ID_Réservation` int(11) NOT NULL,
  `ID_Client` int(11) DEFAULT NULL,
  `ID_Chambre` int(11) DEFAULT NULL,
  `Date_arrivée` date DEFAULT NULL,
  `Date_Départ` date DEFAULT NULL,
  `Date_Réservation` date DEFAULT NULL,
  `Montant_Total` decimal(10,2) DEFAULT NULL,
  `Etat_Réservation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `ID_Service` int(11) NOT NULL,
  `Nom_Service` varchar(50) DEFAULT NULL,
  `Tarif` decimal(10,2) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD PRIMARY KEY (`ID_Chambre`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID_Client`);

--
-- Index pour la table `etat_hotel`
--
ALTER TABLE `etat_hotel`
  ADD PRIMARY KEY (`ID_Etat`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`ID_Facture`),
  ADD KEY `ID_Client` (`ID_Client`),
  ADD KEY `ID_Réservation` (`ID_Réservation`);

--
-- Index pour la table `réservation`
--
ALTER TABLE `réservation`
  ADD PRIMARY KEY (`ID_Réservation`),
  ADD KEY `ID_Chambre` (`ID_Chambre`),
  ADD KEY `ID_Client` (`ID_Client`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ID_Service`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`),
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`ID_Réservation`) REFERENCES `réservation` (`ID_Réservation`);

--
-- Contraintes pour la table `réservation`
--
ALTER TABLE `réservation`
  ADD CONSTRAINT `réservation_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`),
  ADD CONSTRAINT `réservation_ibfk_2` FOREIGN KEY (`ID_Chambre`) REFERENCES `chambres` (`ID_Chambre`),
  ADD CONSTRAINT `réservation_ibfk_3` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`),
  ADD CONSTRAINT `réservation_ibfk_4` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`),
  ADD CONSTRAINT `réservation_ibfk_5` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`),
  ADD CONSTRAINT `réservation_ibfk_6` FOREIGN KEY (`ID_Client`) REFERENCES `clients` (`ID_Client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
