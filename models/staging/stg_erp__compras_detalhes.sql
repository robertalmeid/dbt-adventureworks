with
    src as (
        select *
        --, cast(unitprice decimal(18,4)) as precounitario
        from {{ source('erp', 'purchaseorderdetail') }}
    )
    select 
    * from src