SELECT
  avg_table.name, avg_table.avg_cohorts_time
FROM 
(
  SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at) as avg_cohorts_time
  FROM assistance_requests 
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  GROUP BY cohorts.name
) as avg_table
WHERE avg_cohorts_time = 
(
  SELECT max(avg_cohorts_time) as max_cohort_time
  FROM 
  (
    SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at)
      as avg_cohorts_time
    FROM assistance_requests 
    JOIN students ON student_id = students.id
    JOIN cohorts ON cohort_id = cohorts.id
    GROUP BY cohorts.name
  ) as avg_cohorts_time
);