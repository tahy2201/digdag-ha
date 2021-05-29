#!/usr/bin/env bash
set -e

# rendering server.properties
envsubst < /etc/digdag/server.properties > /etc/digdag/server.properties

host="$1"
shift
  
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
echo "$@"
exec "$@"
