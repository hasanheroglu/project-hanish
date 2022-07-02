CREATE TABLE num_events_per_city AS
    SELECT venue->city AS city
         , COUNT(id) AS num_events
    FROM events
    GROUP BY venue->city
    EMIT CHANGES;

CREATE STREAM total_events AS
    SELECT e.venue->country
         , t.city
         , t.num_events
    FROM events AS e
    INNER JOIN num_events_per_city t
    ON t.city = e.venue->city
    EMIT CHANGES;
