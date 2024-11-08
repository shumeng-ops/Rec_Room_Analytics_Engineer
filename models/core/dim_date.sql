{{
    config(
        materialized="table",
        sort="date"
    )
}}

WITH date_spine AS (
    {{
        dbt_utils.date_spine(
        datepart="month",
        start_date="cast('2021-01-01' as date)",
        end_date="cast('2022-08-31' as date)"
       )
    }}
)
SELECT
    date_month AS date,
    DATE_PART('year', date_month) AS year,
    DATE_PART('quarter', date_month) AS quarter,
    DATE_PART('month', date_month) AS month,
    TO_CHAR(date_month, 'YYYY-MM') AS year_month
FROM
    date_spine
