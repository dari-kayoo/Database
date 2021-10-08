SELECT *
FROM course
WHERE credits > 3;

SELECT *
FROM classroom
WHERE building = 'Watson' or building = 'Packard';

SELECT *
FROM course
WHERE dept_name = 'Comp. Sci.';

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
      name like '%u';

SELECT *
FROM prereq
WHERE prereq_id = 'CS-101';
