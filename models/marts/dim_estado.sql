with
    estado as (
        select *
        from {{ ref('stg_erp__estado')}}
    )
    select *
    from estado