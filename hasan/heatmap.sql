CREATE STREAM munich WITH (kafka_topic='munich-heatmap')
AS SELECT m.venue->city, m.venue->lon, m.venue->lat FROM meetup_events_stream m
WHERE (m.venue is not null and LCASE(m.venue->city) IN ('münchen', 'munich'))
EMIT CHANGES;
