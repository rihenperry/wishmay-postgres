#!/bin/bash
set -e

psql -U postgres -c "\du";
psql -U postgres -c "CREATE USER ${WISHMAY_USER} WITH PASSWORD '${WISHMAY_USER_PWD}'";
psql -U postgres -c "CREATE DATABASE ${WISHMAY_DB}";
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ${WISHMAY_DB} TO ${WISHMA_USER}";
