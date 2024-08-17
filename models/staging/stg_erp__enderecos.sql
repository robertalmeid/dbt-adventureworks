with
    source_address as (
        select 
        cast(ADDRESSID as int) as pk_enderecoid
        , cast(ADDRESSLINE1 as string) as endereco
        , cast(STATEPROVINCEID as int) as fk_cidadeid
        , cast(CITY as string) as cidade
        , cast(STATEPROVINCEID as int) fk_estadoid
        , *
        from {{ source('erp', 'address') }}
    )
    select 
    * from source_address