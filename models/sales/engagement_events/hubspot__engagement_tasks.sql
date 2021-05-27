{{ config(
    alias='mart_hubspot_engagement_tasks',
    enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_task_enabled','hubspot_engagement_enabled'])
) }}

{{ engagements_joined(var('engagement_task')) }}
