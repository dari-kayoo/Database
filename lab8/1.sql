--1--
--a
CREATE FUNCTION increment(x integer) RETURNS integer AS $$ SELECT x + 1;
$$ LANGUAGE SQL;

SELECT increment(8) AS answer;
SELECT increment(17) AS answer;
-- drop function increment;

--b
CREATE FUNCTION sum_of_two(x integer, y integer) RETURNS integer AS $$ SELECT x + y;
$$ LANGUAGE SQL;

SELECT sum_of_two(5, 9) AS answer;
SELECT sum_of_two(75, 5) AS answer;
-- drop function sum_of_two;

--c
CREATE FUNCTION divisible_by_two(x integer) RETURNS bool AS $$ SELECT x%2 = 0;
$$ LANGUAGE SQL;

SELECT divisible_by_two(4) AS answer;
SELECT divisible_by_two(93) AS answer;
-- drop function divisible_by_two;

--d
CREATE FUNCTION valid_password (password VARCHAR)
RETURNS bool AS $$ SELECT password ~* '^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
$$ LANGUAGE SQL;

select valid_password('da9874123');
select valid_password('ddddddddd');
select valid_password('123456789');
-- drop function valid_password;

--e
CREATE FUNCTION returns_two(x integer, b out integer, z out integer)
AS $$ SELECT x, x;
$$ LANGUAGE SQL;

SELECT returns_two(78) AS answer;
SELECT returns_two(1) AS answer;
-- drop function returns_two;
