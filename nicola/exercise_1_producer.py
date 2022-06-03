"""Implementation of exercise 1 in the event processing project."""

import argparse
from kafka3 import KafkaProducer

KAFKA_SERVER = 'localhost:9092'
KAFKA_TOPIC = 'my-test'

def read_events(filename):
    """Read all events from a file and send them to the server."""
    producer = KafkaProducer(bootstrap_servers=KAFKA_SERVER)

    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            producer.send(KAFKA_TOPIC, line.encode())

def main():
    """Entry point to the program."""
    parser = argparse.ArgumentParser()
    parser.add_argument('file')
    args = parser.parse_args()

    read_events(args.file)

if __name__ == "__main__":
    main()
