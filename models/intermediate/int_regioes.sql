with
    cidades as (
        select 
            cidade
            , fk_estadoid
        from {{ ref('stg_erp__enderecos')}}
    )
    ,estados as (
        select 
            pk_estadoid
            , nm_cidade
            , fk_paisid
        from {{ ref('stg_erp__estados')}}
    )
   ,paises as (
        select 
            pk_paisid
            , nm_pais
        from {{ ref('stg_erp__paises')}}
    )
   ,joined as (
        select 
            cidades.cidade
            , cidades.fk_estadoid
            , estados.pk_estadoid, nm_cidade, fk_paisid
            , paises.pk_paisid, nm_pais
        from cidades
        left join estados on cidades.fk_estadoid = estados.pk_estadoid
        left join paises on estados.fk_paisid = paises.pk_paisid
    )
    select *
    from joined
