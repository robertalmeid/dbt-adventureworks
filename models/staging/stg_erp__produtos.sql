with
    fonte_produto as (
        select 
        cast(productid as int) as pk_produtoid
        , cast(name AS string) as nm_produtos
        , cast(productnumber as string) as cod_produto
        from {{ source('erp', 'product') }}
        where productid is not null
    )
    select 
    * from fonte_produto