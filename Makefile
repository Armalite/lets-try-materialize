SHELL=/bin/bash -e -o pipefail
bold := $(shell tput bold)
sgr0 := $(shell tput sgr0)

.PHONY: help install check lint test hooks 
.SILENT:

output_location = "output"

MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := help

## display help message
help:
	@awk '/^##.*$$/,/^[~\/\.0-9a-zA-Z_-]+:/' $(MAKEFILE_LIST) | awk '!(NR%2){print $$0p}{p=$$0}' | awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' | sort


###############################################################################
# Setup/Install Targets
#
###############################################################################
install: install-poetry install-materialize install-postgres install-kubectl install-kind install-helm
	
install-materialize:
	cd scripts; chmod 777 materialize_install.sh
	/bin/bash ./scripts/materialize_install.sh

install-postgres:
	/bin/bash ./scripts/postgres_client_install.sh
	
install-poetry:
	/bin/bash ./scripts/poetry_install.sh

install-kubectl:
	/bin/bash ./scripts/kubectl_install.sh

install-kind:
	/bin/bash ./scripts/kind_install.sh

install-helm:
	/bin/bash ./scripts/helm_install.sh

###############################################################################
# Start / Connect Targets
#
###############################################################################
mz-start:
	materialized -w 1

mz-connect:
	psql -U materialize -h localhost -p 6875 materialize

kind-setup:
	/bin/bash ./scripts/kind_setup.sh

###############################################################################
# DBT Targets
#
###############################################################################
dbt-debug:
	cd dbt; poetry run dbt debug --profiles-dir .

dbt-compile:
	cd dbt; poetry run dbt compile --profiles-dir .

dbt-run:
	cd dbt; poetry run dbt run --profiles-dir .


###############################################################################
# Materialize Instance Targets
#
###############################################################################
mz-show-sources: 
	echo "SHOW SOURCES;" | psql -U materialize -h localhost -p 6875 materialize

mz-show-views: 
	echo "SHOW VIEWS;" | psql -U materialize -h localhost -p 6875 materialize

mz-show-objects:
	echo "SHOW FULL OBJECTS;" | psql -U materialize -h localhost -p 6875 materialize

mz-show-extended-objects:
	echo "SHOW EXTENDED FULL OBJECTS;" | psql -U materialize -h localhost -p 6875 materialize

mz-drop-source:
	echo "DROP SOURCE IF EXISTS $(source)" | psql -U materialize -h localhost -p 6875 materialize

mz-drop-source-cascade:
	echo "DROP SOURCE IF EXISTS $(source) CASCADE" | psql -U materialize -h localhost -p 6875 materialize

mz-stream-show:
	echo "COPY (TAIL $(view)) TO stdout;" | psql -U materialize -h localhost -p 6875 materialize

###############################################################################
# Deployment targets
#
###############################################################################


###############################################################################
# Tests
#
###############################################################################

