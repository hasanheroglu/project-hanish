'''Latency measurements.'''

import sys
import time
import argparse

from kafka3 import KafkaConsumer

def main():
    parser = argparse.ArgumentParser(description='Prints latencies in milliseconds.')
    parser.add_argument('-n', '--num-events', type=int, help='Exit after consuming N events.')
    parser.add_argument('--server', default='localhost:9092')
    parser.add_argument('--topic')
    args = parser.parse_args()

    consumer = KafkaConsumer(args.topic, bootstrap_servers=args.server)
    try:
        for i, msg in enumerate(consumer):
            if args.num_events and i >= args.num_events:
                break
            current_time = time.time_ns() / 1000000  # Convert ns to ms
            latency = current_time - msg.timestamp
            print(latency)
    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    main()
