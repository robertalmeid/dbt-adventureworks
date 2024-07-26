with
     fonte_pedido as (
        select        
            BILLTOADDRESSID
            ,SHIPTOADDRESSID
            ,SHIPMETHODID
            ,CREDITCARDID
            ,CREDITCARDAPPROVALCODE
            ,CURRENCYRATEID
            ,SUBTOTAL
            ,TAXAMT
            ,FREIGHT
            ,TOTALDUE
            ,COMMENT
            ,ROWGUID
            ,MODIFIEDDATE
            from {{ source('erp', 'salesorderheader') }}
     )
     select * from fonte_pedido