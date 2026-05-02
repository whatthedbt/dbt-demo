{{ config(materialized="table") }}


select
    c.customer_id,
    c.customer_fname,
    o.order_status,
    i.order_item_subtotal,
    i.order_item_product_price,
from {{ ref("customers_raw") }} as c
left join {{ ref("orders_raw") }} as o on c.customer_id = o.order_customer_id
left join {{ ref("order_items_raw") }} as i on o.order_id = i.order_item_order_id
