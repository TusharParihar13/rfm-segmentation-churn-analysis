-- RFM base calculation using SQL
-- Reference date: day after the last purchase in dataset
SELECT
    customer_id,
    -- Recency (days since last purchase)
    (CURRENT_DATE - MAX(invoicedate::date)) AS recency_days,
    -- Frequency (number of orders)
    COUNT(DISTINCT invoice) AS frequency,
    -- Monetary value
    ROUND(SUM(quantity * price)::numeric, 2) AS monetary
FROM online_retail
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY monetary DESC;