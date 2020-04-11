-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 11:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_line_one` varchar(100) DEFAULT NULL,
  `address_line_two` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL,
  `is_shipping` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `address_line_one`, `address_line_two`, `city`, `state`, `country`, `postal_code`, `is_billing`, `is_shipping`) VALUES
(2, 5, 'taza', 'casa', 'taza', 'maroc', 'maroc', '35000', 1, 0),
(3, 6, 'taza', 'casa', 'casa', 'maroc', 'maroc', '63269', 1, 0),
(4, 10, 'taza', 'casa', 'taza', 'maroc', 'maroc', '3500', 1, 0),
(5, 11, 'casa', 'bn sliman', 'casa', 'maroc', 'maroc', '2369', 1, 0),
(6, 12, 'casa', 'taza', 'taza', 'maroc', 'maroc', '2560', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `cart_lines` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `grand_total`, `cart_lines`) VALUES
(2, 5, '0.00', 0),
(4, 10, '0.00', 0),
(5, 12, '199000.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_line`
--

CREATE TABLE `cart_line` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_line`
--

INSERT INTO `cart_line` (`id`, `cart_id`, `total`, `product_id`, `product_count`, `buying_price`, `is_available`) VALUES
(8, 5, '171000.00', 3, 3, '57000.00', 1),
(9, 5, '28000.00', 7, 1, '28000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `image_url`, `is_active`) VALUES
(1, 'Laptop', 'This is description for Laptop category!', 'CAT_1.png', 1),
(2, 'Television', 'This is description for Television category!', 'CAT_2.png', 1),
(3, 'Mobile', 'This is description for Mobile category!', 'CAT_3.png', 1),
(4, 'Camers', 'This is description for Cameras category!', 'CAT_4.png', 1),
(5, 'Gamming PC', 'This is description for Gamming Pc category!', 'CAT_5.png', 1),
(6, 'Headphones', 'This is description for Headphones category!', 'CAT_6.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `user_id`, `order_total`, `order_count`, `shipping_id`, `billing_id`, `order_date`) VALUES
(1, 5, '57000.00', 1, 2, 2, '2020-03-30'),
(2, 10, '45000.00', 2, 4, 4, '2020-03-31'),
(3, 10, '117000.00', 3, 4, 4, '2020-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `total`, `product_id`, `product_count`, `buying_price`) VALUES
(1, 1, '57000.00', 3, 1, '57000.00'),
(2, 2, '28000.00', 7, 1, '28000.00'),
(3, 2, '17000.00', 1, 1, '17000.00'),
(4, 3, '57000.00', 3, 1, '57000.00'),
(5, 3, '32000.00', 2, 1, '32000.00'),
(6, 3, '28000.00', 7, 1, '28000.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchases` int(11) DEFAULT 0,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `code`, `name`, `brand`, `description`, `unit_price`, `quantity`, `is_active`, `category_id`, `supplier_id`, `purchases`, `views`) VALUES
(1, 'PRDABC123DEFX', 'iPhone 11', 'apple', 'This is one of the best phone available in the market right now!', '17000.00', 4, 1, 3, 7, 1, 0),
(2, 'PRDDEF123DEFX', 'Samsung S10', 'samsung', 'A smart phone by samsung!', '32000.00', 1, 1, 3, 7, 1, 5),
(3, 'PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', '57000.00', 3, 1, 3, 6, 0, 2),
(4, 'PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', '54000.00', 3, 1, 1, 7, 0, 0),
(5, 'PRDABCXYZDEFX', 'aero E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', '48000.00', 5, 1, 1, 6, 0, 0),
(7, 'PRDABC123DEXFX', 'razer 15', 'razor', 'This is one of the best gamming laptops available in the market right now!', '28000.00', 2, 1, 5, 6, 2, 11),
(8, 'PRDBBC123DEFX', 'Hyper X', 'Orbit S', 'This is one of the best Headphones available in the market right now!', '8000.00', 5, 1, 6, 6, 0, 1),
(9, 'PRDAED123DEFX', 'HP Monitor 5s', 'HP', 'This is one of the best Monitors available in the market right now!', '12000.00', 5, 1, 2, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `role`, `enabled`, `password`, `email`, `contact_number`) VALUES
(5, 'SOUHAIL', 'DOUQCHI', 'ADMIN', 1, '$2a$10$hkv8LdvLKy48ePwBJlD6reML3APWSm7LCChZ1sB4FqU66d8Cg4p2.', 'souhaildq@gmail.com', '1234'),
(6, 'mohamed', 'douqchi', 'SUPPLIER', 1, '$2a$10$SS4KJj4PnCKirVctDzZ3QOxzd01lRA0rxBQdY6PRfV9yeuKEeUMNC', 'mdouqchi@gmail.com', '5966161626'),
(7, 'Mounaim', 'ABDREZAK', 'SUPPLIER', 1, '$2a$06$bzYMivkRjSxTK2LPD8W4te6jjJa795OwJR1Of5n95myFsu3hgUnm6', ' abdelmounaimabderrezak@gmail.com', '1234'),
(10, 'dq', 'v', 'USER', 1, '$2a$10$oZ2U1KU4tug8GZd3VuE1/e2KQeH4aez7TKl6PJMcrN8TzOO4yzOea', 'v@gmail.com', '789562'),
(11, 'Mounaim', 'abdrezzak', 'SUPPLIER', 1, '$2a$10$2mmiDy57z3vT7J..XCU2.uTJPafmRT.85ar0Y2e/BmcaY/99IEQym', 'mounaim@gmail.com', '2357'),
(12, 'bla', 'bla', 'USER', 1, '$2a$10$2wgfdHcGBtzZpbGvbwaVZe69gOtbZMK5atAcdwHNlhPC5k.soTGXa', 'bla@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_line`
--
ALTER TABLE `cart_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `billing_id` (`billing_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_line`
--
ALTER TABLE `cart_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);

--
-- Constraints for table `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `cart_line_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`shipping_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`billing_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `user_detail` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
