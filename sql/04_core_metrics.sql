-- Core product metrics

-- Total Revenue
SELECT
  SUM(price) AS total_revenue
FROM events
WHERE event_type = 'purchase';

-- Revenue per day
SELECT
  DATE(event_time) AS date,
  SUM(price) AS revenue
FROM events
WHERE event_type = 'purchase'
GROUP BY date
ORDER BY date;

-- Daily Active Users (DAU)
SELECT
  DATE(event_time) AS date,
  COUNT(DISTINCT user_id) AS dau
FROM events
GROUP BY date
ORDER BY date;

-- ARPU (Average Revenue Per User)
SELECT
  SUM(price) / COUNT(DISTINCT user_id) AS arpu
FROM events
WHERE event_type = 'purchase';
