{{ config(materialized='materializedview') }}

SELECT 1 as id 
-- window functions are not support yet :sadface:
/*ts::TIMESTAMP::DATE,
       AVG(bid_price) OVER (PARTITION BY ts ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS avg
FROM {{ ref('view_market_orders') }}
GROUP BY ts::TIMESTAMP::DATE
*/
