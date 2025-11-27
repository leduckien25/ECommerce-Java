CREATE DATABASE ecommerce_store;

USE ecommerce_store;

CREATE TABLE category (
    id BIGINT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    category_description VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id BIGINT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(500),
    product_description VARCHAR(5000),
    product_image VARCHAR(255),
    product_price DOUBLE,
    product_stock INT NOT NULL,
    category_id BIGINT,
    PRIMARY KEY (id),
    KEY idx_category (category_id),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE `order` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    status VARCHAR(255),
    customer_name VARCHAR(255),
    order_date DATE,
    payment_method VARCHAR(255),
    phone_number VARCHAR(255),
    shipping_address VARCHAR(255),
    total_amount DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE order_detail (
    id BIGINT NOT NULL AUTO_INCREMENT,
    order_id BIGINT,
    product_id BIGINT,
    product_name VARCHAR(255),
    product_price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    KEY idx_order (order_id),
    CONSTRAINT fk_order_detail_order FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE
);

CREATE TABLE `user` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    PRIMARY KEY (id)
);
