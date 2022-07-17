import json
import argparse
from sys import stdin
from kafka3 import KafkaConsumer

KAFKA_SERVER = 'localhost:9092'
KAFKA_TOPIC = 'munich-heatmap'

def get_data_from_topic():
    """Entry point to the program."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--topic', default=KAFKA_TOPIC)
    parser.add_argument('--server', default=KAFKA_SERVER)
    args = parser.parse_args()

    consumer = KafkaConsumer(args.topic, bootstrap_servers=args.server, auto_offset_reset = 'earliest')

    data = []
    count = 0 

    for message in consumer:
        data.append(json.loads(message.value.decode('utf-8')))
        count += 1
        if count >= 500:
            break

    return data