{{
    config(
        materialized = 'table'
    )
}}

{#
    Your code goes here. Bonus points if you can make this incremental, but that's not a requirement.
    You may test your solution by running `dbt build -s x_dim_subscription`
#}
select  * from {{ ref('dim_subscription_example') }}
