{{ config(
    alias='mart_hubspot_deal_history',
    enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])
) }}

with history as (

    select *
    from {{ var('deal_property_history') }}

), windows as (

    select
        deal_id,
        field_name,
        change_source,
        change_source_id,
        change_timestamp as valid_from,
        new_value,
        lead(change_timestamp) over (partition by deal_id order by change_timestamp) as valid_to
    from history

), surrogate as (

    select
        windows.*,
        {{ dbt_utils.surrogate_key(['field_name','deal_id','valid_from']) }} as id
    from windows

)

select *
from surrogate
