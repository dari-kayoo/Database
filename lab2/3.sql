CREATE DATABASE University;
    CREATE TABLE students
    (
        full_name                  varchar(50)      not null primary key,
        age                        integer          not null,
        birth_date                 date             not null,
        gender                     varchar(6)       not null,
        average_grade              double precision not null,
        information_about_yourself text,
        need_for_dormitory         boolean,
        additional_info            text
    );
    CREATE TABLE instructors
    (
        full_name                            varchar(50) not null primary key,
        speaking_languages                   text,
        work_experiences                     text,
        possibility_of_having_remote_lessons boolean

    );
    CREATE TABLE lesson_participants
    (
        lesson_tittle       text,
        teaching_instructor varchar(50) references instructors (full_name),
        studying_students   varchar(50) references students (full_name),
        room_number         integer
    );
