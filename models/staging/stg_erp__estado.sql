with
    src as (
        select 
        cast(STATEPROVINCEID as int) as pk_estadoid
        , cast(NAME as string) as nm_cidade
        , cast(COUNTRYREGIONCODE as string) fk_paisid
        from {{ source('erp', 'stateprovince') }}
    )
    select 
    * from src