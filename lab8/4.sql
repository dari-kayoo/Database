--4--
drop table employees;
CREATE TABLE employees(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE,
    age INT,
    salary INT,
    workexperience INT,
    discount INT,
    PRIMARY KEY (id)
);
INSERT INTO employees(name, date_of_birth, age, salary, workexperience, discount)
VALUES ('Dariga','12-05-1999',22,120000,1,8000);
INSERT INTO employees(name, date_of_birth, age, salary, workexperience, discount)
VALUES ('Aruzhan','10-04-2000',21,90000,1,7000);
INSERT INTO employees(name, date_of_birth, age, salary, workexperience, discount)
VALUES ('Salima','11-05-1990',31,160000,9,15000);
INSERT INTO employees(name, date_of_birth, age, salary, workexperience, discount)
VALUES ('Arnur','01-06-1992',29,150000,5,10000);
INSERT INTO employees(name, date_of_birth, age, salary, workexperience, discount)
VALUES ('Arnur','01-06-1992',29,150000,5,10000);
--a
CREATE PROCEDURE increase_salary()
      AS $$
      BEGIN
          UPDATE employees
          SET salary = salary * 1.1
          WHERE workexperience >= 2;
          UPDATE employees
          SET discount = discount * 1.1
          WHERE workexperience >= 2;
          UPDATE employees
          SET discount = discount * 1.01
          WHERE workexperience >= 5;
      END; $$
      LANGUAGE plpgsql;
CALL increase_salary();
select * from employees;
--b
CREATE PROCEDURE increase2_salary()
      AS $$
      BEGIN
          UPDATE employees
          SET salary = salary*1.15
          WHERE  age>=40;
          UPDATE employees
          SET salary = salary*1.15
          WHERE workexperience>=8;
          UPDATE employees
          SET discount = discount*1.20
          WHERE workexperience>=8;
      END; $$
      LANGUAGE plpgsql;
CALL increase2_salary();
