CREATE DATABASE  IF NOT EXISTS `food_db` 
USE `food_db`;


DROP TABLE IF EXISTS `food_items`;
CREATE TABLE `food_items` (
  `item_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `food_items` WRITE;
INSERT INTO `food_items` VALUES (1,'Pav Bhaji',6.00),(2,'Chole Bhature',7.00),(3,'Pizza',8.00),(4,'Mango Lassi',5.00),(5,'Masala Dosa',6.00),(6,'Vegetable Biryani',9.00),(7,'Vada Pav',4.00),(8,'Rava Dosa',7.00),(9,'Samosa',5.00);
UNLOCK TABLES;



DROP TABLE IF EXISTS `order_tracking`;

CREATE TABLE `order_tracking` (
  `order_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `order_tracking` WRITE;
INSERT INTO `order_tracking` VALUES (40,'delivered'),(41,'in transit');
UNLOCK TABLES;

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `orders_ibfk_1` (`item_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `food_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
