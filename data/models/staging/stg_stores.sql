with source as (

    select * from {{ ref('raw_walmart_store_openings') }}
    
),

renamed as (

    select
        STRPTIME("OPENDATE", '%-m/%-d/%y') as open_date,
        "STREETADDR" as address,
        "STRCITY" as city,
        "STRSTATE" as state_code,
        "ZIPCODE" as zip_code,
        "type_store" as type

    from source

)

select * from renamed
