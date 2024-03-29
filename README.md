# project-hanish

Event Processing Project

## Setup

Use docker-compose to setup an entire Zookeeper + Kafka + ksqlDB stack with `docker-compose.yml`:

    # docker compose -f docker-compose.yml up

The following ports are exposed on the host:

 - 9092: The Kafka broker

 - 8088: The ksqlDB server

Execute

    # docker exec -it ksqldb-cli ksql http://ksqldb-server:8088

to log into the ksqlDB server via a command-line prompt.

## TopK Query

`nicola/get_top_cities.py` collects a list of the top `N` meetup cities is Europe and writes a
JSON object `{ "city-name": num-events, ... }` to stdout. For example:

    $ python nicola/get_top_cities.py 15

The required stream and table structures are created with `nicola/queries.sql`.

## Latency Measurements

To measure latencies:

    $ python nicola/latency.py --topic TOPIC_NAME [-n MAX_EVENTS] > OUT_FILE
    $ python nicola/plot_latency.py OUT_FILE

The first script will consume events from `TOPIC_NAME` and store measured latencies in `OUT_FILE` until interrupted or
the optional argument `MAX_EVENTS` is reached.
