SELECT students.name, count(assistance_requests.*) as total_assistances
FROM students
JOIN assistance_requests
ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;