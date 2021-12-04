create schema cd;
drop table members;
drop table booking;
drop table facilities;
CREATE TABLE cd.members(
    memid INT,
    surname CHARACTER VARYING(200),
    firstname CHARACTER VARYING(200),
    address CHARACTER VARYING(300),
    zipcode INT,
    telephone CHARACTER VARYING(20),
    recommendedby INT,
    joindate TIMESTAMP
);
INSERT INTO members(memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate)
 VALUES
(0, 'Luke', 'Brown', '2696 Stonepot Road', '90210', '123-123', NULL, '2008-01-31'),
(1, 'Penny', 'Davis', '983 Church Street', '78234', '718-455', NULL, '2021-08-20'),
(2, 'Karen', 'McCall','1305 Raver Croft Drive', '34589', '765-789', '1', '2021-10-04'),
(3, 'Levi', 'Miller', '4456 Vineyard Drive', '23098', '084-465', NULL,'2021-12-07'),
(4, 'Daisy', 'Stewart', '2710 Farland Street', '09823', '773-924', '2', '2021-12-08'),
(5, 'Brandon', 'Mitchell', '5017 Burnside Avenue', '34512', '435-631', '2', '2021-12-21'),
(6, 'Valerie', 'Smith', '5018 Burnside Avenue','67432', '435-690', NULL, '2021-11-29' ),
(7, 'Melanie', 'Powell', '4036 Edsel Road', '90211', '267-480', '1', '2021-12-06'),
(8, 'Sonya', 'Baker', '940 Irish Lane', '90220', '234-900', '3', '2021-09-10'),
(9, 'Richard', 'Bell', '4701 Laurel Lane', '90230', '901-902', '1', '2021-09-08'),
(10, 'Mike', 'Power', '1879 August Lane', '90100', '318-376', NULL, '2021-07-26'),
(11, 'Chester', 'Woodbury', '2821 Trouser Leg Road', '09834', '245-098', NULL, '2021-07-20'),
(12, 'Bruce', 'Johnson', '3124 Valley View Drive', '87600', '617-744', '1', '2021-08-06'),
(13, 'Karen', 'Duffy', '335 Webster Street', '09867', '345-009', '2', '2021-09-14'),
(14, 'Jonathan', 'Gay', '3427 Finwood Road', '90434', '732-514', '3', '2021-09-27'),
(15, 'Kenneth', 'Duffy', '3376 Willow Greene Drive', '90834', '334-303', NULL, '2021-10-20'),
(16, 'Heather', 'Pauli', '1533 Drummond Street', '98710', '973-226', '2', '2021-12-21'),
(17, 'Kristie', 'McCombs', '3310 Palmer Road', '00000', '972-225', '1', '2021-12-06'),
(18, 'Kenneth', 'Jhonsen', '504 Thorn Street', '09834', '307-567', NULL, '2021-12-21'),
(19, 'Scott', 'Upton', '711 Hamill Avenue', '09800', '317-565','1', '2021-08-19'),
(20, 'Karen', 'Lowa', '100 Stratford Court', '09812', '345-098', '4', '2021-10-12'),
(21, 'Constance', 'Morris', '4594 Lightning Point Drive', '02345', NULL, '3', '2021-10-20'),
(22, 'Edward', 'Cooper', '4529 Callison Lane', '45601', '445-001', '2', '2021-09-07');

CREATE TABLE cd.booking(
    facid INT,
    memid INT,
    starttime TIMESTAMP,
    slots INT
);
CREATE TABLE cd.facilities(
    facid INT,
    name CHARACTER VARYING(100),
    membercost NUMERIC,
    guestcost NUMERIC,
    initialoutlay NUMERIC,
    monthlymaintenance NUMERIC
);
WITH RECURSIVE recommenders(recommender, member) AS (
	SELECT recommendedby, memid
		FROM cd.members
	UNION ALL
	SELECT mems.recommendedby, recs.member
		FROM recommenders recs
		INNER JOIN cd.members mems
			ON mems.memid = recs.recommender
)
SELECT recs.member member, recs.recommender, mems.firstname, mems.surname
	FROM recommenders recs
	INNER JOIN cd.members mems
		ON recs.recommender = mems.memid
	WHERE recs.member = 22 OR recs.member = 12
ORDER BY recs.member asc, recs.recommender desc;
