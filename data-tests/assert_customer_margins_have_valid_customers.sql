-- query to verify that all customer ids associated with an order are valid in stg_customers
SELECT 
    *
FROM {{ ref('customer_order_margins')}} a 
LEFT JOIN {{ ref('stg_customers')}} b 
    ON a.customer_id = b.customer_id

WHERE
    b.customer_id IS NULL