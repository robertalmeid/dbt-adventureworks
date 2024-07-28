with
    src as (
        select *
        from {{ ref('stg_erp__vendas')}}
    )
    select *
    from src