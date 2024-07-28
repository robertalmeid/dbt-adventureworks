with
    src as (
        select *
        from {{ source('erp', 'customer') }}
    )
    select 
    * from src