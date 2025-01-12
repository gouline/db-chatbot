with source as (

    select * from {{ ref('raw_usa_states') }}
    
),

renamed as (

    select
        "Postal" as code,
        "State" as name

    from source

)

select * from renamed
