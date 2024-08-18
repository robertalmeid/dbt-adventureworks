with
    vendas_2011 as (
        select cast(sum(vlr_total) as decimal(18,0)) as vlr_total
        from {{ ref('fct_vendas') }}
        where fk_data between '2011-01-01' and '2011-12-31'
    )

    select 
        vlr_total
        from vendas_2011 --12.646.112,16
    where vlr_total not between 12646111 and 12646113