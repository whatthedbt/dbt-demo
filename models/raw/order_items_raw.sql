{{
    config(
        materialized='table'
    )
}}
select * From raw.retail_db.order_items