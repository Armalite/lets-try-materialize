{{ config(materialized='materializedview') }}

SELECT 
       AVG(bid_price) OVER (PARTITION BY ts ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS avg
FROM {{ ref('view_market_orders') }}
WHERE 1=1
AND ts::time > mz_logical_timestamp() - INTERVAL '1' minute

