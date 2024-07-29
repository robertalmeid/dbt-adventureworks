with
    pais as (
        select *
        from {{ ref('stg_erp__paises')}}
    )
    select *
    from pais