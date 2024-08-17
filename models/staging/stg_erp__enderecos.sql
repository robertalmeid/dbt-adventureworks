with
    source_address as (
        select distinct
            cast(ADDRESSID as int) as pk_enderecoid
            , cast(ADDRESSLINE1 as string) as endereco
            , cast(CITY AS STRING) as fk_cidadeid
            , cast(CITY as string) as cidade
            , cast(STATEPROVINCEID as int) fk_estadoid
            , *
        from {{ source('erp', 'address') }}
        where fk_estadoid = 1
        order by 1
    )
    select 
    * from source_address