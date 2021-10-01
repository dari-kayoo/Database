SELECT *
FROM course
WHERE credits > 3;

SELECT *
FROM classroom
WHERE building = 'Watson' or building = 'Packard';

SELECT *
FROM course
WHERE dept_name = 'Computer Science';

SELECT *
FROM section
WHERE semester = 'Fall';

SELECT *
FROM student
WHERE tot_cred > 45 and tot_cred < 90;

SELECT *
FROM student
WHERE name like '%a' or name like '%e' or
      name like '%i' or name like '%o' or
      name like '%u' or name like '%y';

SELECT *
FROM prereq
WHERE prereq_id = 'CS-101';
