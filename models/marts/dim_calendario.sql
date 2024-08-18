with    
    data_vendas as (
        select fk_data as data
        from stg_erp__vendas
    )
    , data_compras as (
        select fk_data as data
        from stg_erp__compras
    )
    ,uni_datas as (
        select * from 
        data_vendas
        union all
        select *
        from data_compras
    )
    select distinct 
    data AS pk_data
    , cast(YEAR(data) as int) as ano
    , cast(month(data) as int) as mes
    , cast(day(data) as int) as dia
    from uni_datas
   