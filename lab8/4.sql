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
create procedure salary_inc() AS

 $$
 Begin
     update employees set salary = salary + (salary*0.1) where workexperience / 2 > 0;
     update employees set discount = discount + (discount*0.1) where workexperience / 2 > 0;
     update employees set discount = discount + (discount*0.1) where workexperience > 5;
 end;
 $$
language plpgsql;

create procedure salary_inc2() AS
    $$
    BEGIN
        update employees set salary = salary + (salary * 0.15) where age > 40;
        update employees set salary = salary + (salary * 0.15) where workexperience > 8;
        update employees set discount = discount + (discount * 0.20) where workexperience > 8;
    end;
    $$
language plpgsql;

call salary_inc();
call salary_inc2();
