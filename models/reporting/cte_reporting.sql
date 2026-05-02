{{
    config(
        materialized='table'
    )
}}
with
    expensive_items as (
        select o.order_id, o.order_status, i.order_item_product_price
        from {{ ref("orders_raw") }} as o
        join {{ ref("order_items_raw") }} as i on o.order_id = i.order_item_order_id
        where o.order_status not in('PROCESSING', 'CLOSED', 'PENDING_PAYMENT')
        order by i.order_item_product_price desc
    )

select * from expensive_items 