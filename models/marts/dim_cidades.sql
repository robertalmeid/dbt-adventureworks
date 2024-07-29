with
    cidade as (
        select *
        from {{ ref('stg_erp__enderecos') }}
    )
    select *
    from cidade