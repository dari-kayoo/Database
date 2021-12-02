create schema cd;
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
INSERT INTO cd.members
VALUES (1, 'Smith', 'Darren', '8 Bloomsbury Close, Boston', 4321, '555-555-5555', 1, '2012-07-01 00:00:00'),
       (2, 'Smith', 'Tracy', '8 Bloomsbury Close, New York', 4321, '555-555-5555', 1, '2012-07-02 12:08:23'),
       (3, 'Rownam', 'Tim', '23 Highway Way, Boston', 5502, '8775178414', 55, '27-12-1995'),
       (4, 'Joplette', 'Janice', '20 Crossing Road, New York', 5403, '87751784962', 85, '17-08-1999'),
       (5, 'Butters', 'Gerald', '1065 Huntingdon Avenue, Boston', 6023, '87751784145', 68, '07-11-1991'),
       (6, 'Tracy', 'Burton', '3 Tunisia Drive, Boston', 5823, '87751784234', 92, '27-04-1993'),
       (7, 'Dare', 'Nancy', '6 Hunting Lodge Way, Boston', 5823, '87751784234', 92, '27-04-1993'),
       (8, 'Boothe', 'Tim', '3 Bloomsbury Close, Reading, 00234', 5823, '87751784234', 92, '27-04-1993'),
       (9, 'Stibbons', 'Ponder', '3 Tunisia Drive, Boston', 5823, '87751784234', 92, '27-04-1993'),
       (10, 'Owen', 'Charles', '3 Tunisia Drive, Boston', 5823, '87751784234', 92, '27-04-1993'),
       (11, 'Jones', 'David', '3 Tunisia Drive, Boston', 5823, '87751784234', 92, '27-04-1993'),
       (12, 'Baker', 'Anne', '3 Tunisia Drive, Boston', 5823, '87751784234', 92, '27-04-1993');

CREATE TABLE cd.booking(
    facid INT,
    memid INT,
    starttime TIMESTAMP,
    slots INT
);
INSERT INTO cd.booking
VALUES (0, 12, '2012-10-01 00:00:00',1320),
       (1, 12, '2012-10-02 00:00:00', 1278),
       (2, 12, '2012-10-03 00:00:00', 1209),
       (3, 4, '2012-10-04 00:00:00', 830),
       (4, 5, '2012-10-05 00:00:00', 1404),
       (5, 6, '2012-10-06 00:00:00', 228),
       (6, 12, '2012-10-07 00:00:00',1104),
       (7, 1, '2012-10-08 00:00:00',908),
       (8, 2, '2012-10-09 00:00:00',911);

CREATE TABLE cd.facilities(
    facid INT,
    name CHARACTER VARYING(100),
    membercost NUMERIC,
    guestcost NUMERIC,
    initialoutlay NUMERIC,
    monthlymaintenance NUMERIC
);
INSERT INTO cd.facilities
VALUES (0, 'Tennis Court 1', 5, 25, 10000, 200),
       (1, 'Tennis Court 2', 5, 25, 8000, 200),
       (2, 'Badminton Court', 0, 15.5, 4000, 50),
       (3, 'Table Tennis', 0, 5, 320, 10),
       (4, 'Massage Room 1', 35, 80, 4000, 3000),
       (5, 'Massage Room 2', 35, 80, 4000, 3000),
       (6, 'Squash Court', 3.5, 17.5, 5000, 80),
       (7, 'Snooker Table', 0, 5, 450, 15),
       (8, 'Pool Table',  0, 5, 400, 15);


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
