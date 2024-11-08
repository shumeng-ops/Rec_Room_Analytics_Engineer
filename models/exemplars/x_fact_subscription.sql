{{
  config(
    materialized = "view"
  )
}}

with diffs as (
    select
        event_date, source_id, user_id event_type, tier, net_mrc_amt, net_subscriber_cnt, add_cnt, remove_cnt,
        time_to_deact_days, readd_cnt, time_to_react_days, upgrade_cnt, downgrade_cnt, prev_tier
    from
        {{ ref('fact_subscription_example') }}

    except

    select
        event_date, source_id, user_id event_type, tier, net_mrc_amt, net_subscriber_cnt, add_cnt, remove_cnt,
        time_to_deact_days, readd_cnt, time_to_react_days, upgrade_cnt, downgrade_cnt, prev_tier
    from
        {{ ref('fact_subscription') }}
)
select
    count(*) as diff_count
from
    diffs
