with
    pais as (
        select *
        from {{ ref('stg_erp__paises') }}
    )
    ,estado as (
        select *
        from {{ ref('stg_erp__estados') }}
    )
    ,cidade as (
        select *
        from {{ ref('stg_erp__enderecos')}}
    )
    ,clientes as (
        select *
        from {{ ref('stg_erp__clientes')}}
    )
    ,joined as (
        select *
        from clientes
    )
select *
from joined
