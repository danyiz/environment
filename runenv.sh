#!/usr/bin/bash 

docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker-compose -f ./portainer/docker-compose.yml up -d

docker-compose -f ./yugabyte/docker-compose.yml up -d
docker run -d --network=host -p 8080:8080 -e KAFKA_BROKERS=localhost:29092 quay.io/cloudhut/kowl:master 

docker-compose -f ./temporal/docker-compose/docker-compose-cass.yml up -d

docker-compose -f ./kafka/docker-compose.yml up -d
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.incoming.postings
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.postings
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.balances
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.backvalued
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.incoming.postings.reply



