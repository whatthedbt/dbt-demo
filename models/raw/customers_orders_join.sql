{{
    config(
        materialized='table'
    )
}}

select o.order_id, c.customer_id, c.customer_fname, c.customer_lname, o.order_status from 
{{ ref('customers_raw') }} as c left join {{ ref('orders_raw') }} as o
on c.customer_id = o.order_customer_id order by c.customer_id