# lets-try-materialize
This repository contains a dbt project that utilizes a Materialize stream and performs stream processing


# Environment Setup

 1. Clone this repository
 2. Run the install script `make install`

The install script will install the following
 - Python poetry
 - dbt-materialize v1.0.0 or greater
 - postgres client
 - Various other libraries that can be found listed in `pyproject.toml`

# Start Materialize

 - You can start the local materialize instance with `make materialize-connect`