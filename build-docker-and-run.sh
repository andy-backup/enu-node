#!/bin/bash
set -e

docker build -t mingfunwong/enu:1.7.3 .
docker-compose down
docker-compose up