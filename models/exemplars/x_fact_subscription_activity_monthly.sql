{{
  config(
    materialized = "view"
  )
}}

with diffs as (
    select
        ds, begin_base_cnt, begin_base_mrc, tier_1299_cnt, tier_799_cnt, tier_099_cnt, net_subscriber_cnt, growth_rate,
        net_mrc_amt, add_cnt, readd_cnt, avg_days_to_readd, upgrade_cnt, downgrade_cnt, remove_cnt, churn_rate
    from
        {{ ref('fact_subscription_activity_monthly_example') }}

    except

    select
        ds, begin_base_cnt, begin_base_mrc, tier_1299_cnt, tier_799_cnt, tier_099_cnt, net_subscriber_cnt, growth_rate,
        net_mrc_amt, add_cnt, readd_cnt, avg_days_to_readd, upgrade_cnt, downgrade_cnt, remove_cnt, churn_rate
    from
        {{ ref('fact_subscription_activity_monthly') }}

)
select
    count(*) as diff_count
from
    diffs
