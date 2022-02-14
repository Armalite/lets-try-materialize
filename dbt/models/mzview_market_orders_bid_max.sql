{{ config(materialized='materializedview') }}

SELECT symbol,
       MAX(bid_price) AS avg
FROM {{ ref('view_market_orders') }}
GROUP BY symbol