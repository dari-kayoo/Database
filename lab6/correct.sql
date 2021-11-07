--1a
SELECT *
FROM dealer d
CROSS JOIN client c;

--1b
SELECT c.name,
       c.city,
       c.priority,
       d.name AS "dealer",
       s.id,
       s.date,
       s.amount
FROM client c
RIGHT OUTER JOIN dealer d ON d.id = c.dealer_id
RIGHT OUTER JOIN sell s ON s.client_id = c.id;

--1c
SELECT dealer.name AS "dealer",
       client.name AS "cleint",
       client.city
FROM dealer
CROSS JOIN client
WHERE dealer.location = client.city;

--1d
SELECT s.id,
       s.amount,
       c.name,
       c.city
FROM sell s
LEFT JOIN client c ON s.client_id = c.id
WHERE s.amount BETWEEN 100 AND 500;

--1e
SELECT c.name AS "client",
       c.city,
       c.priority,
       d.name AS "dealer",
       d.location
FROM client c
RIGHT OUTER JOIN dealer d ON d.id = c.dealer_id
ORDER BY d.id;

--1f
SELECT c.name AS "client",
       c.city,
       d.name AS "dealer",
       d.charge
FROM client c
INNER JOIN dealer d ON c.dealer_id = d.id;

--1g
SELECT c.name AS "client",
       c.city,
       d.name AS "dealer",
       d.charge
FROM client c
INNER JOIN dealer d ON c.dealer_id = d.id
WHERE d.charge > .12;

--1h
SELECT c.name,
       c.city,
       s.id,
       s.date,
       s.amount,
       d.name,
       d.charge
FROM client c
LEFT OUTER JOIN sell s ON c.id = s.client_id
LEFT OUTER JOIN dealer d ON d.id = s.dealer_id;

--1i
SELECT c.name AS "client",
       c.city,
       c.priority,
       d.name AS "dealer",
       s.id,
       s.date,
       s.amount
FROM client c
RIGHT OUTER JOIN dealer d ON d.id = c.dealer_id
LEFT OUTER JOIN sell s ON s.client_id = c.id
WHERE s.amount >= 2000 AND c.priority IS NOT NULL;

CREATE VIEW "sell_amount_by_date" AS
SELECT date,
       count(distinct (client_id)) AS count,
       avg(amount)                 AS avg,
       sum(amount)                 AS sum
FROM sell
GROUP BY date;
-- ans 2a
SELECT *
FROM sell_amount_by_date;

-- ans 2b
SELECT date, sum
FROM sell_amount_by_date
ORDER BY sum DESC
LIMIT 5;

CREATE VIEW "sell_amount_by_dealer" AS
SELECT d.id,
       d.name        as "dealer",
       d.location,
       d.charge,
       count(*)      AS count,
       avg(s.amount) AS avg,
       sum(s.amount) AS sum
FROM dealer d
         LEFT JOIN sell s on d.id = s.dealer_id
GROUP BY d.id, d.name;
--2c
SELECT *
FROM sell_amount_by_dealer;

CREATE VIEW "charge_income_by_location" AS
SELECT location, sum(charge * sum) AS "charge_income"
FROM sell_amount_by_dealer
GROUP BY location;
--2d
SELECT *
FROM charge_income_by_location;

CREATE VIEW "dealers_sell_amount_by_location" AS
SELECT d.location,
       count(*)      AS count,
       avg(s.amount) AS avg,
       sum(s.amount) AS sum
FROM dealer d
LEFT JOIN sell s on d.id = s.dealer_id
GROUP BY d.location;
--2e
SELECT *
FROM dealers_sell_amount_by_location;

CREATE VIEW "clients_sell_amount_by_city" AS
SELECT c.city,
       count(*)      AS count,
       avg(s.amount) AS avg,
       sum(s.amount) AS sum
FROM client c
LEFT JOIN sell s on c.id = s.client_id
GROUP BY c.city;
--2f
SELECT *
FROM clients_sell_amount_by_city;

--2g
SELECT c.city AS city, c.sum AS "expenses", coalesce(d.sum, 0) AS "sales total amount"
FROM dealers_sell_amount_by_location d
FULL OUTER JOIN clients_sell_amount_by_city c ON d.location = c.city
WHERE c.sum > d.sum
   or d.sum is NULL;
