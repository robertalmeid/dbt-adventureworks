with
    fonte_produto as (
        select *
        from {{ source('erp', 'product') }}
    )
    select 
    * from fonte_produto