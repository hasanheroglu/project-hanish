CREATE STREAM MUNICH_HEATMAP WITH(KAFKA_TOPIC = 'munich-heatmap') AS
SELECT venue->lat AS LAT, venue->lon AS lon FROM MEETUP_EVENTS_STREAM 
WHERE (venue is not null and LCASE(venue->city) IN ('munich', 'münchen'));
