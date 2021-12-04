SELECT COUNT(sales.VIN) AS Sales, date_part('year', (sales.date::date)) as year,
       date_part('month', (sales.date::date)) as month, date_part('week', (sales.date::date)) as week
FROM sales
   INNER JOIN dealers d on sales.dealer_id = d.id
   INNER JOIN person p on p.id = sales.customer_id
   INNER JOIN vehicles v on p.id = v.customer_id
   INNER JOIN options o on v.option_id = o.id
   INNER JOIN models m on o.model_id = m.id
WHERE(date_part('year', (sales.date::date)))<=3
GROUP BY p.gender, p.income, sales.date, m.brand_name;
----
SELECT vehicles.VIN, person.full_name
FROM person, vehicles, manufacturer,suppliers,part
WHERE vehicles.customer_id = person.id AND manufacturer.VIN=vehicles.VIN AND suppliers.name = 'Getrag'
AND part.made_date BETWEEN '2014-02-06' AND '2014-03-05';
----
SELECT brand_name, SUM(s.price) as sum
FROM models, sales s
INNER JOIN vehicles v
ON s.VIN = v.VIN
WHERE date_part('year', (s.date::date)) = 2020
INNER JOIN  options on options.id = v.option_id
INNER JOIN models
ON options.model_id = models.id
INNER JOIN brands
ON models.brand_name = brands.name
Group By brand_name
Order By sum DESC
LIMIT 2;
-----
SELECT brand_name, COUNT(m.brand_name)
FROM sales s
INNER JOIN vehicles
ON s.VIN = vehicles.vin
WHERE date_part('year', (s.date::date)) = 2020
INNER JOIN options o
ON v.option_id = v.option_id
INNER JOIN models m
ON o.model_id = m.id
INNER JOIN brands b
ON m.brand_name = b.name
Group By m.brand_name
Order By COUNT(m.brand_name) DESC
LIMIT 2;
-----
SELECT date_part('month', (s.date::date)) = 2020, COUNT(m.brand_name)
FROM sales s
INNER JOIN vehicles v
ON s.VIN = v.VIN
INNER JOIN options o
ON o.id = v.option_id
INNER JOIN models m
ON o.model_id = m.id
INNER JOIN brands b
ON m.brand_name = b.name
WHERE b.name = 'convertibles' and date_part('year', (s.date::date)) = 2020
Group By m.brand_name
Order By COUNT(m.brand_name) DESC
LIMIT 1;
------
SELECT dealers.name, MAX(date_part('day', (sales.date::date)))
FROM dealers
INNER JOIN sales
ON sales.id = dealers.id
INNER JOIN inventory
ON dealers.id = inventory.id
INNER JOIN vehicles
ON sales.VIN = vehicles.VIN
Group By dealers.name;

