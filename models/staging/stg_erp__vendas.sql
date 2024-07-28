with
    src as (
        select 
        cast(SALESORDERID AS INT) AS pk_vendaid
        , cast(ORDERDATE as date) AS data_venda
        , cast(SHIPMETHODID as int) as shipmethodid 
        , cast(BILLTOADDRESSID as int) as enderecoid 
        , cast(CREDITCARDID as int) as creditcardid  
        , cast(SUBTOTAL as decimal(18,4)) as subtotal 
        , cast(TAXAMT as decimal(18,4)) as taxamt 
        , cast(FREIGHT as decimal(18,4)) as freight
        , cast(TOTALDUE as decimal(18,4)) as totaldue 
        from {{ source('erp', 'salesorderheader') }}
    )
    select 
    * from src

