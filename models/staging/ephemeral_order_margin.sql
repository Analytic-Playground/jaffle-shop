{{ config(materialized='ephemeral') }}

with orders as (
    select * from {{ ref('stg_orders')}}
)

select
    order_id,
    customer_id,
    location_id,
    ordered_at,
    order_total,
    tax_paid,
    order_total - tax_paid as pretax_total

from orders 