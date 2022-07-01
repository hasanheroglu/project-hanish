# project-hanish

Event Processing Project

## TopK Query

`nicola/get_top_cities.py` collects a list of the top `N` meetup cities is Europe and writes a
JSON object `{ "city-name": num-events, ... }` to stdout. For example:

    $ python nicola/get_top_cities.py 15

The required stream and table structures are created with `nicola/queries.sql`.
