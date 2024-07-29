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
        /*, vendas.fk_cartaoid
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
        */
        from compras
    )
    select *
    from joined

