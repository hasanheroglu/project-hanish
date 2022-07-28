CREATE STREAM DEUTSCHLAND WITH(KAFKA_TOPIC = 'deutschland') AS SELECT * FROM MEETUP_EVENTS_STREAM WHERE (venue is not null and LCASE(venue->country) = 'de');
