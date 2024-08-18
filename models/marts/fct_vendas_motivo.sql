with
    dim_produtos as (
        select *
        from {{ ref('dim_produtos')}}
    )
    ,dim_clientes as (
        select *
        from {{ ref('dim_clientes')}}
    )
    ,dim_calendario as (
        select *
        from {{ ref('dim_calendario')}}
    )
    ,motivo as (
        select *
        from {{ ref('dim_motivos')}}
    )
    ,ligamotivo as (
        select *
        from {{ ref('stg_erp__vendas_motivo_pedido')}}
    ) 
    ,vendas as (
        select *
        from {{ ref('int_vendas_por_item')}}
    )
    , joined as (
        select *
        from vendas as fatos
        left join dim_produtos on fatos.fk_produtoid = dim_produtos.pk_produtoid
    )
    select 
    fatos.pk_vendasdetalheid as pk_pedido_itens
    , fatos.fk_vendasid
    , motivo.pk_motivo as fk_motivo
    , fatos.fk_cartaoid as tipocartao
    , fatos.fk_clienteid as clienteid
    , fatos.fk_data as data
    , fatos.fk_produtoid as produto
    , fatos.qtd
    , fatos.vlr_total as vlr_total
    from joined as fatos
    left join dim_clientes on fatos.fk_clienteid = dim_clientes.pk_clienteid
    left join ligamotivo on fatos.fk_vendasid = ligamotivo.salesorderid
    left join motivo on ligamotivo.salesreasonid = motivo.pk_motivo
    where fatos.pk_vendasdetalheid is not null




