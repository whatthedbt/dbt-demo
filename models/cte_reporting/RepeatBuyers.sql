WITH customer_order_counts AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM {{ source('retailer', 'orders') }}
    GROUP BY customer_id
),
repeat_customers AS (
    SELECT *
    FROM customer_order_counts
    WHERE order_count > 1
)
SELECT 
    COUNT(*) AS repeat_customer_count,
    AVG(order_count) AS avg_orders_per_repeat_customer
FROM repeat_customers
