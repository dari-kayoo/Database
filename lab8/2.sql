--2--
--a
CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);
CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   changed_on TIMESTAMP(6) NOT NULL
);
-- trigger function
CREATE FUNCTION changes()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
     INSERT INTO employee_audits(changed_on)
     VALUES(now());
	RETURN NEW;
END;
$$;
-- triggers
CREATE TRIGGER insert_trigger
    AFTER INSERT
    ON employees
    FOR EACH ROW
    EXECUTE PROCEDURE changes();
CREATE TRIGGER update_trigger
  AFTER UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE changes();
CREATE TRIGGER delete_trigger
  AFTER DELETE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE changes();
SELECT * FROM employees;
SELECT * FROM employee_audits;

-- inserting
INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');
INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Bush');
SELECT * FROM employees;
SELECT * FROM employee_audits;

UPDATE employees
SET last_name = 'Brown'
WHERE ID = 2;
SELECT * FROM employees;
SELECT * FROM employee_audits;

DELETE FROM employees
WHERE ID = 3;
SELECT * FROM employees;
SELECT * FROM employee_audits;

-- drop table employees;
-- drop table employee_audits;
