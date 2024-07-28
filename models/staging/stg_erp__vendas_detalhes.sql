with
    src as (
        select *
        from {{ source('erp', 'salesorderdetail') }}
    )
    select 
    * from src