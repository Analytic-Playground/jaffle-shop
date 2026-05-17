
with orders as (
select * from {{ ref('stg_orders') }}
),

location as (
select * from {{ ref('stg_locations') }}
),

region_mapping as (
    select * from {{ ref('location_regions') }}
),

location_performance as (
select 
    a.location_id, 
    a.location_name, 
    c.region,
    count(b.order_id) as order_count, 
    {{ safe_divide('sum(b.order_total)', 'count(b.order_id)') }} as avg_order,
    sum(b.order_total) as total_revenue,
    a.opened_date

from location a 
left join orders b 
    on a.location_id = b.location_id
left join region_mapping c 
    on a.location_id = c.location_id
group by 
    a.location_id, 
    a.location_name,
    a.opened_date,
    c.region
)

select * 
from location_performance