with
    src as (
        select *
        from {{ source('erp', 'purchaseorderheader') }}
    )
    select 
    * from src