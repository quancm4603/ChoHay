drop database if exists ChoHay;
create database ChoHay CHAR SET UTF8MB4 COLLATE utf8mb4_unicode_ci;
use ChoHay;


CREATE TABLE `Addresses`(
                            `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            `province` VARCHAR(32) NOT NULL,
                            `city` VARCHAR(32) NOT NULL,
                            `district` VARCHAR(32) NOT NULL,
                            `street` VARCHAR(64) NOT NULL
);


CREATE TABLE `Users`(
                        `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        `username` VARCHAR(16) NOT NULL UNIQUE,
                        `email` VARCHAR(64) NOT NULL UNIQUE,
                        `password` VARCHAR(16) NOT NULL,
                        `phone` CHAR(10) NOT NULL UNIQUE,
                        `address_id` BIGINT UNSIGNED NOT NULL,
                        `full_name` VARCHAR(64) NOT NULL,
                        `role` SMALLINT UNSIGNED NOT NULL,
                        `avatar` VARCHAR(1000) NOT NULL
);

CREATE TABLE `Products`(
                           `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           `user_id` BIGINT UNSIGNED NOT NULL,
                           `name` VARCHAR(255) NOT NULL,
                           `price` BIGINT NOT NULL,
                           `description` TEXT NOT NULL,
                           `image` VARCHAR(1000) NOT NULL,
                           `phone` CHAR(10) NOT NULL,
                           `address_id` BIGINT UNSIGNED NOT NULL,
                           `category` VARCHAR(32) NOT NULL,
                           `details` JSON NOT NULL,
                           `status` INT DEFAULT '0'
);
CREATE TABLE `Orders`(
                         `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         `product_id` BIGINT UNSIGNED NOT NULL,
                         `seller_id` BIGINT UNSIGNED NOT NULL,
                         `customer_id` BIGINT UNSIGNED NOT NULL,
                         `receiver_name` VARCHAR(64) NOT NULL,
                         `receiver_phone` CHAR(10) NOT NULL,
                         `receiver_email` VARCHAR(64) NOT NULL,
                         `receiver_province` VARCHAR(32) NOT NULL,
                         `receiver_city` VARCHAR(32) NOT NULL,
                         `receiver_district` VARCHAR(32) NOT NULL,
                         `receiver_street` VARCHAR(64) NOT NULL,
                         `status` SMALLINT NOT NULL,
                         `customer_comment` VARCHAR(255) NULL
);


ALTER TABLE
    `Users` ADD CONSTRAINT `users_address_id_foreign` FOREIGN KEY(`address_id`) REFERENCES `Addresses`(`id`);

ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);

ALTER TABLE
    `Products` ADD CONSTRAINT `products_address_id_foreign` FOREIGN KEY(`address_id`) REFERENCES `Addresses`(`id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `Products`(`user_id`);