{{ config(
    alias='mart_hubspot_email_event_delivered',
    enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_delivered_enabled'])
) }}

{{ email_events_joined(var('email_event_delivered')) }}
