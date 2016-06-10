#! /bin/bash

docker run --rm -t \
        -e OUTPUT_KAFKA="false" \
        -e OUTPUT_INFLUXDB="true" \
        -e INFLUXDB_ADDR="172.29.110.16" \
        -e INFLUXDB_NUM_THREADS="3" \
        -e INFLUXDB_FLUSH_INTERVAL="5s" \
        -e KAFKA_ADDR="172.29.110.16" \
        -e KAFKA_TOPIC="events" \
        -e OUTPUT_STDOUT="false" \
        -e PORT_SYSLOG='16000' \
        -p 16000:16000/udp \
        -p 24220:24220 \
        -v $(pwd)/fluent.conf:/fluentd/etc/fluent.conf \
        -i juniper/open-nti-input-syslog 
