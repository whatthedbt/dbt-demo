{{
    config(
        materialized='table'
    )
}}
select * from {{ source('my_new_project', 'departments') }}