#!/bin/bash
set -e

# Load the POSTGRES_MULTIPLE_DATABASES variable or use default values
POSTGRES_MULTIPLE_DATABASES=${POSTGRES_MULTIPLE_DATABASES:-'postgres:postgres:postgres'}

# Strip leading and trailing spaces
POSTGRES_MULTIPLE_DATABASES=$(echo $POSTGRES_MULTIPLE_DATABASES | xargs)

# Split the string into an array
IFS=' ' read -ra DATABASES <<< "$POSTGRES_MULTIPLE_DATABASES"

# Loop over the array and create each user and database
for i in "${DATABASES[@]}"; do
    IFS=':' read -ra DB <<< "$i"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER ${DB[0]} WITH PASSWORD '${DB[2]}';
        CREATE DATABASE ${DB[1]};
        GRANT ALL PRIVILEGES ON DATABASE ${DB[1]} TO ${DB[0]};
EOSQL
done
