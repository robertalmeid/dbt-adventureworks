with
    src as (
        select *
        from {{ source('erp', 'salesreason') }}
    )
    select 
    * from src