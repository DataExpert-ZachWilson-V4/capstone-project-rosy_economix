-- models/staging/stg_cpi.sql
{{ config(materialized='view') }}

with raw as (
    select *
    from {{ ref('raw_cpi') }}
),
cleaned as (
    select
        date,
        value as cpi_value
    from raw
    where date is not null
)
select * from cleaned