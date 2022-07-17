CREATE STREAM events(
    utc_offset BIGINT,
    venue STRUCT<
        country VARCHAR,
        city VARCHAR,
        address_1 VARCHAR,
        `name` VARCHAR,
        lon DOUBLE,
        lat DOUBLE
    >,
    rspv_limit BIGINT,
    venue_visibility VARCHAR,
    maybe_rsvp_count BIGINT,
    description VARCHAR,
    mtime BIGINT,
    event_url VARCHAR,
    yes_rsvp_count BIGINT,
    payment_required INT,
    name VARCHAR,
    id VARCHAR,
    time BIGINT,
    `group` STRUCT<
        join_mode VARCHAR,
        country VARCHAR,
        city VARCHAR,
        name VARCHAR,
        group_lon DOUBLE,
        group_lat DOUBLE,
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
            thumb_link VARCHAR
        >
    >,
    status VARCHAR
) WITH (KAFKA_TOPIC='events', KEY_FORMAT='JSON', VALUE_FORMAT='JSON');
