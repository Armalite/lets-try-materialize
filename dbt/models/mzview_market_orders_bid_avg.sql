{{ config(materialized='materializedview') }}

SELECT symbol,
       AVG(bid_price) AS avg
FROM {{ ref('view_market_orders') }}
GROUP BY symbol