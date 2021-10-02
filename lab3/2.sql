SELECT dept_name, AVG(salary) AS avg_dept_sal
FROM instructor
GROUP BY dept_name
ORDER BY avg_dept_sal;

SELECT building, COUNT( course_id ) AS cnt
FROM section
GROUP BY building
ORDER BY cnt DESC
LIMIT 1;

SELECT dept_name, COUNT(course_id)
FROM course
GROUP BY dept_name
HAVING COUNT(course_id) =
       (select COUNT(course_id)
        from course
        GROUP BY dept_name
        LIMIT 1);
        
SELECT student.id, student.name
FROM student
WHERE student.id IN
      (SELECT takes.id
       FROM takes
       WHERE course_id IN
             (SELECT course_id
             FROM course
             WHERE dept_name LIKE '%Comp. Sci.%')
             GROUP BY takes.id
             HAVING COUNT(course_id) > 3);
             
SELECT *
FROM instructor
WHERE dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';

SELECT *
FROM instructor
WHERE id IN
      (SELECT DISTINCT(teaches.id)
       FROM teaches
       WHERE teaches.id NOT IN
             (SELECT DISTINCT (teaches.id)
              FROM teaches
              WHERE year = 2017)
       and year = 2018);

             
