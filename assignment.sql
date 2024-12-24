SELECT
 refresh_date AS Day,
 term AS Top_Term,
 rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank BETWEEN 1 AND 3
 -- Choose only the top term each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)
 -- Filter to the last 2 weeks.
GROUP BY week, Top_Term, rank
ORDER BY Day DESC