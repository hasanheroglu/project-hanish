-----streaming messages from events.json-----

CREATE STREAM meetup_events_stream(
	utc_offset BIGINT,
	venue STRUCT<country VARCHAR, city VARCHAR, address_1 VARCHAR, `name` VARCHAR, lon DOUBLE, lat DOUBLE>,
	rsvp_limit BIGINT,
	venue_visibility VARCHAR,
	visibility VARCHAR,
	maybe_rsvp_count BIGINT,
	description VARCHAR,
	mtime BIGINT,
	event_url VARCHAR,
	yes_rsvp_count BIGINT,
	payment_required INT,
	name VARCHAR,
	id BIGINT,
	time BIGINT,
	`group` STRUCT<
		join_mode VARCHAR, 
		country VARCHAR, 
		city VARCHAR, 
		name VARCHAR, 
		group_lon DOUBLE, 
		id BIGINT, 
		urlname VARCHAR, 
		category STRUCT<
			name VARCHAR, 
			id BIGINT, 
			shortname VARCHAR
		>, 
		group_photo STRUCT<
			highres_link VARCHAR, 
			photo_link VARCHAR, 
			photo_id BIGINT, 
			thumb_link VARCHAR>, 
		group_lat DOUBLE
	>, 
	status VARCHAR
) WITH (KAFKA_TOPIC='EP', KEY_FORMAT='JSON', VALUE_FORMAT='JSON');


