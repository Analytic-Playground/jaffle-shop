{{ config(materialized='incremental') }}

with orders as (
    select * from {{ ref('stg_orders') }}
    {% if is_incremental() %}
        where ordered_at > (select max(ordered_at) from {{ this }})
    {% endif %}
)

select 
    ordered_at,
    count(order_id) as order_count,
    sum(order_total) as total_revenue

from orders
group by ordered_at