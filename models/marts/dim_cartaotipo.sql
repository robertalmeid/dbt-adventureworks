with
    cartao as (
        select 
        creditcardid as pk_cartaoid
        , cardtype as tipocartao
        from {{ ref('stg_erp__cartoescredito') }}
    )
    select *
    from cartao