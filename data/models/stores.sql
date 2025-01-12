with stores as (

    select * from {{ ref('stg_stores') }}

),

states as (

    select * from {{ ref('stg_usa_states') }}

),

final as (

    select
        stores.open_date,
        stores.address,
        stores.city,
        stores.state_code,
        stores.type,
        states.name as state
    
    from stores
    
    left join states 
        on stores.state_code = states.code

)

select * from final
