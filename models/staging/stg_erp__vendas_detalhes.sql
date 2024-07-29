with
    src as (
        select 
        cast(SALESORDERDETAILID as int) as pk_vendasdetalheid
        , cast(SALESORDERID as int) as fk_vendasid
        , cast(ProductId as int) as fk_produtoId
        , cast(ORDERQTY as int) as qtd 
        , cast(UNITPRICE AS decimal(18,3)) as precounitario
        , cast(UNITPRICEDISCOUNT AS decimal(18,2)) as descontounitario    
        from {{ source('erp', 'salesorderdetail') }}
    )
    select 
    * from src