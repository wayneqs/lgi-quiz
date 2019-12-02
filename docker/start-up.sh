#! /bin/sh

./docker/prepare-db.sh
mkdir -p ./tmp/pids
PORT=3000 foreman start