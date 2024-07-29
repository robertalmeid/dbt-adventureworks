with
    src as (
        select 
        cast(CUSTOMERID as int) as pk_clienteid
        , cast(STOREID as int) as storeid
        , cast(TERRITORYID as int) as territoryid
        , cast(ACCOUNTNUMBER as string) as accountnumber
        from {{ source('erp', 'customer') }}
    )
    select 
    * from src