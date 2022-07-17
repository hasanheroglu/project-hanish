CREATE TABLE num_events_per_city AS
    -- Remove leading and trailing postal code
    SELECT REGEXP_REPLACE(REGEXP_REPLACE(venue->city, '^[0-9]* ', ''), ' [0-9]([0-9]|\\w)*$', '') AS city
         , COUNT(id) AS num_events
    FROM events
    GROUP BY REGEXP_REPLACE(REGEXP_REPLACE(venue->city, '^[0-9]* ', ''), ' [0-9]([0-9]|\\w)*$', '')
    EMIT CHANGES;

CREATE STREAM total_events AS
    SELECT e.venue->country
         , t.city
         , t.num_events
    FROM events AS e
    INNER JOIN num_events_per_city t
    ON t.city = e.venue->city
    EMIT CHANGES;
