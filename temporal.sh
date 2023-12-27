!/usr/bin/env bash

export CASSANDRA_VERSION=3.11.9
export ELASTICSEARCH_VERSION=7.16.2
export TEMPORAL_VERSION=1.15.2
export TEMPORAL_WEB_VERSION=1.14.0
export TEMPORAL_UI_VERSION=0.5.0
docker-compose -f ./temporal/docker-compose.yml up -d
