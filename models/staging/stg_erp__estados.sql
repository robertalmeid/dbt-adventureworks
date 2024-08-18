with
    src as (
        select 
        cast(stateprovinceid as int) as pk_estadoid
        , cast(NAME as string) as nm_estado
        , cast(COUNTRYREGIONCODE as string) fk_paisid
        from {{ source('erp', 'stateprovince') }}
    )
    select 
    * from src