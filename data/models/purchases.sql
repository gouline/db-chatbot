with purchases as (

    select * from {{ ref('stg_purchases') }}

),

states as (

    select * from {{ ref('stg_usa_states') }}

),

final as (

    select
        purchases.date,
        purchases.price_per_unit,
        purchases.quantity,
        purchases.title,
        lower(replace(purchases.category, '_', ' ')) as category,
        states.name as state
    
    from purchases
    
    left join states 
        on purchases.state_code = states.code

)

select * from final
