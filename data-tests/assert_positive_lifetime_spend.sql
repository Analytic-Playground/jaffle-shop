-- test to verify all customers have positive lifetime spend
SELECT
    *
FROM {{ ref('customer_order_margins') }}
WHERE
    lifetime_spend < 0