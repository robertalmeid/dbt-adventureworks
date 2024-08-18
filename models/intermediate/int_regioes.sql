with
    enderecos as (
        select 
            pk_enderecoid
            , fk_cidadeid
        from {{ ref('stg_erp__enderecos')}}
    )
    ,cidades as (
        select distinct
            cidade as pk_cidadeid
            , cidade
            , fk_estadoid
        from {{ ref('stg_erp__enderecos')}}
    )
    ,estados as (
        select 
            pk_estadoid
            , nm_estado
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
            enderecos.pk_enderecoid
            , enderecos.fk_cidadeid
            , cidades.cidade
            , cidades.cidade as nm_cidade
            , cidades.fk_estadoid
            , estados.pk_estadoid
            , estados.nm_estado
            , estados.fk_paisid
            , paises.pk_paisid
            , paises.nm_pais
        from enderecos
        left join cidades on enderecos.fk_cidadeid = cidades.pk_cidadeid
        left join estados on cidades.fk_estadoid = estados.pk_estadoid
        left join paises on estados.fk_paisid = paises.pk_paisid
    )
    select *
    from joined
