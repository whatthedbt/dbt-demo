{{
    config(
        materialized='table'
    )
}}
select * From {{ source('my_new_project', 'order_items') }}
