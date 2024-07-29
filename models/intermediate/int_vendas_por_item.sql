with
    vendas as (
        select *
        from {{ ref('stg_erp__vendas')}}
    )
    ,vendas_detalhes as (
        select *
        from {{ ref('stg_erp__vendas_detalhes')}}
    )
    ,joined as (
        select 
        vendas_detalhes.pk_vendasdetalheid
        , vendas.fk_cartaoid
        , vendas.fk_clienteid
        , vendas.fk_comprasid
        , vendas.fk_data
        , vendas.fk_enderecoid
        , vendas_detalhes.fk_vendasid
        , vendas_detalhes.fk_produtoId
        , vendas_detalhes.qtd
        , vendas_detalhes.precounitario
        , vendas_detalhes.descontounitario
        , (qtd * precounitario) as vlr_total
        , (qtd * descontounitario) as vlr_desconto
        , ((qtd * precounitario) - (qtd * descontounitario)) as vlr_com_desconto
        from vendas
        left join vendas_detalhes 
        on vendas.pk_vendaid = vendas_detalhes.fk_vendasid
    )
    select *
    from joined

