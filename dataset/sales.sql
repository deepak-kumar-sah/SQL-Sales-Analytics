-- ============================================================
-- SQL Sales Analytics Project
-- Database: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;

-- ------------------------------------------------------------
-- 1. Create table
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
-- 2. Insert sample sales data
-- ------------------------------------------------------------
INSERT INTO sales
(order_id, order_date, customer_name, product, category, city, quantity, price, revenue)
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
-- 3. Basic Analysis
-- ------------------------------------------------------------

-- Q1. View all sales data
SELECT * FROM sales;

-- Q2. Selected columns
SELECT order_id, customer_name, product, revenue
FROM sales;

-- Q3. Unique cities
SELECT DISTINCT city
FROM sales;

-- Q4. Unique categories
SELECT DISTINCT category
FROM sales;

-- Q5. Total number of orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- Q6. Orders from Delhi
SELECT *
FROM sales
WHERE city = 'Delhi';

-- Q7. Electronics orders
SELECT *
FROM sales
WHERE category = 'Electronics';

-- Q8. Orders with revenue above 50,000
SELECT *
FROM sales
WHERE revenue > 50000;

-- Q9. Orders with quantity >= 4
SELECT *
FROM sales
WHERE quantity >= 4;

-- Q10. Mumbai Electronics orders
SELECT *
FROM sales
WHERE city = 'Mumbai'
  AND category = 'Electronics';

-- ------------------------------------------------------------
-- 4. ORDER BY and LIMIT
-- ------------------------------------------------------------

-- Q11. Revenue high to low
SELECT *
FROM sales
ORDER BY revenue DESC;

-- Q12. Revenue low to high
SELECT *
FROM sales
ORDER BY revenue ASC;

-- Q13. Highest revenue order
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 1;

-- Q14. Top 3 orders by revenue
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 3;

-- Q15. Lowest 3 orders by revenue
SELECT *
FROM sales
ORDER BY revenue ASC
LIMIT 3;

-- Q16. Highest price
SELECT *
FROM sales
ORDER BY price DESC
LIMIT 1;

-- Q17. Quantity high to low
SELECT *
FROM sales
ORDER BY quantity DESC;

-- ------------------------------------------------------------
-- 5. Aggregate Functions
-- ------------------------------------------------------------

-- Q18. Total revenue
SELECT SUM(revenue) AS total_revenue
FROM sales;

-- Q19. Average revenue
SELECT AVG(revenue) AS average_revenue
FROM sales;

-- Q20. Maximum revenue
SELECT MAX(revenue) AS max_revenue
FROM sales;

-- Q21. Minimum revenue
SELECT MIN(revenue) AS min_revenue
FROM sales;

-- Q22. Total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM sales;

-- Q23. Average price
SELECT AVG(price) AS average_price
FROM sales;

-- Q24. Total orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- ------------------------------------------------------------
-- 6. GROUP BY
-- ------------------------------------------------------------

-- Q25. Revenue by category
SELECT category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY category;

-- Q26. Revenue by city
SELECT city, SUM(revenue) AS total_revenue
FROM sales
GROUP BY city;

-- Q27. Revenue by product
SELECT product, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product;

-- Q28. Quantity by category
SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;

-- Q29. Quantity by city
SELECT city, SUM(quantity) AS total_quantity
FROM sales
GROUP BY city;

-- Q30. Order count by product
SELECT product, COUNT(*) AS order_count
FROM sales
GROUP BY product;

-- Q31. Average revenue by city
SELECT city, AVG(revenue) AS average_revenue
FROM sales
GROUP BY city;

-- Q32. Average revenue by category
SELECT category, AVG(revenue) AS average_revenue
FROM sales
GROUP BY category;

-- ------------------------------------------------------------
-- 7. HAVING
-- ------------------------------------------------------------

-- Q33. Categories with revenue > 50,000
SELECT category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
HAVING SUM(revenue) > 50000;

-- Q34. Cities with revenue > 50,000
SELECT city, SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
HAVING SUM(revenue) > 50000;

-- Q35. Products with total quantity > 5
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Q36. Cities with more than 3 orders
SELECT city, COUNT(*) AS total_orders
FROM sales
GROUP BY city
HAVING COUNT(*) > 3;

-- ------------------------------------------------------------
-- 8. CASE Statements
-- ------------------------------------------------------------

-- Q37. Revenue category
SELECT
    order_id,
    customer_name,
    revenue,
    CASE
        WHEN revenue >= 50000 THEN 'High'
        ELSE 'Low'
    END AS revenue_category
FROM sales;

-- Q38. Quantity category
SELECT
    order_id,
    customer_name,
    quantity,
    CASE
        WHEN quantity >= 5 THEN 'Bulk'
        ELSE 'Normal'
    END AS quantity_category
FROM sales;

-- Q39. Price category
SELECT
    order_id,
    product,
    price,
    CASE
        WHEN price >= 10000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS price_category
FROM sales;

-- ------------------------------------------------------------
-- 9. Date Analysis
-- ------------------------------------------------------------

-- Q40. January 2025 orders
SELECT *
FROM sales
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-02-01';

-- Q41. February 2025 orders
SELECT *
FROM sales
WHERE order_date >= '2025-02-01'
  AND order_date < '2025-03-01';

-- Q42. Orders after January 15, 2025
SELECT *
FROM sales
WHERE order_date > '2025-01-15';

-- Q43. January 2025 total revenue
SELECT SUM(revenue) AS january_revenue
FROM sales
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-02-01';

-- Q44. Month-wise revenue
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- ------------------------------------------------------------
-- 10. Advanced Aggregation
-- ------------------------------------------------------------

-- Q45. Highest revenue order in each city
SELECT city, MAX(revenue) AS highest_revenue
FROM sales
GROUP BY city;

-- Q46. Highest revenue order in each category
SELECT category, MAX(revenue) AS highest_revenue
FROM sales
GROUP BY category;

-- Q47. Average price by product
SELECT product, AVG(price) AS average_price
FROM sales
GROUP BY product;

-- Q48. City order count and total revenue
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city;

-- Q49. Category quantity and revenue
SELECT
    category,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category;

-- Q50. Product with highest total revenue
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 1;

-- ------------------------------------------------------------
-- 11. Subqueries
-- ------------------------------------------------------------

-- Q51. Orders above average revenue
SELECT *
FROM sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM sales
);

-- Q52. Highest revenue order(s)
SELECT *
FROM sales
WHERE revenue = (
    SELECT MAX(revenue)
    FROM sales
);

-- Q53. Products priced above average price
SELECT DISTINCT product, price
FROM sales
WHERE price > (
    SELECT AVG(price)
    FROM sales
);

-- Q54. Delhi orders above Delhi average revenue
SELECT *
FROM sales
WHERE city = 'Delhi'
  AND revenue > (
      SELECT AVG(revenue)
      FROM sales
      WHERE city = 'Delhi'
  );

-- Q55. Record(s) with highest price
SELECT *
FROM sales
WHERE price = (
    SELECT MAX(price)
    FROM sales
);

-- ------------------------------------------------------------
-- 12. Window Functions
-- ------------------------------------------------------------

-- Q56. Overall revenue rank
SELECT
    order_id,
    customer_name,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM sales;

-- Q57. Revenue rank within category
SELECT
    order_id,
    customer_name,
    category,
    revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS category_rank
FROM sales;

-- Q58. Revenue rank within city
SELECT
    order_id,
    customer_name,
    city,
    revenue,
    RANK() OVER (
        PARTITION BY city
        ORDER BY revenue DESC
    ) AS city_rank
FROM sales;

-- Q59. Running total revenue
SELECT
    order_id,
    order_date,
    customer_name,
    revenue,
    SUM(revenue) OVER (
        ORDER BY order_date, order_id
    ) AS running_total
FROM sales;

-- Q60. Category total revenue on each row
SELECT
    order_id,
    order_date,
    customer_name,
    category,
    revenue,
    SUM(revenue) OVER (
        PARTITION BY category
    ) AS category_total_revenue
FROM sales;

-- ------------------------------------------------------------
-- 13. Data Analyst Queries
-- ------------------------------------------------------------

-- Q61. Top 3 products by total revenue
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 3;

-- Q62. City with highest total revenue
SELECT
    city,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;

-- Q63. Category with highest total revenue
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;

-- Q64. Average Order Value (AOV)
SELECT
    SUM(revenue) / COUNT(DISTINCT order_id) AS AOV
FROM sales;

-- Q65. Product revenue contribution %
SELECT
    product,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY product;

-- Q66. City revenue contribution %
SELECT
    city,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales),
        2
    ) AS contribution_revenue
FROM sales
GROUP BY city;

-- Q67. Orders above average revenue
SELECT *
FROM sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM sales
);

-- Q68. Bulk orders
SELECT *
FROM sales
WHERE quantity >= 5;

-- Q69. Electronics total and average revenue
SELECT
    SUM(revenue) AS total_revenue,
    AVG(revenue) AS average_revenue
FROM sales
WHERE category = 'Electronics';

-- Q70. Delhi Electronics total revenue
SELECT
    SUM(revenue) AS total_revenue
FROM sales
WHERE city = 'Delhi'
  AND category = 'Electronics';

-- ------------------------------------------------------------
-- 14. Interview-Level Queries
-- ------------------------------------------------------------

-- Q71. Second highest revenue
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 1 OFFSET 1;

-- Q72. Second highest price
SELECT *
FROM sales
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- Q73. Highest revenue product/order in each city
SELECT city, product, revenue
FROM (
    SELECT
        city,
        product,
        revenue,
        RANK() OVER (
            PARTITION BY city
            ORDER BY revenue DESC
        ) AS rnk
    FROM sales
) AS ranked_sales
WHERE rnk = 1;

-- Q74. Highest revenue product/order in each category
SELECT product, category, revenue
FROM (
    SELECT
        product,
        category,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rnk
    FROM sales
) AS ranked_sales
WHERE rnk = 1;

-- Q75. Cities with both Electronics and Furniture
SELECT city
FROM sales
GROUP BY city
HAVING COUNT(DISTINCT category) = 2;

-- Q76. Customers who purchased Laptop
SELECT DISTINCT customer_name
FROM sales
WHERE product = 'Laptop';

-- Q77. Products sold in more than one city
SELECT
    product,
    COUNT(DISTINCT city) AS city_count
FROM sales
GROUP BY product
HAVING COUNT(DISTINCT city) > 1;

-- Q78. Product with highest total quantity
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 1;

-- Q79. City with highest average order value
SELECT
    city,
    AVG(revenue) AS average_order_value
FROM sales
GROUP BY city
ORDER BY average_order_value DESC
LIMIT 1;

-- Q80. Final sales analysis
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    AVG(revenue) AS avg_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;
