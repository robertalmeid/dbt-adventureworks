with
    src as (
        select *
        from {{ source('erp', 'salesterritory') }}
    )
    select 
    * from src