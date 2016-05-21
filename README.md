# open-nti-input-syslog
Standalone container running fluentd to parse syslog

This container has been designed to work with the project OpenNTI but it can fit for other projects as well.  
Multiple type of output are supported and can be defined at launch time:
- Influxdb
- Kafka
- MQTT (not yet)
- Stdout

This container can run in standalone mode or it can you can run multiple behind a load-balancer using docker-compose.
_A docker-compose configuration file is (not yet) provided._

## Environment variables

So parameters can be overwritten using environment variables define at launch time.   
Here is the list of variables available with their default value.

```yaml

  # Define type of output
  OUTPUT_KAFKA: false
  OUTPUT_INFLUXDB: false
  OUTPUT_MQTT: false
  OUTPUT_STDOUT: false

  # Input port
  PORT_SYSLOG: 6000

  # parameter for Influxdb
  INFLUXDB_ADDR: localhost
  INFLUXDB_PORT: 8086
  INFLUXDB_DB: juniper
  INFLUXDB_USER: juniper
  INFLUXDB_PWD: juniper
  INFLUXDB_FLUSH_INTERVAL: 2

  # parameter for Kafka
  KAFKA_ADDR: localhost
  KAFKA_PORT: 9092
  KAFKA_DATA_TYPE: json
  KAFKA_TOPIC: events
```

Here is an example to define an environment variable
```
docker run -d -e INFLUXDB_ADDR: 'localhost' -i juniper/open-nti-input-syslog
```

## Docker Compose

> The Load Balancer is not yet part of the docker-compose file
> For now, it's recommended to use https://hub.docker.com/r/eslam/pen/

To start
```
docker-compose up -d
```
