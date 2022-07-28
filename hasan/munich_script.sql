CREATE STREAM MUNICH WITH(KAFKA_TOPIC = 'munich') AS
 SELECT * FROM MEETUP_EVENTS_STREAM WHERE (venue is not nu
ll and LCASE(venue->city) IN ('munich', 'münchen'));
