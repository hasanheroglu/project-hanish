"""Implementation of exercise 1 in the event processing project."""

import sys
import time
import argparse
from kafka3 import KafkaProducer

KAFKA_SERVER = 'localhost:9092'
KAFKA_TOPIC = 'events'

def read_events(file, server, topic, sleep):
    """Read all events from a file and send them to the server."""
    producer = KafkaProducer(bootstrap_servers=server)
    for line in file:
        producer.send(topic, line.encode())
        if (sleep > 0):
            time.sleep(sleep / 1000)

def main():
    """Entry point to the program."""
    parser = argparse.ArgumentParser()
    parser.add_argument('file')
    parser.add_argument('--topic', default=KAFKA_TOPIC)
    parser.add_argument('--server', default=KAFKA_SERVER)
    parser.add_argument('--delay', type=int, default=0,
                        help='Time in milliseconds to wait between two events')
    args = parser.parse_args()

    if args.file == '-':
        read_events(sys.stdin, args.server, args.topic, args.delay)
    else:
        with open(args.file, 'r', encoding='utf-8') as file:
            read_events(file, args.server, args.topic, args.delay)

if __name__ == "__main__":
    main()
