with
    src as (
        select 
            cast(BUSINESSENTITYID as int) as pk_pessoas
            , cast(TITLE as string) as titulo
            , cast(FIRSTNAME as string) as primeiro_nome
            , cast(MIDDLENAME as string) as meio_nome
            , cast(LASTNAME as string) as final_nome
            , concat(primeiro_nome,' ',final_nome) as fullname
        from {{ source('erp', 'person') }}
    )
    select 
    * from src