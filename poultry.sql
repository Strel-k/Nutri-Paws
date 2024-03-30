-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2024 at 02:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poultry`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `profile_picture` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `email`, `role`, `profile_picture`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 1, 'img/Default-Profile-Picture.png', 'admin'),
(2, 'Kyle Mercado', 'kyle@gmail.com', 0, 'img/Profile-picture1.jpg', 'kyle'),
(4, 'F. Dave Damon V. Pararuan', 'fdavedamond@gmail.com', 0, 'img/Default-Profile-Picture.png', 'omarokoy00'),
(10, 'Mark Andrew Baliguat', 'markbaliguat@gmail.com', 0, 'img/Default-Profile-Picture.png', 'mark');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Supplements', 'Supplements'),
(2, 'Feeder', 'Feeders'),
(3, 'Utilities', 'Utilities'),
(4, 'Anti-Pests', 'Pesticide for anti-Pests.'),
(5, 'Feeds', 'Feeds');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id`, `account_id`, `product_id`, `total_quantity`, `total_price`) VALUES
(35, 2, 2, 6, 540.00),
(36, 2, 3, 3, 75.00),
(37, 2, 4, 4, 800.00),
(38, 2, 6, 1, 90.00),
(39, 4, 5, 4, 800.00),
(42, 4, 2, 1, 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `rating` float NOT NULL,
  `date` date NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `customer_id`, `product_id`, `comment`, `rating`, `date`, `likes`) VALUES
(1, 2, 1, 'This product is very great', 3, '2024-03-06', 0),
(6, 2, 2, 'Haha\r\n', 1, '2024-03-27', 1),
(8, 4, 1, 'Norem ipsum2', 0, '2024-03-27', 0),
(11, 4, 3, 'Nice Eggs ', 0, '2024-03-27', 0),
(13, 4, 4, 'hi', 0, '2024-03-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `comment_id`, `user_id`) VALUES
(1, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `account_id`, `address`, `phone_number`) VALUES
(1, 2, 'San Jose', '09167572346'),
(2, 4, '133 Caridad Village, Cabanatuan City', '09982297800'),
(3, 1, 'admin', 'admin'),
(9, 10, 'San Jose', '09982297800');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `checkout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `total_price`, `status`, `productID`, `checkout_id`) VALUES
(15, 2, '2024-03-30 10:24:22', 90.00, 'Delivered', 2, 35),
(16, 2, '2024-03-30 12:24:17', 25.00, 'Delivered', 3, 35),
(17, 2, '2024-03-30 10:24:34', 200.00, 'Cancelled', 4, 35),
(18, 2, '2024-03-30 10:27:41', 90.00, 'Delivered', 6, 35),
(19, 4, '2024-03-30 11:11:06', 200.00, 'Delivered', 5, 39),
(20, 4, '2024-03-30 11:11:09', 90.00, 'Delivered', 2, 39);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `image_url`, `category_id`, `rating`) VALUES
(1, 'Oyster Shells Chicken Supplements', 'Chicken Supplements that boosts the chicken\'s growth, development, etc.', 250.00, 90, 'img/Chicken_supplements.png', 1, 3.00),
(2, 'Amihan Chicken Feeder', 'Chicken Feeder that feeds chickens so that you do not have to.', 90.00, 90, 'img/Chicken_Feeder.png', 2, 9.25),
(3, 'Egg Trays', 'Egg Trays', 25.00, 100, 'img/egg_tray.png', 3, 5.00),
(4, 'Amihan Pesticide', 'Amihan Pesticide for anti-pests.', 200.00, 90, 'img/Pesticide.png', 4, 3.00),
(5, 'Chicken Feeds', 'Chicken Feeds for Chicken consumption.', 200.00, 100, 'img/Ferwhay-Feeds.png', 5, 4.00),
(6, 'Insecticide', 'Anti-Insects for Poultry purposes.', 90.00, 1000, 'img/Insecticide.png', 4, 3.00),
(10, 'Marcelo Lube', 'Marcelo Lube', 200.00, 22, 'uploads/Insecticide.png', 2, 3.00),
(11, 'Lorem Ipsum', 'Dada', 250.00, 222, 'uploads/Profile-picture2.jpg', 1, 7.00),
(12, 'Irish Lube', 'Irish', 200.00, 22, 'uploads/Profile-picture3.jpg', 1, 4.00),
(13, 'Marl', 'Lube', 20.00, 22, 'uploads/Default-Profile-Picture.png', 1, 4.00),
(14, 'Basty Lube', 'Lubw', 20.00, 22, 'uploads/WIN_20240319_11_44_26_Pro.jpg', 1, 3.00),
(16, 'Luoie', 'Louiee', 20.00, 22, 'uploads/WIN_20240319_11_44_24_Pro.jpg', 1, 4.00),
(17, 'Haha', 'haha', 200.00, 22, 'uploads/Screenshot 2023-10-14 060745.png', 1, 5.00),
(18, 'Kalbo Kinis Kintab', 'Kalbo Kinis Kintab', 5.00, 69, 'uploads/Screenshot 2023-10-12 200057.png', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_like` (`comment_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_id` (`account_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_product` (`productID`),
  ADD KEY `fk_orders_checkout` (`checkout_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_orders_checkout` FOREIGN KEY (`checkout_id`) REFERENCES `checkout` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
