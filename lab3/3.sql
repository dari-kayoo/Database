SELECT *
FROM student
WHERE id IN(
    SELECT takes.id
    FROM takes
    WHERE grade IN('A', 'A-')
    )
    and dept_name = 'Comp. Sci.'
ORDER BY name;

SELECT *
FROM instructor
WHERE instructor.id IN(
    SELECT i_id
    FROM advisor
    WHERE s_id IN(
        SELECT takes.id
        FROM takes
        WHERE grade NOT IN ('A', 'A-', 'B+', 'B')
        )
    );

SELECT *
FROM department
WHERE dept_name NOT IN(
    SELECT student.dept_name
    FROM student
    WHERE student.id IN(
        SELECT takes.id
        FROM takes
        WHERE takes.grade = 'F' or takes.grade = 'C')
        );

SELECT *
FROM instructor
WHERE id NOT IN(
    SELECT teaches.id
    FROM teaches
    WHERE (course_id,sec_id,semester,year) IN(
        SELECT takes.course_id, takes.sec_id, takes.semester, takes.year
        FROM takes
        WHERE takes.grade = 'A')
        );

SELECT *
FROM course
WHERE course_id IN(
    SELECT course_id
    FROM section
    WHERE time_slot_id IN(
        SELECT time_slot_id
        FROM time_slot
        WHERE end_hr < 13
        )
    );
