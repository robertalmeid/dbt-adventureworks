with
    src as (
        select 
            cast(PURCHASEORDERID as int) as pk_compras
            ,cast(REVISIONNUMBER as int) as REVISIONNUMBER
            ,cast(STATUS as int) as STATUS
            ,cast(EMPLOYEEID as int) as EMPLOYEEID
            ,cast(VENDORID as int) as VENDORID
            ,cast(SHIPMETHODID as int) as SHIPMETHODID
            ,cast(ORDERDATE as date) as fk_data
            ,cast(SUBTOTAL as decimal(18,4)) as vlr_total
            ,cast(TAXAMT as decimal(18,4)) as impostos
            ,cast(FREIGHT as decimal(18,4)) as frete
        from {{ source('erp', 'purchaseorderheader') }}
    )
    select 
    * from src