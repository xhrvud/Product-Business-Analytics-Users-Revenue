-- User-level conversion funnel

-- Funnel totals
SELECT
  COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewers,
  COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS add_to_cart,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS buyers
FROM events;

-- Conversion rate (view → purchase)
SELECT
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)::float
  /
  COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS conversion_rate
FROM events;

-- Funnel by day
SELECT
  DATE(event_time) AS date,
  COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewers,
  COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS add_to_cart,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS buyers
FROM events
GROUP BY date
ORDER BY date;
