{{
  config(
    materialized = "view"
  )
}}

with diffs as (
    select subscription_id, user_id, tier, is_active, subscription_mrc, record_start_date, record_end_date, is_current_record from {{ ref('dim_subscription_example') }}
    except
    select subscription_id, user_id, tier, is_active, subscription_mrc, record_start_date, record_end_date, is_current_record from {{ ref('dim_subscription') }}
)
select
    count(*) as diff_count
from
    diffs
