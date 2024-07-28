with
    src as (
        select *
        from {{ source('erp', 'purchaseorderdetail') }}
    )
    select 
    * from src