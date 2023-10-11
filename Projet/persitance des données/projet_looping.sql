-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 11, 2023 at 03:02 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projet_looping`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id_categories` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `parent_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`id_categories`, `name`, `image`, `parent_cat`) VALUES
(1, 'cat-1', 'url/image-1.jpeg', NULL),
(2, 'cat-2', 'url/image-2.jpeg', 1),
(3, 'cat-3', 'url/image-3.jpeg', 1),
(4, 'cat-4', 'url/image-4.jpeg', 1),
(5, 'cat-5', 'url/image-5.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Deliveries`
--

CREATE TABLE `Deliveries` (
  `id_deliveries` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `carrier` varchar(50) NOT NULL,
  `date_del` datetime DEFAULT NULL,
  `id_orders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Deliveries`
--

INSERT INTO `Deliveries` (`id_deliveries`, `quantity`, `carrier`, `date_del`, `id_orders`) VALUES
(1, 4, 'amazon', '2023-10-11 00:00:00', 1),
(2, 4, 'amazon', '2023-10-11 00:00:00', 2),
(3, 4, 'amazon', '2023-10-11 00:00:00', 3),
(4, 0, 'amazon', '2023-10-11 00:00:00', 4),
(5, 4, 'amazon', '2023-10-11 00:00:00', 5),
(6, 4, 'amazon', '2023-10-11 00:00:00', 6),
(7, 4, 'amazon', '2023-10-11 00:00:00', 7),
(8, 2, 'amazon', '2023-10-11 00:00:00', 8),
(9, 4, 'amazon', '2023-10-11 00:00:00', 9),
(10, 0, 'amazon', '2023-10-11 00:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Factures`
--

CREATE TABLE `Factures` (
  `id_factures` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `payment` varchar(50) NOT NULL,
  `to_pay` decimal(7,2) NOT NULL,
  `id_orders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Factures`
--

INSERT INTO `Factures` (`id_factures`, `created_at`, `payment`, `to_pay`, `id_orders`) VALUES
(1, '2023-10-11 00:00:00', 'CB', '95.96', 1),
(2, '2023-10-11 00:00:00', 'CB', '95.96', 2),
(3, '2023-10-11 00:00:00', 'CB', '95.96', 3),
(4, '2023-10-11 00:00:00', 'CB', '95.96', 4),
(5, '2023-10-11 00:00:00', 'CB', '95.96', 5),
(6, '2023-10-11 00:00:00', 'CB', '95.96', 6),
(7, '2023-10-11 00:00:00', 'CB', '95.96', 7),
(8, '2023-10-11 00:00:00', 'CB', '95.96', 8),
(9, '2023-10-11 00:00:00', 'CB', '95.96', 9),
(10, '2023-10-11 00:00:00', 'cheque', '95.96', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id_orders` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `delivery` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id_orders`, `created_at`, `delivery`, `status`, `id_users`) VALUES
(1, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 1),
(2, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 1),
(3, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 5),
(4, '2023-10-11 00:00:00', NULL, 'en preparation', 13),
(5, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 8),
(6, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 7),
(7, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 10),
(8, '2023-10-11 00:00:00', NULL, 'en cours', 3),
(9, '2023-10-11 00:00:00', '2023-10-11 00:00:00', 'livré', 9),
(10, '2023-10-11 00:00:00', NULL, 'en attente de paiment', 15);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id_products` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_suppliers` int(11) NOT NULL,
  `id_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id_products`, `name`, `description`, `price`, `image`, `id_suppliers`, `id_categories`) VALUES
(1, 'produit-1', 'La description pour le produit 1', '23.99', 'url/image-1.jpeg', 1, 1),
(2, 'produit-2', 'La description pour le produit 2', '23.99', 'url/image-2.jpeg', 1, 1),
(3, 'produit-3', 'La description pour le produit 3', '23.99', 'url/image-3.jpeg', 2, 2),
(4, 'produit-4', 'La description pour le produit 4', '23.99', 'url/image-4.jpeg', 2, 2),
(5, 'produit-5', 'La description pour le produit 5', '23.99', 'url/image-5.jpeg', 3, 3),
(6, 'produit-6', 'La description pour le produit 6', '23.99', 'url/image-6.jpeg', 3, 3),
(7, 'produit-7', 'La description pour le produit 7', '23.99', 'url/image-7.jpeg', 4, 4),
(8, 'produit-8', 'La description pour le produit 8', '23.99', 'url/image-8.jpeg', 4, 4),
(9, 'produit-9', 'La description pour le produit 9', '23.99', 'url/image-9.jpeg', 5, 5),
(10, 'produit-10', 'La description pour le produit 10', '23.99', 'url/image-10.jpeg', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Products_Orders`
--

CREATE TABLE `Products_Orders` (
  `id_orders` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price_tot` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products_Orders`
--

INSERT INTO `Products_Orders` (`id_orders`, `id_products`, `quantity`, `price_tot`) VALUES
(1, 3, 4, '95.96'),
(2, 6, 4, '95.96'),
(3, 1, 4, '95.96'),
(4, 4, 4, '95.96'),
(5, 10, 4, '95.96'),
(6, 9, 4, '95.96'),
(7, 3, 4, '95.96'),
(8, 6, 4, '95.96'),
(9, 2, 4, '95.96'),
(10, 8, 4, '95.96');

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

CREATE TABLE `Suppliers` (
  `id_suppliers` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`id_suppliers`, `name`) VALUES
(1, 'nom-1'),
(2, 'nom-2'),
(3, 'nom-3'),
(4, 'nom-4'),
(5, 'nom-5');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id_users` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` text NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `addresse` varchar(50) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id_users`, `email`, `roles`, `firstname`, `lastname`, `password`, `addresse`, `zipcode`, `city`, `created_at`) VALUES
(1, 'email1@mail.com', 'ADMIN', 'firstname-1', 'lastname-1', 'mdp', 'addr-1', '11111', 'city-1', '2023-10-11 00:00:00'),
(2, 'email2@mail.com', 'ADMIN', 'firstname-2', 'lastname-2', 'mdp', 'addr-2', '22222', 'city-2', '2023-10-11 00:00:00'),
(3, 'email3@mail.com', 'ADMIN', 'firstname-3', 'lastname-3', 'mdp', 'addr-3', '33333', 'city-3', '2023-10-11 00:00:00'),
(4, 'email4@mail.com', 'ADMIN', 'firstname-4', 'lastname-4', 'mdp', 'addr-4', '44444', 'city-4', '2023-10-11 00:00:00'),
(5, 'email5@mail.com', 'ADMIN', 'firstname-5', 'lastname-5', 'mdp', 'addr-5', '55555', 'city-5', '2023-10-11 00:00:00'),
(6, 'email6@mail.com', 'ADMIN', 'firstname-6', 'lastname-6', 'mdp', 'addr-6', '66666', 'city-6', '2023-10-11 00:00:00'),
(7, 'email7@mail.com', 'ADMIN', 'firstname-7', 'lastname-7', 'mdp', 'addr-7', '77777', 'city-7', '2023-10-11 00:00:00'),
(8, 'email8@mail.com', 'ADMIN', 'firstname-8', 'lastname-8', 'mdp', 'addr-8', '88888', 'city-8', '2023-10-11 00:00:00'),
(9, 'email9@mail.com', 'ADMIN', 'firstname-9', 'lastname-9', 'mdp', 'addr-9', '99999', 'city-9', '2023-10-11 00:00:00'),
(10, 'email10@mail.com', 'ADMIN', 'firstname-10', 'lastname-10', 'mdp', 'addr-10', '10000', 'city-10', '2023-10-11 00:00:00'),
(11, 'email11@mail.com', 'ADMIN', 'firstname-11', 'lastname-11', 'mdp', 'addr-11', '11000', 'city-11', '2023-10-11 00:00:00'),
(12, 'email12@mail.com', 'ADMIN', 'firstname-12', 'lastname-12', 'mdp', 'addr-12', '12000', 'city-12', '2023-10-11 00:00:00'),
(13, 'email13@mail.com', 'ADMIN', 'firstname-13', 'lastname-13', 'mdp', 'addr-13', '13000', 'city-13', '2023-10-11 00:00:00'),
(14, 'email14@mail.com', 'ADMIN', 'firstname-14', 'lastname-14', 'mdp', 'addr-14', '14000', 'city-14', '2023-10-11 00:00:00'),
(15, 'email15@mail.com', 'ADMIN', 'firstname-15', 'lastname-15', 'mdp', 'addr-15', '15000', 'city-15', '2023-10-11 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_categories`),
  ADD KEY `id_categories_1` (`parent_cat`);

--
-- Indexes for table `Deliveries`
--
ALTER TABLE `Deliveries`
  ADD PRIMARY KEY (`id_deliveries`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Indexes for table `Factures`
--
ALTER TABLE `Factures`
  ADD PRIMARY KEY (`id_factures`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id_orders`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id_products`),
  ADD KEY `id_suppliers` (`id_suppliers`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Indexes for table `Products_Orders`
--
ALTER TABLE `Products_Orders`
  ADD PRIMARY KEY (`id_orders`,`id_products`),
  ADD KEY `id_products` (`id_products`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`id_suppliers`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Deliveries`
--
ALTER TABLE `Deliveries`
  MODIFY `id_deliveries` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Factures`
--
ALTER TABLE `Factures`
  MODIFY `id_factures` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Suppliers`
--
ALTER TABLE `Suppliers`
  MODIFY `id_suppliers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Categories`
--
ALTER TABLE `Categories`
  ADD CONSTRAINT `Categories_ibfk_1` FOREIGN KEY (`parent_cat`) REFERENCES `Categories` (`id_categories`);

--
-- Constraints for table `Deliveries`
--
ALTER TABLE `Deliveries`
  ADD CONSTRAINT `Deliveries_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `Orders` (`id_orders`);

--
-- Constraints for table `Factures`
--
ALTER TABLE `Factures`
  ADD CONSTRAINT `Factures_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `Orders` (`id_orders`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `Users` (`id_users`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`id_suppliers`) REFERENCES `Suppliers` (`id_suppliers`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`id_categories`) REFERENCES `Categories` (`id_categories`);

--
-- Constraints for table `Products_Orders`
--
ALTER TABLE `Products_Orders`
  ADD CONSTRAINT `Products_Orders_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `Orders` (`id_orders`),
  ADD CONSTRAINT `Products_Orders_ibfk_2` FOREIGN KEY (`id_products`) REFERENCES `Products` (`id_products`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
