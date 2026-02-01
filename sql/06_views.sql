-- Analytical views for BI tools

CREATE VIEW daily_metrics AS
SELECT
  DATE(event_time) AS date,
  COUNT(DISTINCT user_id) AS dau,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS buyers,
  SUM(CASE WHEN event_type = 'purchase' THEN price END) AS revenue
FROM events
GROUP BY date;
