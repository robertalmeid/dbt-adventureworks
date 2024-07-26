with
    source_address as (
        select *
        from {{ source('erp', 'address') }}
    )
    select 
    * from source_address