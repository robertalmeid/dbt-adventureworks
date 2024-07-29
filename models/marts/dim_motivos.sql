with
    motivo as (
        select 
        cast(SALESREASONID as string) AS pk_motivo
        , NAME AS motivo
        , REASONTYPE AS motivo_tipo
        from {{ ref('stg_erp__vendas_motivos') }}
    )
    select *
    from motivo