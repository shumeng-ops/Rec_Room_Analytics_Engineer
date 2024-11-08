{{
    config(
        materialized = 'table'
    )
}}

{#
    Your code goes here. Bonus points if you can make this incremental, but that's not a requirement.
    You may test your solution by running `dbt build -s x_fact_subscription_activity_monthly`.
#}
select * from {{ ref('fact_subscription_activity_monthly_example') }}
