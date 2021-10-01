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
WHERE RIGHT(name,1) = 'a' or RIGHT(name,1) = 'e' or
      RIGHT(name,1) = 'i' or RIGHT(name,1) = 'o' or
      RIGHT(name,1) = 'u' or RIGHT(name,1) = 'y';

SELECT *
FROM prereq
WHERE prereq_id = 'CS-101';
