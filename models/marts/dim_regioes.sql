with
    regiao as (
        select distinct *
        from {{ ref('int_regioes') }}
    )
    select *
    from regiao