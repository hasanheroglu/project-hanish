from argparse import ArgumentParser
from nicola.get_top_cities import query, statement

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('files', nargs='*')
    parser.add_argument('--server', nargs='?', default='localhost:8088')
    parser.add_argument('-v', '--verbose', action='store_true')
    args = parser.parse_args()

    for file in args.files:
        with open(file) as f:
            success, msg = statement(f.read(), args.server)
            if not success:
                print(f'❌{file}', end='')
                if args.verbose:
                    print(f' [{msg}]')
                else:
                    print('')

            else:
                print(f'✓ {file}')
