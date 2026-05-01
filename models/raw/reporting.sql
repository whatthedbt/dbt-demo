{{
    config(
        materialized='view'
    )
}}

select * from {{ ref('customers_orders_order_details_join') }} 
where order_status = 'PENDING'