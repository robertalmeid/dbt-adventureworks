with
    src as (
        select 
        cast(customerid as int) as pk_clienteid
        , cast(storeid as int) as storeid
        , cast(territoryid as int) as territoryid
        , cast(accountnumber as string) as accountnumber
        from {{ source('erp', 'customer') }}
    )
    select 
    * from src