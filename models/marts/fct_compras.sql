with
    src as (
        select *
        from {{ ref('stg_erp__compras')}}
    )
    select *
    from src