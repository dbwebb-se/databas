--
-- SQL i samband med genomgång
--
DROP TABLE IF EXISTS `order_row`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
    `id` INT NOT NULL,
    `city` VARCHAR(80),
    `name` VARCHAR(80),

    PRIMARY KEY (`id`)
);
-- SHOW COLUMNS FROM `customer`;

CREATE TABLE `order` (
    `number` INT NOT NULL AUTO_INCREMENT,
    `status` CHAR(20) DEFAULT 'Not verified',
    `order_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `shipping_date` DATETIME DEFAULT NULL,
    `customer_id` INT NOT NULL,

    PRIMARY KEY (`number`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
);
-- SHOW COLUMNS FROM `order`;

CREATE TABLE `product` (
    `id` INT NOT NULL,
    `number_items` INT DEFAULT 0,
    `name` VARCHAR(80),
    `price` DECIMAL(10,2),

    PRIMARY KEY (`id`)
);

CREATE TABLE `order_row` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `number_items` INT DEFAULT 0,
    `sales_price` DECIMAL(10,2),
    `order_id` INT NOT NULL,
    `product_id` INT NOT NULL,

    -- PRIMARY KEY (`order_id`, `product_id`)
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `order` (`number`),
    FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
);
-- SHOW COLUMNS FROM `order_row`;

SHOW TABLES;
