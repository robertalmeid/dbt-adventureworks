with
    src as (
        select *
        from {{ source('erp', 'employee') }}
    )
    select 
    * from src