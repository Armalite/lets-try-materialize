{{ config(materialized='materializedview') }}

SELECT symbol,
       stddev_samp(bid_price) AS avg
FROM {{ ref('view_market_orders') }}
GROUP BY symbol