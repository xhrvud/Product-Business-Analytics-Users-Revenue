-- Table schema for raw e-commerce events data

CREATE TABLE events (
    event_time TIMESTAMP,
    event_type TEXT,
    product_id BIGINT,
    category_id BIGINT,
    category_code TEXT,
    brand TEXT,
    price NUMERIC,
    user_id BIGINT,
    user_session TEXT
);
