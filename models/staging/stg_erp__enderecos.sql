with
    source_address as (
        select distinct
            cast(addressid as int) as pk_enderecoid
            , cast(addressline1 as string) as endereco
            , cast(city as string) as fk_cidadeid
            , cast(city as string) as cidade
            , cast(stateprovinceid as int) fk_estadoid
            , *
        from {{ source('erp', 'address') }}
    )
    select 
    * from source_address