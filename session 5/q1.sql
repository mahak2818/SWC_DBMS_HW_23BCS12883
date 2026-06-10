SELECT
    7 AS month,
    COUNT(DISTINCT u.user_id) AS monthly_active_users
FROM user_actions u
WHERE DATE_TRUNC('month', u.event_date) = DATE '2022-07-01'
  AND EXISTS (
      SELECT 1
      FROM user_actions u2
      WHERE u2.user_id = u.user_id
        AND DATE_TRUNC('month', u2.event_date) = DATE '2022-06-01'
  );