with source as (

    select * from {{ ref('raw_amazon_purchases') }}
    
),

renamed as (

    select
        STRPTIME("Order Date", '%-m/%-d/%Y') as date,
        "Purchase Price Per Unit" as price_per_unit,
        "Quantity" as quantity,
        "Shipping Address State" as state_code,
        "Title" as title,
        "Category" as category

    from source

)

select * from renamed
