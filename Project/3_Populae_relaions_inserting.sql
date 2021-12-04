insert into automobile_company(name, amount_employees)
values ('General Motors', 12000), ('Ford', 13000),
       ('Toyota', 14000), ('Volkswagen', 11000);
insert into brands(name, amount_employees, company_id)
values ('Buick', 1000, 1), ('Cadillac', 1100, 1), ('Chevrolet', 2000, 1),
       ('GMC', 1200, 1), ('Wuling', 2000, 1), ('Lincoln', 1023, 2),
       ('Troller', 2100, 2), ('Daihatsu', 1200, 3), ('Ranz', 3500, 3),
       ('Lexus', 2103, 3), ('Hino', 1000, 3), ('SKODA', 1240, 4),
       ('Audi', 1405, 4),('Bentley', 1500, 4);
insert into models(name, year, body_style, brand_name)
values ('Regal', '2017-01-15', '4-door', 'Buick'),('Velite', '2019-02-14', '4-door', 'Buick'),
       ('ATS', '2019-03-04','wagon', 'Cadillac'), ('Avalanche', '2018-03-04', '4-door', 'Chevrolet'),
       ('Canyon', '2019-05-07', 'sedan', 'GMC'), ('Almaz', '2016-04-06', 'hatchback', 'Wuling'),
       ('Nautilus', '2009-02-07', 'microvan', 'Lincoln'), ('Pantanal', '2006-12-11', 'minivan', 'Troller'),
       ('Copen', '2002-02-03', 'roadster', 'Daihatsu'), ('EV Concept', '2014-11-13', 'sedan', 'Ranz'),
       ('GX', '2020-12-11', 'wagon', 'Lexus'), ('Jumbo Ranger', '2017-03-18', 'sedan', 'Hino'),
       ('Fabia','2020-06-15', 'roadster', 'SKODA'), ('e-tron', '2003-03-07', 'ute', 'Audi'),
       ('Continental', '2018-07-30', 'panel truck', 'Bentley');
insert into options(engine, transmission, color, model_id)
values ('gasoline', 'CVT', 'black', 1), ('diesel', 'AMT', 'black', 1),
       ('gasoline', 'AMT', 'white', 2), ('diesel', 'CVT', 'blue', 2),
       ('diesel', 'CVT', 'grey', 3), ('gasoline', 'DCT', 'green', 4),
       ('gasoline', 'DCT', 'red', 5), ('gasoline', 'CVT', 'black', 6),
       ('gasoline', 'AMT', 'yellow', 6), ('diesel', 'CVT', 'grey', 7),
       ('diesel', 'CVT', 'white', 7), ('gasoline', 'DCT', 'red', 7),
       ('diesel', 'DCT', 'black', 8), ('gasoline', 'AMT', 'white', 9),
       ('gasoline', 'CVT', 'grey', 9), ('diesel', 'DCT', 'black', 10),
       ('diesel', 'DCT', 'white', 11), ('gasoline', 'CVT', 'grey', 12),
       ('diesel', 'DCT', 'black', 12), ('diesel', 'DCT', 'black', 13),
       ('gasoline', 'CVT', 'white', 12), ('gasoline', 'AMT', 'white', 13),
       ('diesel', 'AMT', 'grey', 9), ('gasoline', 'DCT', 'black', 14),
       ('gasoline', 'CVT', 'black', 14), ('diesel', 'AMT', 'grey', 15),
       ('diesel', 'DCT', 'black', 15), ('diesel', 'CVT', 'grey', 15);
insert into dealers(name, location)
values ('Kristen', '78 Little Huntingdon Avenue'), ('Job', '56 Tunisia Drive');
insert into inventory(location, name, dealer_id)
values ('45 Bloomsbury Close', 'Invention', 1), ('69 Hunting Lodge Way', 'Invention', 1),
       ('78 Crossing Road', 'InvErn', 2), ('178 Big City Light', 'InvErn', 2),
       ('78 Street Road Red', 'Invention', 2), ('362 Village Vip', 'InvErn', 1);
insert into customers(address, city, street, phone_number, dealer_id)
values ('8 Bloomsbury Close, Boston', 'Boston', '8 Bloomsbury Close', '87471781232', 1),
       ('23 Highway Way, Boston', 'Boston', '23 Highway Way', '87471781232', 1),
       ('20 Crossing Road, New York', 'New York', '20 Crossing Road', '87471781212', 2),
       ('1065 Huntingdon Avenue, Boston', 'Boston', '1065 Huntingdon Avenue', '87471781563', 2),
       ('6 Hunting Lodge Way, Paris', 'Paris', '6 Hunting Lodge Way', '87471781278', 2),
       ('28 Crossing Road, New York', 'New York', '28 Crossing Road', '87471781784', 2),
       ('9 Bloomsbury Close, Boston', 'Boston', '9 Bloomsbury Close', '87471781124', 1),
       ('11 Huntingdon Avenue, Los-Angeles', 'Los-Angeles', '11 Huntingdon Avenue', '87471781299', 1),
       ('9 Hunting Lodge Way, Vashington', 'Vashington', '9 Hunting Lodge Way', '87471781456', 2),
       ('4 Bloomsbury Close, Reading', 'Reading', '4 Bloomsbury Close', '87471787892', 2),
       ('79 Bloomsbury Close, Boston', 'Boston', '79 Bloomsbury Close', '87471781457', 1),
       ('1965 Huntingdon Avenue, Boston', 'Boston', '1965 Huntingdon Avenue', '87471783651', 2),
       ('45 Bloomsbury Close, Reading', 'Reading', '45 Bloomsbury Close', '87471781145', 2),
       ('65 Huntingdon Avenue, Mexico', 'Mexico', '65 Huntingdon Avenue', '87471781247', 2),
       ('36 Tunisia Drive, Boston', 'Boston', '36 Tunisia Drive', '87471781221', 1),
       ('655 Huntingdon Avenue, Boston', 'Boston', '655 Huntingdon Avenue', '87471781247', 1),
       ('789 Tunisia Drive, Chicago', 'Chicago', '789 Tunisia Drive', '87471781654', 2);
insert into vehicles(vin, option_id, inventory_id, customer_id)
values ('2C4GJ453XYR693697', 1, 2, 2), ('5C4GJ453TYP697893', 1, 2, 10 ), ('6C4GJ453POT697892', 1, 2, 14 ),
       ('7C4GJ453LKP694782', 1, 2, 3), ('2C4GJ453NJI693475', 1, 2, 10 ), ('7C4GJ453PL6937636', 1, 2, 14 ),
       ('4C4GJ453LPS693674', 1, 2, 4), ('2C4GJ453YT6936722', 1, 2, 11 ), ('2C4GJ453XMJ693124', 1, 2, 15 ),
       ('8C4GJ453XVC693611', 1, 2, 5), ('8C4GJ453XIU693645', 1, 2, 12 ), ('9C4GJ453UUI693600', 1, 2,  8),
       ('2C4GJ453CDF693324', 1, 2, 5 ), ('2C4GJ453FRT693744', 1, 2, 13 ), ('9C4GJ453TYU693450', 1, 2, 6),
       ('1F5GJ453SQP693742', 1, 3, 6 ), ('8C4GJ453LFG693475', 1, 2, 14), ('2C4GJ453HFR693964', 1, 2, 5 ),
       ('7C4GJ453XYR693583', 1, 2, 7 ), ('2C4GJ453MYR693789', 1, 2, 15 ), ('5C4GJ453NBH693875', 1, 2, 3 ),
       ('2C4GJ453BVC693697', 1, 2, 8 ), ('7C4GJ453KLo693895', 1, 2, 16 ), ('3C4GJ453OPI693462', 1, 2, 2 ),
       ('6C4GJ453XCV693697', 1, 2, 8 ), ('2C4GJ453LKR693256', 1, 2, 17 ), ('6C4GJ453XYR693964', 1, 2, 1 ),
       ('6C4GJ453JHG693697', 1, 2, 9 ), ('2C4GJ453DFR693147', 1, 2, 12 ), ('2C4GJ453XYR693745', 1, 2, 1 ),
       ('5C4GJ453ERR693451', 1, 2, 10), ('5C4GJ453DER693476', 1, 2, 13 ), ('5C4GJ453QWE693562', 1, 2, 1 );
insert into company(name, customer_id)
values ('Fork', 13), ('Avis', 14), ('Simple', 14),
       ('Simple', 15), ('Hertz', 15), ('Avis', 15), ('Hertz', 16), ('Hertz', 17);
insert into person(full_name, first_name, last_name, gender, driver_id)
values ('John Robert Genry', 'John', 'Robert', 'man', 123),
       ('Simon Win Jobs', 'Simon','Win', 'man', 124),
       ('William Winner Kai', 'William','Winner', 'man', 125),
       ('Ken Star Rob', 'Ken', 'Star', 'man', 126),
       ('Teo Star Rob', 'Teo', 'Star', 'man', 127),
       ('Iggy Banner Lane', 'Iggy', 'Banner', 'man', 897),
       ('Teo Gene Conan', 'Teo', 'Gene', 'man', 899),
       ('Jenny Taylor Swift', 'Jenny', 'Taylor', 'woman', 901),
       ('Mia James Winner', 'Mia', 'James', 'woman', 902);
insert into sales
values ('2C4GJ453XYR693697', 1, 1, '2013-10-18', 2056000.00),
       ('5C4GJ453TYP697893', 2, 1, '2014-05-19', 5056000.00),
       ('6C4GJ453POT697892', 3, 2, '2015-08-21', 3056000.00),
       ('7C4GJ453LKP694782', 4, 1, '2016-09-21', 7056000.00),
       ('2C4GJ453NJI693475', 4, 2, '2017-01-01', 4156000.00),
       ('7C4GJ453PL6937636', 5, 1, '2017-06-07', 6956000.00),
       ('4C4GJ453LPS693674', 6, 1, '2019-07-06', 5256000.00),
       ('2C4GJ453YT6936722', 7, 2, '2014-05-15', 7456000.00),
       ('8C4GJ453XVC693611', 8, 1, '2017-10-19', 2156000.00),
       ('8C4GJ453XIU693645', 9, 2, '2017-11-17', 2056000.00),
       ('9C4GJ453UUI693600', 9, 1, '2016-12-13', 756000.00),
       ('2C4GJ453CDF693324', 16, 1, '2018-06-14', 20056000.00),
       ('1F5GJ453SQP693742', 10, 2, '2020-07-14', 9656000.00),
       ('8C4GJ453LFG693475', 15, 1, '2003-10-15', 87456000.00),
       ('5C4GJ453ERR693451', 11, 1, '2006-10-16', 75556000.00),
       ('5C4GJ453QWE693562', 14, 2, '2002-11-17', 5456000.00),
       ('2C4GJ453LKR693256', 12, 2, '2009-12-19', 6956000.00),
       ('6C4GJ453XYR693964', 13, 2, '2007-11-20', 3456000.00);
insert into suppliers(name, location)
values ('Getrag', '613 Liebler Rd Boston'), ('All in One Supply Warehouse', '1438 Trevett Rd Boston'),
       ('Finest Farm Supply Warehouse', '203rd St Saint Albans, New York');
insert into manufacturer(name, location, brand_name, vin)
values ('Manufac', 'Red Blue 45', 'Cadillac', '2C4GJ453XYR693697' ), ('ManufacturMan', '789 Road Cast Yellow', 'Chevrolet','1F5GJ453SQP693742' ),
       ('ManufacruraTen','Silk Way Light 56', null ,'5C4GJ453TYP697893');
--        ('Getrag', '788 Silk Way', null, '2C4GJ453XYR693697');
insert into produces(date)
values ('2012-10-01 00:00:00'), ('2017-06-01 00:00:00'), ('2018-07-01 00:00:00'),
       ('2019-02-01 00:00:00'), ('2019-03-01 00:00:00'), ('2005-05-01 00:00:00'),
       ('2006-09-01 00:00:00'), ('2020-11-01 00:00:00'), ('2017-10-01 00:00:00'),
       ('2012-12-01 00:00:00'), ('2018-08-01 00:00:00'), ('2019-07-01 00:00:00');
insert into part(type, made_date, supply_date)
values ('Bumper', '2014-02-06', '2014-03-05'), ('Cowl screen', '2014-02-06', '2014-03-05'),
       ('Decklid', '2014-03-16', '2014-03-30'), ('Fender', '2014-06-12', '2014-06-30'),
       ('Grille', '2014-08-15', '2014-08-28'), ('Engine', '2014-08-10', '2014-08-24'),
       ('Fuel system', '2014-10-30', '2014-11-09'), ('Transmission', '2014-11-16', '2014-11-30'),
       ('Chassis', '2014-02-06', '2014-03-01'), ('Electrical system', '2014-08-17', '2014-08-29'),
       ('Lubrication system', '2014-09-26', '2014-10-05'), ('Oil Pan', '2014-02-07', '2014-03-07');
