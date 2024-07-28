with
    fonte_produto as (
        select 
        cast(PRODUCTID AS int) as pk_produto
        , cast(NAME AS string) as nm_produtos
        , cast(PRODUCTNUMBER AS string) as cod_produto
        from {{ source('erp', 'product') }}
    )
    select 
    * from fonte_produto