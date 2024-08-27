with
    compras as (
        select *
        from {{ ref('stg_erp__compras')}}
    )
    ,compras_detalhes as (
        select *
        from {{ ref('stg_erp__compras_detalhes')}}
    )
    ,joined as (
        select 
       *
        from compras
    )
    select *
    from joined

