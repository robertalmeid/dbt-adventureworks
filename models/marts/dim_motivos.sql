with
    motivo as (
        select 
        cast(salesreasonid as string) as pk_motivo
        , name as motivo
        , reasontype as motivo_tipo
        from {{ ref('stg_erp__vendas_motivos') }}
    )
    select *
    from motivo