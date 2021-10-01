SELECT dept_name, AVG(salary) AS avg_dept_sal
FROM instructor
GROUP BY dept_name
ORDER BY avg_dept_sal;

SELECT building, COUNT( course_id ) AS cnt
FROM section
GROUP BY building
ORDER BY cnt DESC
LIMIT 1;
