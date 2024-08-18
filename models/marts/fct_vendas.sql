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
        left join dim_produtos on fatos.fk_produtoid = dim_produtos.pk_produtoid
    )
    select 
        fatos.pk_vendasdetalheid
        , fatos.fk_vendasid
        , fatos.fk_enderecoid
        , fatos.fk_cartaoid
        , fatos.fk_clienteid
        , fatos.fk_data
        , fatos.fk_produtoid
        , fatos.qtd
        , fatos.precounitario as precounitario
        , fatos.descontounitario as descontounitario
        , fatos.vlr_total as vlr_total
        , fatos.vlr_desconto as vlr_desconto
        , fatos.vlr_com_desconto as vlr_com_desconto
        , dim_regioes.nm_cidade
        , dim_regioes.nm_pais
    from joined as fatos
    left join dim_regioes on fatos.fk_enderecoid = dim_regioes.pk_enderecoid
    left join dim_clientes on fatos.fk_clienteid = dim_clientes.pk_clienteid
    left join dim_produtos on fatos.fk_produtoid = dim_produtos.pk_produtoid
