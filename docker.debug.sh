#! /bin/bash

docker run --rm -t \
        -e OUTPUT_KAFKA="true" \
        -e OUTPUT_INFLUXDB="false" \
        -e INFLUXDB_ADDR="172.17.0.3" \
        -e INFLUXDB_NUM_THREADS="3" \
        -e INFLUXDB_FLUSH_INTERVAL="5s" \
        -e KAFKA_ADDR="10.0.0.121" \
        -e KAFKA_TOPIC="events" \
        -e OUTPUT_STDOUT="false" \
        -e PORT_SYSLOG='16000' \
        -p 16000:16000/udp \
        -p 24220:24220 \
        -i juniper/open-nti-input-syslog /bin/sh
