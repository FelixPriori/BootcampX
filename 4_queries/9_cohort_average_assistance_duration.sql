SELECT avg(total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, 
    sum(assistance_requests.completed_at - assistance_requests.started_at)
      as total_duration
  FROM assistance_requests 
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_duration;