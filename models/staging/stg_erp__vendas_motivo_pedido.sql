with
    src as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
    select 
    * from src