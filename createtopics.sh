#!/usr/bin/bash 
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.incoming.postings
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.postings
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.balances
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.backvalued
docker exec kafka_kafka-1_1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 100 --topic topos.core.incoming.postings.reply
