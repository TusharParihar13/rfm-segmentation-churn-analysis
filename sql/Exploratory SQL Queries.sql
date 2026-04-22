SELECT * from online_retail;

-- Total transactions and customers
SELECT 
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    MIN(invoicedate) AS first_purchase,
    MAX(invoicedate) AS last_purchase
FROM online_retail;

-- Revenue by country
SELECT 
    country,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(quantity * price)::numeric, 2) AS total_revenue
FROM online_retail
GROUP BY country
ORDER BY total_revenue DESC;

-- Top 10 customers by revenue
SELECT 
    customer_id,
    COUNT(DISTINCT invoice) AS total_orders,
    ROUND(SUM(quantity * price)::numeric, 2) AS total_spent
FROM online_retail
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

