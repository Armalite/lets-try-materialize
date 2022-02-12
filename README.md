# lets-try-materialize
This repository contains a dbt project that utilizes a Materialize stream and performs stream processing


# Environment Setup

 1. Clone this repository
 2. Run the install script `make install`

The install script will do the following
 - Install Python poetry
 - Install materialize daemon (aka materialized)
 - Install dbt-materialize v1.0.0 or greater
 - Install postgres client
 - Install various other libraries that can be found listed in `pyproject.toml`

# Start Materialize

 - You can start the local materialize instance with `make materialize-start`
 - Materalize will begin listening on the current shell
 - You will need to open another shell instance to perform further tasks

# Test DBT Connectivity
Requires: Materialize has been started in another shell
 - You can test dbt connectivity to the materialize db with `make dbt-debug`

# Run the DBT Models

 - You can run the dbt models with `make dbt-run`

# Explore Materialize models 
This repository comes with a `Makefile` that contains many targets that perform Materialized commands for you, without you needing to first connect to the Materialized console.
Requires: Materialize instance running and dbt models have been executed

| Command  | Description |
| ------------- | ------------- |
| `make mz-show-sources`  | Show all Materialize sources |
| `make mz-show-views` | Show all Materialize views  |
| `make mz-stream-show view=<view name>` |  <ul><li>Stream a Materialized view to stdout</li><li>For example: `make mz-output-stream view=mzview_market_orders_avg`</li><li>To exit the stream, press `CTRL + C` </li></ul>
| `make mz-drop-source source=<source name>` | Drop a Materialize source |
| `make mz-drop-source-cascade sourc=<source name>` | Drop a Materialized source **and** any dependent views  |

# Connect to Materialize console
Requires: Materialize has been started in another shell (see above section)
 - You can connect directly to the Materialize console to run commands with `make materialize-connect`
 - Once connected, you can run any materialize command such as `SHOW SOURCES;` to view these

# Materialize Console Commands to try out
*Requires: Connect to Materialize console (above section).*
*Recommended: Ensure you have performed a `make dbt-run` for all the materialize models to execute*

Connecting to the Materialize console allows you to perform Materialize daemon commands i.e. if you wish to run a command that has not been included in the Makefile targets :-)
 - `SHOW SOURCES;` - will show all sources defined
 - `SHOW VIEWS;` - will show all the views defined with the dbt models
 - `COPY (TAIL mzview_market_orders_avg) TO stdout;` - This will output stream of data processed by the mzview_market_orders_avg dbt model with millisecond latency

# FAQ

 - Error: ```
            02:46:07  Database Error in model src_market_orders_raw (models/src_market_orders_raw.sql)
            02:46:07    catalog item 'src_market_orders_raw' already exists
            02:46:07    compiled SQL at target/run/lets_try_materialize/models/src_market_orders_raw.sql
        ```
   - *Resolution:* Remove the already existing view: `make mz-drop-source-cascade source=src_market_orders_raw`