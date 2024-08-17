with
    dim_regioes as (
        select *
        from {{ ref('dim_regioes')}}
    )
    ,dim_produtos as (
        select *
        from {{ ref('dim_produtos')}}
    )
    ,dim_calendario as (
        select *
        from {{ ref('dim_calendario')}}
    )
    ,dim_clientes as (
        select *
        from {{ ref('dim_clientes')}}
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
    , fatos.fk_enderecoid as fk_enderecoid
    --, dim_regioes.fk_estadoid as estado
    --, dim_estados.fk_paisid as pais
    , fatos.fk_cartaoid as tipocartao
    , fatos.fk_clienteid as cliente
    , fatos.fk_data as data
    , fatos.fk_produtoid as produto
    , fatos.qtd
    , fatos.precounitario as precounitario
    , fatos.descontounitario as descontounitario
    , fatos.vlr_total as vlr_total
    , fatos.vlr_desconto as vlr_desconto
    , fatos.vlr_com_desconto as vlr_com_desconto
    from joined as fatos
    left join dim_regioes on fatos.fk_enderecoid = dim_regioes.pk_enderecoid
    left join dim_clientes on fatos.fk_clienteid = dim_clientes.pk_clienteid








