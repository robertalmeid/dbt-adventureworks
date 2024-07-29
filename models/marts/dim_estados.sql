with
    estado as (
        select *
        from {{ ref('stg_erp__estados') }}
    )
    select *
    from estado