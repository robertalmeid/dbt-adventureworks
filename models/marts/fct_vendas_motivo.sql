with
    dim_pais as (
        select *
        from {{ ref('dim_paises')}}
    )
    ,dim_estados as (
        select *
        from {{ ref('dim_estados')}}
    )
    ,dim_cidades as (
        select *
        from {{ ref('dim_cidades')}}
    )
    ,dim_produtos as (
        select *
        from {{ ref('dim_produtos')}}
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
        left join dim_produtos on fatos.fk_produtoid = dim_produtos.pk_produto
    )
    select 
    fatos.pk_vendasdetalheid as pedido_itens
    , fatos.fk_vendasid as pedido
    , fatos.fk_enderecoid as cidade
    , dim_cidades.fk_estadoid as estado
    , dim_estados.fk_paisid as pais
    , motivo.pk_motivo as fk_motivo
    , fatos.fk_cartaoid as tipocartao
    , fatos.fk_clienteid as cliente
    , fatos.fk_data as data
    , fatos.fk_produtoid as produto
    , fatos.qtd
    , fatos.vlr_total as vlr_total
    from joined as fatos
    left join dim_cidades on fatos.fk_enderecoid = dim_cidades.pk_enderecoid
    left join dim_estados on dim_estados.pk_estadoid = dim_cidades.fk_estadoid
    left join dim_paises on dim_paises.pk_paisid = dim_estados.fk_paisid
    left join dim_clientes on fatos.fk_clienteid = dim_clientes.pk_clienteid
    left join ligamotivo on fatos.fk_vendasid = ligamotivo.SALESORDERID
    left join motivo on ligamotivo.SALESREASONID = motivo.pk_motivo




