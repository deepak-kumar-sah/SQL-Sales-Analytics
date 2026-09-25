-- ============================================================
-- SQL Sales Analytics Project
-- Dataset Setup
-- Database: MySQL
-- ============================================================

-- ------------------------------------------------------------
-- 1. Create Database
-- ------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS sales_analytics;

USE sales_analytics;


-- ------------------------------------------------------------
-- 2. Create Sales Table
-- ------------------------------------------------------------

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(30),
    city VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    revenue DECIMAL(12,2)
);


-- ------------------------------------------------------------
-- 3. Insert Sales Data
-- ------------------------------------------------------------

INSERT INTO sales
(
    order_id,
    order_date,
    customer_name,
    product,
    category,
    city,
    quantity,
    price,
    revenue
)
VALUES
(1001, '2025-01-05', 'Rahul', 'Laptop', 'Electronics', 'Delhi', 2, 55000, 110000),

(1002, '2025-01-07', 'Aman', 'Mouse', 'Electronics', 'Mumbai', 5, 800, 4000),

(1003, '2025-01-10', 'Priya', 'Keyboard', 'Electronics', 'Delhi', 3, 1500, 4500),

(1004, '2025-01-12', 'Rohit', 'Chair', 'Furniture', 'Pune', 4, 3500, 14000),

(1005, '2025-01-15', 'Neha', 'Table', 'Furniture', 'Mumbai', 2, 7000, 14000),

(1006, '2025-01-18', 'Amit', 'Laptop', 'Electronics', 'Pune', 1, 55000, 55000),

(1007, '2025-01-20', 'Sneha', 'Headphones', 'Electronics', 'Delhi', 4, 2500, 10000),

(1008, '2025-01-22', 'Vikas', 'Chair', 'Furniture', 'Delhi', 3, 3500, 10500),

(1009, '2025-01-25', 'Pooja', 'Table', 'Furniture', 'Pune', 1, 7000, 7000),

(1010, '2025-01-27', 'Karan', 'Mouse', 'Electronics', 'Mumbai', 8, 800, 6400),

(1011, '2025-01-29', 'Anjali', 'Laptop', 'Electronics', 'Mumbai', 2, 55000, 110000),

(1012, '2025-02-01', 'Sahil', 'Keyboard', 'Electronics', 'Pune', 5, 1500, 7500),

(1013, '2025-02-03', 'Riya', 'Chair', 'Furniture', 'Mumbai', 2, 3500, 7000),

(1014, '2025-02-05', 'Arjun', 'Table', 'Furniture', 'Delhi', 3, 7000, 21000),

(1015, '2025-02-07', 'Simran', 'Headphones', 'Electronics', 'Pune', 6, 2500, 15000);


-- ------------------------------------------------------------
-- 4. Verify Data
-- ------------------------------------------------------------

SELECT *
FROM sales;
