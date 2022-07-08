'''.'''

import argparse
import json
from .ksql import query

europe = [
    'AX', 'AL', 'AD', 'AM', 'AT', 'BY', 'BE', 'BA', 'BG', 'HR', 'CZ', 'DK',
    'EE', 'FO', 'FI', 'FR', 'DE', 'GI', 'GR', 'GG', 'VA', 'HU', 'IS', 'IE',
    'IM', 'IT', 'JE', 'LV', 'LI', 'LT', 'LU', 'MK', 'MT', 'MD', 'MC', 'ME',
    'NL', 'NO', 'PL', 'PT', 'RO', 'RU', 'SM', 'RS', 'SK', 'SI', 'ES', 'SJ',
    'SE', 'CH', 'UA', 'GB',
]

def main():
    '''Main.'''
    parser = argparse.ArgumentParser()
    parser.add_argument('count', nargs='?', default=10, type=int)
    parser.add_argument('--server', default='localhost:8088')
    args = parser.parse_args()

    idx, response = query('SELECT * FROM total_events;', args.server)

    city_idx = idx['city']
    num_events_idx = idx['num_events']
    country_idx = idx['country']

    cities = {}
    with response as rows:
        for row in rows:
            row = json.loads(row.decode())
            if row[country_idx] in europe:
                cities[row[city_idx]] = row[num_events_idx]

    cities = sorted(cities.items(), key=lambda item: item[1])[-args.count:]
    print(json.dumps(dict(cities)))

if __name__ == '__main__':
    main()
