with
    cartao as (
        select 
        CREDITCARDID as pk_cartaoid
        , CARDTYPE as tipocartao
        from {{ ref('stg_erp__cartoescredito') }}
    )
    select *
    from cartao