with
    src as (
        select 
        cast(salesorderid AS INT) AS pk_vendaid
        , cast(BILLTOADDRESSID as int) as fk_enderecoid 
        , cast(CREDITCARDID as int) as fk_cartaoid  
        , cast(PURCHASEORDERNUMBER AS string) as fk_comprasid
        , cast(CUSTOMERID AS int) as fk_clienteid
        , cast(ORDERDATE as date) AS fk_data
        , cast(SHIPMETHODID as int) as shipmethodid 
        , cast(SUBTOTAL as decimal(18,4)) as subtotal 
        , cast(TAXAMT as decimal(18,4)) as taxamt 
        , cast(FREIGHT as decimal(18,4)) as freight
        , cast(TOTALDUE as decimal(18,4)) as totaldue 
        from {{ source('erp', 'salesorderheader') }}
    )
    select 
    * from src

