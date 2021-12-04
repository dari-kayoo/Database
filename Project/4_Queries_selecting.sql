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
