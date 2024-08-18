with
    source_cc as (
        select *
        from {{ source('erp', 'creditcard') }}
        where creditcardid is not null
    )
    select 
    * from source_cc