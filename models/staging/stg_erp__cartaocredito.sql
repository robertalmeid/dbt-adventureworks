with
    source_cc as (
        select *
        from {{ source('erp', 'creditcard') }}
    )
    select 
    * from source_cc