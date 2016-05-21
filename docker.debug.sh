#! /bin/bash

docker run --rm -t \
        -e OUTPUT_KAFKA="false" \
        -e OUTPUT_INFLUXDB="true" \
        -e OUTPUT_STDOUT="true" \
        -e PORT_SYSLOG='16000' \
        -p 16000:16000/udp \
        -i juniper/open-nti-input-syslog /bin/sh
