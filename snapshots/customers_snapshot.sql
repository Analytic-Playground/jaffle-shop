{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_type', 'lifetime_spend']
    )
}}

select * from {{ ref('customers') }}

{% endsnapshot %}