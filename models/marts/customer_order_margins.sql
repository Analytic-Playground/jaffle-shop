{{ config(materialized='table') }}

with order_margins as (
    select * from {{ ref('ephemeral_order_margin') }}
)

select
    customer_id,
    count(order_id) as order_count,
    sum(order_total) as lifetime_spend,
    sum(pretax_total) as lifetime_pretax_spend,
    sum(tax_paid) as lifetime_tax_paid

from order_margins
group by
    customer_id