```sql
-- ============================================================
-- SQL Sales Analytics Project
-- Sales Analysis Queries
-- Database: MySQL
-- Total Queries: 80
-- ============================================================

USE sales_analytics;


-- ============================================================
-- 1. BASIC SQL
-- ============================================================

-- Q1. View all sales data
SELECT *
FROM sales;

-- Q2. Select specific columns
SELECT
    order_id,
    customer_name,
    product,
    revenue
FROM sales;

-- Q3. Find unique cities
SELECT DISTINCT city
FROM sales;

-- Q4. Find unique categories
SELECT DISTINCT category
FROM sales;

-- Q5. Count total orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- Q6. Find orders from Delhi
SELECT *
FROM sales
WHERE city = 'Delhi';

-- Q7. Find Electronics orders
SELECT *
FROM sales
WHERE category = 'Electronics';

-- Q8. Find orders with revenue above 50,000
SELECT *
FROM sales
WHERE revenue > 50000;

-- Q9. Find orders with quantity greater than or equal to 4
SELECT *
FROM sales
WHERE quantity >= 4;

-- Q10. Find Mumbai Electronics orders
SELECT *
FROM sales
WHERE city = 'Mumbai'
  AND category = 'Electronics';


-- ============================================================
-- 2. ORDER BY AND LIMIT
-- ============================================================

-- Q11. Sort orders by revenue from highest to lowest
SELECT *
FROM sales
ORDER BY revenue DESC;

-- Q12. Sort orders by revenue from lowest to highest
SELECT *
FROM sales
ORDER BY revenue ASC;

-- Q13. Find the highest revenue order
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 1;

-- Q14. Find the top 3 orders by revenue
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 3;

-- Q15. Find the lowest 3 orders by revenue
SELECT *
FROM sales
ORDER BY revenue ASC
LIMIT 3;

-- Q16. Find the highest-priced order
SELECT *
FROM sales
ORDER BY price DESC
LIMIT 1;

-- Q17. Sort orders by quantity from highest to lowest
SELECT *
FROM sales
ORDER BY quantity DESC;


-- ============================================================
-- 3. AGGREGATE FUNCTIONS
-- ============================================================

-- Q18. Calculate total revenue
SELECT
    SUM(revenue) AS total_revenue
FROM sales;

-- Q19. Calculate average revenue per order
SELECT
    AVG(revenue) AS average_revenue
FROM sales;

-- Q20. Find maximum revenue
SELECT
    MAX(revenue) AS max_revenue
FROM sales;

-- Q21. Find minimum revenue
SELECT
    MIN(revenue) AS min_revenue
FROM sales;

-- Q22. Calculate total quantity sold
SELECT
    SUM(quantity) AS total_quantity
FROM sales;

-- Q23. Calculate average product price
SELECT
    AVG(price) AS average_price
FROM sales;

-- Q24. Count total orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales;


-- ============================================================
-- 4. GROUP BY
-- ============================================================

-- Q25. Revenue by category
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Q26. Revenue by city
SELECT
    city,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- Q27. Revenue by product
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- Q28. Quantity sold by category
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
ORDER BY total_quantity DESC;

-- Q29. Quantity sold by city
SELECT
    city,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY city
ORDER BY total_quantity DESC;

-- Q30. Number of orders by product
SELECT
    product,
    COUNT(DISTINCT order_id) AS order_count
FROM sales
GROUP BY product
ORDER BY order_count DESC;

-- Q31. Average revenue by city
SELECT
    city,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM sales
GROUP BY city
ORDER BY average_revenue DESC;

-- Q32. Average revenue by category
SELECT
    category,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM sales
GROUP BY category
ORDER BY average_revenue DESC;


-- ============================================================
-- 5. HAVING
-- ============================================================

-- Q33. Categories with total revenue above 50,000
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
HAVING SUM(revenue) > 50000;

-- Q34. Cities with total revenue above 50,000
SELECT
    city,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
HAVING SUM(revenue) > 50000;

-- Q35. Products with total quantity greater than 5
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Q36. Cities with more than 3 orders
SELECT
    city,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY city
HAVING COUNT(DISTINCT order_id) > 3;


-- ============================================================
-- 6. CASE STATEMENTS
-- ============================================================

-- Q37. Categorize orders by revenue
SELECT
    order_id,
    customer_name,
    revenue,
    CASE
        WHEN revenue >= 50000 THEN 'High'
        ELSE 'Low'
    END AS revenue_category
FROM sales;

-- Q38. Categorize orders by quantity
SELECT
    order_id,
    customer_name,
    quantity,
    CASE
        WHEN quantity >= 5 THEN 'Bulk'
        ELSE 'Normal'
    END AS quantity_category
FROM sales;

-- Q39. Categorize products by price
SELECT
    order_id,
    product,
    price,
    CASE
        WHEN price >= 10000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS price_category
FROM sales;


-- ============================================================
-- 7. DATE ANALYSIS
-- ============================================================

-- Q40. Find January 2025 orders
SELECT *
FROM sales
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-02-01';

-- Q41. Find February 2025 orders
SELECT *
FROM sales
WHERE order_date >= '2025-02-01'
  AND order_date < '2025-03-01';

-- Q42. Find orders after January 15, 2025
SELECT *
FROM sales
WHERE order_date > '2025-01-15';

-- Q43. Calculate January 2025 revenue
SELECT
    SUM(revenue) AS january_revenue
FROM sales
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-02-01';

-- Q44. Calculate month-wise revenue
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;


-- ============================================================
-- 8. ADVANCED AGGREGATION
-- ============================================================

-- Q45. Highest revenue order in each city
SELECT
    city,
    MAX(revenue) AS highest_revenue
FROM sales
GROUP BY city;

-- Q46. Highest revenue order in each category
SELECT
    category,
    MAX(revenue) AS highest_revenue
FROM sales
GROUP BY category;

-- Q47. Average price by product
SELECT
    product,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY product
ORDER BY average_price DESC;

-- Q48. Order count and total revenue by city
SELECT
    city,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- Q49. Quantity and revenue by category
SELECT
    category,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Q50. Product with the highest total revenue
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 1;


-- ============================================================
-- 9. SUBQUERIES
-- ============================================================

-- Q51. Find orders above average revenue
SELECT *
FROM sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM sales
);

-- Q52. Find order(s) with the highest revenue
SELECT *
FROM sales
WHERE revenue = (
    SELECT MAX(revenue)
    FROM sales
);

-- Q53. Find products with price above average price
SELECT DISTINCT
    product,
    price
FROM sales
WHERE price > (
    SELECT AVG(price)
    FROM sales
);

-- Q54. Find Delhi orders above Delhi's average revenue
SELECT *
FROM sales
WHERE city = 'Delhi'
  AND revenue > (
      SELECT AVG(revenue)
      FROM sales
      WHERE city = 'Delhi'
  );

-- Q55. Find order(s) with the highest price
SELECT *
FROM sales
WHERE price = (
    SELECT MAX(price)
    FROM sales
);


-- ============================================================
-- 10. WINDOW FUNCTIONS
-- ============================================================

-- Q56. Rank orders by overall revenue
SELECT
    order_id,
    customer_name,
    revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM sales;

-- Q57. Rank orders by revenue within each category
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

-- Q58. Rank orders by revenue within each city
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

-- Q59. Calculate running total revenue
SELECT
    order_id,
    order_date,
    customer_name,
    revenue,
    SUM(revenue) OVER (
        ORDER BY order_date, order_id
    ) AS running_total_revenue
FROM sales;

-- Q60. Calculate total category revenue for each row
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


-- ============================================================
-- 11. DATA ANALYST QUERIES
-- ============================================================

-- Q61. Top 3 products by total revenue
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 3;

-- Q62. City with the highest total revenue
SELECT
    city,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;

-- Q63. Category with the highest total revenue
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;

-- Q64. Calculate Average Order Value (AOV)
SELECT
    ROUND(
        SUM(revenue) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM sales;

-- Q65. Product revenue contribution percentage
SELECT
    product,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY product
ORDER BY revenue_percentage DESC;

-- Q66. City revenue contribution percentage
SELECT
    city,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY city
ORDER BY revenue_percentage DESC;

-- Q67. Orders above average revenue
SELECT *
FROM sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM sales
);

-- Q68. Find bulk orders
SELECT *
FROM sales
WHERE quantity >= 5;

-- Q69. Electronics total and average revenue
SELECT
    SUM(revenue) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM sales
WHERE category = 'Electronics';

-- Q70. Delhi Electronics total revenue
SELECT
    SUM(revenue) AS total_revenue
FROM sales
WHERE city = 'Delhi'
  AND category = 'Electronics';


-- ============================================================
-- 12. INTERVIEW-LEVEL QUERIES
-- ============================================================

-- Q71. Find the second-highest revenue order
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 1 OFFSET 1;

-- Q72. Find the second-highest price
SELECT *
FROM sales
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- Q73. Highest revenue order in each city
SELECT
    city,
    product,
    revenue
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

-- Q74. Highest revenue order in each category
SELECT
    product,
    category,
    revenue
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

-- Q75. Cities that have both Electronics and Furniture
SELECT
    city
FROM sales
GROUP BY city
HAVING COUNT(DISTINCT category) = 2;

-- Q76. Customers who purchased a Laptop
SELECT DISTINCT
    customer_name
FROM sales
WHERE product = 'Laptop';

-- Q77. Products sold in more than one city
SELECT
    product,
    COUNT(DISTINCT city) AS city_count
FROM sales
GROUP BY product
HAVING COUNT(DISTINCT city) > 1;

-- Q78. Product with the highest total quantity sold
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 1;

-- Q79. City with the highest average order value
SELECT
    city,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM sales
GROUP BY city
ORDER BY average_order_value DESC
LIMIT 1;

-- Q80. Final city-level sales analysis
SELECT
    city,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;


-- ============================================================
-- END OF SALES ANALYSIS
-- ============================================================
```
