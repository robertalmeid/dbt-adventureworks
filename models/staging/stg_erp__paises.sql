with
    src as (
        select 
        cast(COUNTRYREGIONCODE as string) as pk_paisid
        , cast(NAME as string) as nm_pais
        from {{ source('erp', 'countryregion') }}
    )
    select 
    * from src