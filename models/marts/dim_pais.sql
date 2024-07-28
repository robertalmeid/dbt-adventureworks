with
    src as (
        select *
        from {{ ref('stg_erp__pais')}}
    )
    select *
    from src