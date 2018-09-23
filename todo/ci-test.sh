#!/bin/bash
echo "Starting a PostgreSQL container to support testing"
PG=$(docker run -P -d -e POSTGRES_USER=todo -e POSTGRES_PASSWORD=todo postgres:10.4)
PGPORT=$(docker port ${PG} 5432/tcp | sed -e 's/.*://')

echo "Running npm install on application"
npm install
npm run grunt

echo "Running database migration"
export DATABASE_URL=postgres://todo:todo@localhost:${PGPORT}/todo
npm run prestart

echo "Running test"
npm test
RET=$?

echo "Shutting down PostgreSQL test instance"
docker rm -f ${PG}

exit $RET
