-- Data sanity checks and basic validation

-- Total number of events
SELECT COUNT(*) 
FROM events;

-- Date range
SELECT 
    MIN(event_time) AS min_date,
    MAX(event_time) AS max_date
FROM events;

-- Event types distribution
SELECT event_type, COUNT(*)
FROM events
GROUP BY event_type;

-- Price availability by event type
SELECT
  event_type,
  COUNT(price) AS price_not_null
FROM events
GROUP BY event_type;
