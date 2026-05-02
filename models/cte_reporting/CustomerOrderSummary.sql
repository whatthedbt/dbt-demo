with customer_orders as (
    select c.customer_id,
    c.customer_lname,
    count(o.order_id) as total_orders
    from {{ ref('customers_raw') }} as c
    left join {{ ref('orders_raw') }} as o on c.customer_id = o.order_customer_id
    group by c.customer_id, c.customer_lname
),

customer_spend as (
    select 
    o.order_customer_id,
    sum(oi.order_item_quantity * oi.order_item_product_price) as total_spent
    from {{ ref('orders_raw') }} as o 
    join {{ ref('order_items_raw') }} as oi
    on o.order_id = oi.order_item_order_id
    group by o.order_customer_id

)

select co.customer_id,
       co.customer_lname,
       co.total_orders,
       coalesce(cs.total_spent, 0) as total_spent
       from customer_orders as co
       left join customer_spend as cs
       on co.customer_id = cs.order_customer_id
       order by co.total_orders desc

