"""Implementation of exercise 1 in the event processing project."""

import json
import argparse
from sys import stdin
from kafka3 import KafkaConsumer

KAFKA_SERVER = 'localhost:9092'
KAFKA_TOPIC = 'my-test'

def main():
    """Entry point to the program."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--topic', default=KAFKA_TOPIC)
    parser.add_argument('--server', default=KAFKA_SERVER)
    args = parser.parse_args()

    consumer = KafkaConsumer(args.topic, bootstrap_servers=args.server)
    print('-- Consumer started. ENTER to consume an event.')
    for msg in consumer:
        stdin.readline()
        print(json.dumps(json.loads(msg.value), indent=4))

if __name__ == "__main__":
    main()
