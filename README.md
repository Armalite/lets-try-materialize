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

# Connect to Materialize console
Requires: Materialize has been started in another shell (see above section)
 - You can connect directly to the Materialize console to run commands with `make materialize-connect`

# Test DBT Connectivity
Requires: Materialize has been started in another shell
 - You can test dbt connectivity to the materialize db with `make dbt-debug`

# Run the DBT Models

 - You can the dbt models with `make dbt-run`


# FAQ

 - Error: ```
            02:46:07  Database Error in model src_market_orders_raw (models/src_market_orders_raw.sql)
            02:46:07    catalog item 'src_market_orders_raw' already exists
            02:46:07    compiled SQL at target/run/lets_try_materialize/models/src_market_orders_raw.sql
        ```
   - Change the name of the view name being passed into `mz_generate_name('src_market_orders_raw')` inside `models/src_market_orders_raw.sql` to some other name