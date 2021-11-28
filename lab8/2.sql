--2--
--a
CREATE FUNCTION timestamp_of_action() RETURNS event_trigger AS $$
BEGIN
    RAISE NOTICE 'timestamp of the occured action: % % %', tg_event, tg_tag, now();
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER timestamp_of_act
    ON ddl_command_start
    EXECUTE FUNCTION timestamp_of_action();

CREATE TABLE tree(
    tree INT
);
-- drop table tree;
-- drop event trigger timestamp_of_act;
-- drop function timestamp_of_action();

--b
CREATE TABLE person(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(40) NOT NULL,
   date_of_birth DATE,
   PRIMARY KEY(id)
);
CREATE TABLE person_age(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(40) NOT NULL,
   age INT
);
-- drop table person_age;
-- drop table person;
-- trigger function
CREATE FUNCTION compute_age()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS
$$
BEGIN
    INSERT INTO person_age(name, age)
    VALUES(new.name, date_part('year',age(new.date_of_birth::date)));
    RETURN new;
END;
$$;
-- drop function  compute_age();
-- trigger
CREATE TRIGGER insert_trigger_person
    BEFORE INSERT
    ON person
    FOR EACH ROW
    EXECUTE FUNCTION compute_age();
INSERT INTO person(name, date_of_birth) VALUES ('Kamilla', '2003-01-17');

SELECT * FROM person;
SELECT * FROM person_age;

--c
CREATE TABLE items(
    id INT GENERATED ALWAYS AS IDENTITY,
   item VARCHAR(40) NOT NULL,
   price FLOAT,
   PRIMARY KEY(id)
);
CREATE TABLE check_of_item(
    id INT GENERATED ALWAYS AS IDENTITY,
   item VARCHAR(40) NOT NULL,
   price FLOAT,
   tax FLOAT,
   total_price FLOAT,
   PRIMARY KEY(id)
);
-- drop table check_of_item;
-- drop table items;

CREATE FUNCTION compute_tax()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS
$$
BEGIN
    INSERT INTO check_of_item(item, price, tax, total_price)
    VALUES(new.item, new.price, 0.12*new.price, new.price + 0.12*new.price);
    RETURN new;
END;
$$;
-- drop function  compute_tax();
-- trigger
CREATE TRIGGER TG_tax
    BEFORE INSERT
    ON items
    FOR EACH ROW
    EXECUTE FUNCTION compute_tax();
INSERT INTO items(item, price) VALUES ('phone', 200000.0);
SELECT * FROM items;
SELECT * FROM check_of_item;
--d
CREATE TABLE products(
    id INT GENERATED ALWAYS AS IDENTITY,
   product VARCHAR(40) NOT NULL,
   price FLOAT,
   PRIMARY KEY(id)
);
drop table products;

CREATE FUNCTION prevent_delete()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM products) then
    ROLLBACK;
    END IF;
RAISE NOTICE 'You tried to delete the row of table products!';
RETURN NEW;
END;
$$;
-- drop function  prevent_delete();
-- trigger
CREATE TRIGGER prevent_deletion
BEFORE DELETE
    ON products
FOR EACH ROW
    EXECUTE FUNCTION prevent_delete();

INSERT INTO products(product, price) VALUES ('phone', 200000.0);
INSERT INTO products(product, price) VALUES ('Iphone', 500000.0);
INSERT INTO products(product, price) VALUES ('Iphone+', 700000.0);
SELECT * FROM products;

DELETE FROM products
WHERE ID = 2;

SELECT * FROM products;
-----
