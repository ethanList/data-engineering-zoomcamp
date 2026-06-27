with unioned as (
    select * from {{ ref('int_trips_unioned') }}
),

cleaned_and_enriched as (
    select
        {{ dbt_utils.generate_surrogate_key(['u.vendor_id', 'u.pickup_datetime', 'u.pickup_location_id', 'u.service_type']) }} as trip_id,
        u.vendor_id,
        u.service_type,
        u.rate_code_id,
        u.pickup_location_id,
        u.dropoff_location_id,
        u.pickup_datetime,
        u.dropoff_datetime,
        u.store_and_fwd_flag,
        u.passenger_count,
        u.trip_distance,
        u.trip_type,
        u.fare_amount,
        u.extra,
        u.mta_tax,
        u.tip_amount,
        u.tolls_amount,
        u.ehail_fee,
        u.improvement_surcharge,
        u.total_amount,
        coalesce(u.payment_type, 0) as payment_type,
        {{ get_payment_type_description('u.payment_type') }} as payment_type_description

    from unioned u

    qualify row_number() over (
        partition by u.vendor_id, u.pickup_datetime, u.pickup_location_id, u.service_type
        order by u.dropoff_datetime
    ) = 1
)

select * from cleaned_and_enriched