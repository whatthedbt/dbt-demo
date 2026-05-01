{{
    config(
        materialized='table'
    )
}}
select * from raw.retail_db.departments