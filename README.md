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
Requires: Materlialize has been started in another shell (see above section)
 - You can connect directly to the Materialize console to run commands with `make materialize-connect`

# Test DBT Connectivity

 - Charlie bit me