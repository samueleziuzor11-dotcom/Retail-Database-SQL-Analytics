SELECT *
FROM customer_table;

SELECT *
FROM order_item_table;

SELECT *
FROM orders_table;

SELECT *
FROM products_table;

-- Total revenue per customer

SELECT *
FROM orders_table o
JOIN order_item_table oi
	ON o.order_id = oi.order_id
JOIN products_table p
	ON p.product_id = oi.product_id
JOIN customer_table c
	ON c.customer_id = o.customer_id;
    
SELECT c.customer_id, c.full_name, sum(oi.quantity * p.price) as total_rev
FROM orders_table o
JOIN order_item_table oi
	ON o.order_id = oi.order_id
JOIN products_table p
	ON p.product_id = oi.product_id
JOIN customer_table c
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_rev;

-- Monthly sales trend

SELECT DATE_FORMAT(o.order_date, '%Y-%m') `MONTH`, sum(oi.quantity * p.price) as Sales 
FROM orders_table o
JOIN order_item_table oi
	ON o.order_id = oi.order_id
JOIN products_table p
	ON p.product_id = oi.product_id
JOIN customer_table c
	ON c.customer_id = o.customer_id
GROUP BY `MONTH`
ORDER BY `MONTH`, Sales ASC;
    
-- Top 10 best-selling products

SELECT p.product_id, p.product_name, p.category, sum(oi.quantity * p.price) as Best_Selling
FROM orders_table o
JOIN order_item_table oi
	ON o.order_id = oi.order_id
JOIN products_table p
	ON p.product_id = oi.product_id
JOIN customer_table c
	ON c.customer_id = o.customer_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY Best_Selling DESC
LIMIT 10;

-- Customer segmentation based on purchase frequency
SELECT c.full_name, COUNT(distinct o.order_id) as Purchase_Frequency
FROM customer_table c
JOIN orders_table o
	ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY Purchase_Frequency DESC;
    
SELECT c.full_name, COUNT(distinct o.order_id) as Purchase_Frequency,
CASE 
	WHEN COUNT(distinct o.order_id) >= 10 THEN 'High Frequency'
    WHEN COUNT(distinct o.order_id) >= 5 THEN 'Mid Frequency'
    ELSE 'Low Frequency'
END AS Segments
FROM customer_table c
JOIN orders_table o
	ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY Purchase_Frequency DESC;

-- Average order value per customer

SELECT c.full_name, sum(oi.quantity * p.price) as order_total
FROM orders_table o
JOIN order_item_table oi
	ON o.order_id = oi.order_id
JOIN products_table p
	ON p.product_id = oi.product_id
JOIN customer_table c
	ON c.customer_id = o.customer_id
GROUP BY c.full_name;

-- I have a question here why we had to name that and also why we had to connect it as order_totals.order_id

SELECT c.full_name, ROUND(AVG(order_total),2) as Avg_ord_total
FROM customer_table c
JOIN orders_table o
	ON c.customer_id = o.customer_id
JOIN
(SELECT oi.order_id, sum(oi.quantity * p.price) as order_total
FROM order_item_table oi
JOIN products_table p
	ON p.product_id = oi.product_id
GROUP BY oi.order_id 
)
AS order_totals                                      
	ON o.order_id = order_totals.order_id
GROUP BY c.full_name
ORDER BY Avg_ord_total DESC;

-- Revenue by product category

SELECT *
FROM order_item_table oi
JOIN products_table p
	ON p.product_id = oi.product_id;
    
SELECT p.product_name, p.category, sum(oi.quantity * p.price) AS Revenue
FROM order_item_table oi
JOIN products_table p
	ON p.product_id = oi.product_id
GROUP BY p.product_name, p.category 
ORDER BY Revenue;

-- Identify repeat customers

WITH Repeat_customers AS
(SELECT full_name, ROW_NUMBER() OVER(partition by full_name) as row_num
FROM customer_table
group by full_name
)
SELECT *
FROM Repeat_customers
WHERE row_num > 1;

SELECT full_name, COUNT(*) num_of_times
FROM customer_table
GROUP BY full_name
HAVING COUNT(*) > 1;

-- Rank customers by total spend
SELECT c.customer_id, c.full_name, sum(p.price * oi.quantity ) as Total_spend
FROM order_item_table oi
JOIN orders_table o
	 ON oi.order_id = o.order_id
JOIN products_table p
	ON oi.product_id = p.product_id
JOIN customer_table c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
ORDER by Total_spend DESC;