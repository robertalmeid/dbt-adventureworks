with
    pessoa as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )
    select *
    from pessoa