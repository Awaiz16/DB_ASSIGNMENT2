			 
			 ---------------------TABLES----------------------

CREATE TABLE PLANE_TYPE
             (PModel Varchar(5) NOT NULL,
			  PCapacity Numeric(4),
			  PWeight Numeric(6) 
			  PRIMARY KEY(PModel));

/*drop table plane_type;
ALTER TABLE AIRPLANE
DROP CONSTRAINT FK_AIRPLANE_PLANE_TYPE;*/

CREATE TABLE AIRPLANE
             (RegNumber Numeric(5) NOT NULL,
			  HNumber Numeric(5) NOT NULL,
			  PModel Varchar(5) NOT NULL,
			  PRIMARY KEY(RegNumber));

CREATE TABLE HANGAR
             (HNumber Numeric(5) NOT NULL,
			  HCapacity Numeric(4) NOT NULL,
			  HLocation Varchar(15) NOT NULL 
			  PRIMARY KEY(HNumber));

CREATE TABLE AIRPLANE_SERVICE
             (SDate Date NOT NULL,
			  SHours Int NOT NULL,
			  RegNumber Numeric(5) NOT NULL,
			  Work_Code Numeric(3) NOT NULL,
			  Maintenance_Status Varchar (10) NOT NULL,
			  PRIMARY KEY (Work_Code,SDate));
CREATE TABLE PILOT
             (SSN Varchar(15) NOT NULL,
			  LIC_Num Numeric(15) NOT NULL,
			  Restr Varchar(20),
			  PExperience Numeric (2,1),
			  PRank Varchar (10),
			  PRIMARY KEY(LIC_Num));

CREATE TABLE EMPLOYEE
             (ESalary Numeric(7,4) NOT NULL,
			  EShift Varchar(15) NOT NULL,
			  SSN Varchar(15) NOT NULL,
			  PRIMARY KEY (SSN));
ALTER TABLE Employee
ALTER COLUMN ESalary int;

CREATE TABLE PERSON
             (SSN Varchar(15) NOT NULL,
 			  PAddress Varchar(15),
			  PName Varchar(15) NOT NULL,
			  PPhone Numeric(15),
			  PRIMARY KEY(SSN));

CREATE TABLE CORPORATION
             (CAddress Varchar(15),
			  CName Varchar(15) NOT NULL,
			  CPhone Numeric(15),
			  Has_Hanger Varchar(10) NOT NULL,
			  PRIMARY KEY (CName));

CREATE TABLE AIR_ROUTE
             (RegNumber Numeric(5) NOT NULL,
			  Departure Varchar(15),
			  Destination Varchar(15),
			  FlightTime Time(2),
			  PRIMARY KEY (RegNumber));

CREATE TABLE AIRPLANE_OWNER
			 (OwnerId Varchar(15) NOT NULL
			 PRIMARY KEY (OwnerId));

			  ---------------------RELATIONSHIP TABLES----------------------
CREATE TABLE MAINTAIN
             (Work_Code Numeric(3) NOT NULL,
			  SDate Date NOT NULL,
			  SSN Varchar(15) NOT NULL);

CREATE TABLE WORKS_ON_TYPE
			(SSN Varchar(15) NOT NULL,
			 PModel Varchar(5) NOT NULL);

CREATE TABLE FLIES
             (RegNumber Numeric(5) NOT NULL,
			  LIC_Num Numeric(15) NOT NULL);

CREATE TABLE OWNS
             (RegNumber Numeric(5) NOT NULL,
			  Seller Varchar(15) NOT NULL,
			  Buyer Varchar(15) NOT NULL,
			  PDate Varchar(15) NOT NULL,
			  OwnerId Varchar(15) NOT NULL);


			  ---------------------FOREIGN KEYS----------------------

ALTER TABLE AIRPLANE ADD CONSTRAINT FK_AIRPLANE_HANGAR FOREIGN KEY(HNumber) REFERENCES HANGAR(HNumber);
ALTER TABLE AIRPLANE ADD CONSTRAINT FK_AIRPLANE_PLANE_TYPE FOREIGN KEY(PModel) REFERENCES PLANE_TYPE(PModel);
ALTER TABLE AIRPLANE_SERVICE ADD CONSTRAINT FK_AIRPLANE_SERVICE_AIRPLANE FOREIGN KEY(RegNumber) REFERENCES AIRPLANE(RegNumber);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_PERSON FOREIGN KEY(SSN) REFERENCES PERSON(SSN);
ALTER TABLE PILOT ADD CONSTRAINT FK_PILOT_PERSON FOREIGN KEY(SSN) REFERENCES PERSON(SSN);
ALTER TABLE AIR_ROUTE ADD CONSTRAINT FK_AIR_ROUTE_AIRPLANE FOREIGN KEY(RegNumber) REFERENCES AIRPLANE(RegNumber);
ALTER TABLE OWNS ADD CONSTRAINT FK_OWNS_AIRPLANE_OWNER FOREIGN KEY(OwnerId) REFERENCES AIRPLANE_OWNER(OwnerId);
ALTER TABLE OWNS ADD CONSTRAINT FK_OWNS_AIRPLANE FOREIGN KEY(RegNumber) REFERENCES AIRPLANE(RegNumber);
ALTER TABLE FLIES ADD CONSTRAINT FK_FLIES_AIRPLANE FOREIGN KEY(RegNumber) REFERENCES AIRPLANE(RegNumber);
ALTER TABLE FLIES ADD CONSTRAINT FK_FLIES_PILOT FOREIGN KEY(LIC_Num) REFERENCES PILOT(LIC_Num);
ALTER TABLE WORKS_ON_TYPE ADD CONSTRAINT FK_WORKS_ON_TYPE_EMPLOYEE FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN);
ALTER TABLE WORKS_ON_TYPE ADD CONSTRAINT FK_WORKS_ON_TYPE_PLANE_TYPE FOREIGN KEY(PModel) REFERENCES PLANE_TYPE(PModel);
ALTER TABLE MAINTAIN ADD CONSTRAINT FK_MAINTAIN_EMPLOYEE FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN);
ALTER TABLE MAINTAIN ADD CONSTRAINT FK_MAINTAIN_AIRPLAINE_SERVICE FOREIGN KEY(Work_Code,SDate) REFERENCES AIRPLANE_SERVICE(Work_Code,SDate);

			  ---------------------DATA ENTRY----------------------

INSERT INTO PLANE_TYPE VALUES
		('AB', 123, 1000);
INSERT INTO PLANE_TYPE VALUES
		('CD', 253, 1500);
INSERT INTO PLANE_TYPE VALUES
		('EF', 193, 1000);
INSERT INTO PLANE_TYPE VALUES
		('GH', 133, 2000);
INSERT INTO PLANE_TYPE VALUES
		('IJ', 533, 1000);
INSERT INTO PLANE_TYPE VALUES
		('KL', 883, 3000);
INSERT INTO PLANE_TYPE VALUES
		('MN', 983, 1000);
INSERT INTO PLANE_TYPE VALUES
		('OP', 233, 6000);
INSERT INTO PLANE_TYPE VALUES
		('QR', 113, 1000);
INSERT INTO PLANE_TYPE VALUES
		('ST', 153, 9000);
INSERT INTO PLANE_TYPE VALUES
		('UV', 433, 1000);
INSERT INTO PLANE_TYPE VALUES
		('WX', 223, 1000);
INSERT INTO PLANE_TYPE VALUES
		('YZ', 993, 8000);
INSERT INTO PLANE_TYPE VALUES
		('ZA', 233, 1000);
INSERT INTO PLANE_TYPE VALUES
		('ZB', 533, 1000);
INSERT INTO PLANE_TYPE VALUES
		('ZC', 893, 6000);
INSERT INTO PLANE_TYPE VALUES
		('ZD', 433, 1000);
INSERT INTO PLANE_TYPE VALUES
		('ZE', 233, 1000);
INSERT INTO PLANE_TYPE VALUES
		('ZF', 119, 4000);
INSERT INTO PLANE_TYPE VALUES
		('ZJ', 333, 2000);

INSERT INTO HANGAR VALUES
			(1,10, 'New York');
INSERT INTO HANGAR VALUES
			(2,20, 'Karachi');
INSERT INTO HANGAR VALUES
			(3,10, 'Tokyo');
INSERT INTO HANGAR VALUES
			(4,6, 'Paris');
INSERT INTO HANGAR VALUES
			(5,10, 'Florida');
INSERT INTO HANGAR VALUES
			(6,13, 'Hawaii');
INSERT INTO HANGAR VALUES
			(7,10, 'Lahore');
INSERT INTO HANGAR VALUES
			(8,10, 'Bombay');
INSERT INTO HANGAR VALUES
			(9,8, 'Gilgit');
INSERT INTO HANGAR VALUES
			(10,10, 'Shanghai');
INSERT INTO HANGAR VALUES
			(11,10, 'Dubai');
INSERT INTO HANGAR VALUES
			(12,9, 'Abu Dhabi');
INSERT INTO HANGAR VALUES
			(13,5, 'Ankara');
INSERT INTO HANGAR VALUES
			(14,11, 'Istanbul');
INSERT INTO HANGAR VALUES
			(15,10, 'Toronto');
INSERT INTO HANGAR VALUES
			(16,10, 'London');
INSERT INTO HANGAR VALUES
			(17,22, 'Islamabad');
INSERT INTO HANGAR VALUES
			(18,7, 'New Jersey');
INSERT INTO HANGAR VALUES
			(19,10, 'Sydney');
INSERT INTO HANGAR VALUES
			(20,19, 'Izmir');

INSERT INTO AIRPLANE VALUES
		(101, 3, 'AB');
INSERT INTO AIRPLANE VALUES
		(102, 3, 'AB');
INSERT INTO AIRPLANE VALUES
		(103, 3, 'AB');
INSERT INTO AIRPLANE VALUES
		(104, 4, 'AB');
INSERT INTO AIRPLANE VALUES
		(105, 5, 'AB');
INSERT INTO AIRPLANE VALUES
		(106, 6, 'ZA');
INSERT INTO AIRPLANE VALUES
		(107, 1, 'ZA');
INSERT INTO AIRPLANE VALUES
		(108, 2, 'ZA');
INSERT INTO AIRPLANE VALUES
		(109, 3, 'ZA');
INSERT INTO AIRPLANE VALUES
		(201, 4, 'ZA');
INSERT INTO AIRPLANE VALUES
		(202, 4, 'CD');
INSERT INTO AIRPLANE VALUES
		(203, 1, 'CD');
INSERT INTO AIRPLANE VALUES
		(204, 2, 'CD');
INSERT INTO AIRPLANE VALUES
		(205, 3, 'CD');
INSERT INTO AIRPLANE VALUES
		(206, 5, 'CD');
INSERT INTO AIRPLANE VALUES
		(306, 11, 'YZ');
INSERT INTO AIRPLANE VALUES
		(706, 10, 'YZ');
INSERT INTO AIRPLANE VALUES
		(606, 12, 'YZ');
INSERT INTO AIRPLANE VALUES
		(506, 9, 'YZ');
INSERT INTO AIRPLANE VALUES
		(406, 3, 'YZ');

INSERT INTO AIRPLANE_SERVICE VALUES 
('10/08/23', 12, 706, 10, 'ONGOING');
INSERT INTO AIRPLANE_SERVICE VALUES 
('05/02/2023', 22, 205, 12, 'PENDING');
INSERT INTO AIRPLANE_SERVICE VALUES 
('07/07/22', 2, 406, 13, 'COMPLETED');
INSERT INTO AIRPLANE_SERVICE VALUES 
('11/06/22', 12, 201, 10, 'COMPLETED');
INSERT INTO AIRPLANE_SERVICE VALUES 
('2/08/23', 11, 204, 11, 'PENDING');

INSERT INTO PERSON VALUES
('12345', 'New York', 'Salar', 123456789);
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('11111', 'New York', 'John', '123456789');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('22222', 'Karachi', 'Ali', '234567890');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('33333', 'Tokyo', 'Yuki', '345678901');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('44444', 'Paris', 'Marie', '456789012');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('55587', 'Florida', 'Mahad', '000121291');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('66666', 'Hawaii', 'Kai', '678901234');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('77777', 'Lahore', 'Fatima', '789012345');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('88888', 'Bombay', 'Raj', '890123456');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('99999', 'Gilgit', 'Hassan', '901234567');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('101010', 'Shanghai', 'Ling', '012345678');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('111111', 'Dubai', 'Ahmed', '123456780');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('121212', 'Abu Dhabi', 'Salman', '234567891');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('131313', 'Ankara', 'Cem', '345678902');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('141414', 'Istanbul', 'Aylin', '456789013');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('151515', 'Toronto', 'Emily', '567890124');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('161616', 'London', 'Harry', '678901235');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('171717', 'Islamabad', 'Ayesha', '789012346');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('181818', 'New Jersey', 'Frank', '890123457');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('191919', 'Sydney', 'Olivia', '901234568');
INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES ('202020', 'Izmir', 'Can', '012345679');

INSERT INTO CORPORATION (CAddress, CName, CPhone, Has_Hanger) 
VALUES
	('New York', 'AppleInc', 123456789, 'YES'),
	('Karachi', 'Samsung', 987654321, 'YES'),
	('Tokyo', 'TMC', 567890123, 'YES'),
	('Paris', 'LOreal', 456789012, 'NO'),
	('Florida', 'Walt', 234567890, 'YES'),
	('Hawaii', 'HawAir', 345678901, 'YES'),
	('Lahore', 'Nestle', 789012345, 'NO'),
	('Bombay', 'Reliance', 901234567, 'YES'),
	('Gilgit', 'PIA', 789012345, 'YES'),
	('Shanghai', 'AliGroup', 345678901, 'NO'),
	('Dubai', 'Emirlines', 234567890, 'YES'),
	('Abu Dhabi', 'EAirways', 456789012, 'YES'),
	('Ankara', 'TAirlines', 123456789, 'YES'),
	('Istanbul', 'Turkcell', 789012345, 'YES'),
	('Toronto', 'BlackBerry', 901234567, 'NO'),
	('London', 'BAirways', 456789012, 'YES'),
	('Islamabad', 'PTCL', 234567890, 'YES'),
	('New Jersey', 'Johnson', 789012345, 'YES'),
	('Sydney', 'QAirways', 345678901, 'YES'),
	('Izmir', 'Vestel', 567890123, 'NO');

	INSERT INTO PERSON (SSN, PAddress, PName, PPhone)
VALUES
('11112', 'New York', 'John', 987654321),
('22221', 'Karachi', 'Sarah', 234567890),
('33331', 'Tokyo', 'Michael', 345678901),
('44441', 'Paris', 'Emily', 456789012),
('55551', 'Florida', 'David', 567890123),
('66661', 'Hawaii', 'Olivia', 678901234),
('77771', 'Lahore', 'Jacob', 789012345),
('88881', 'Bombay', 'Sophia', 890123456),
('99991', 'Gilgit', 'Matthew', 901234567),
('10100', 'Shanghai', 'Emma', 123456789),
('20200', 'Dubai', 'William', 234567890),
('30300', 'Abu Dhabi', 'Ava', 345678901),
('40400', 'Ankara', 'James', 456789012),
('50500', 'Istanbul', 'Mia', 567890123),
('60600', 'Toronto', 'Benjamin', 678901234),
('70700', 'London', 'Isabella', 789012345),
('80800', 'Islamabad', 'Daniel', 890123456),
('90900', 'New Jersey', 'Charlotte', 901234567),
('12320', 'Sydney', 'Alexander', 234567890),
('45650', 'Izmir', 'Ella', 456789012),
('11110', 'New York', 'Ryan', 567890123),
('22220', 'Karachi', 'Chloe', 678901234),
('33330', 'Tokyo', 'Andrew', 789012345),
('44440', 'Paris', 'Samantha', 890123456),
('55550', 'Florida', 'Christopher', 901234567),
('66660', 'Hawaii', 'Natalie', 234567890),
('77770', 'Lahore', 'Ethan', 345678901),
('88880', 'Bombay', 'Madison', 456789012),
('99990', 'Gilgit', 'Jacob', 567890123),
('10144', 'Shanghai', 'Avery', 678901234),
('20207', 'Dubai', 'Evelyn', 789012345),
('30307', 'Abu Dhabi', 'Luke', 890123456),
('40407', 'Ankara', 'Grace', 901234567),
('50507', 'Istanbul', 'Lucas', 234567890),
('60607', 'Toronto', 'Harper', 456789012),
('70707', 'London', 'Logan', 567890123),
('80807', 'Islamabad', 'Lily', 678901234),
('90917', 'New Jersey', 'Daniel', 789012345),
('12327', 'Sydney', 'Addison', 890123456),
('45657', 'Izmir', 'Nicholas', 901234567),
('11117', 'New York', 'Samantha', 234567890),
('22227', 'Karachi', 'Jack', 345678901);

INSERT INTO EMPLOYEE (SSN, ESalary, EShift)
VALUES
('10100', 10000, 'AM'),
('101010', 100000, 'AM'),
('10144', 200000, 'AM'),
('11110', 100000, 'AM'),
('11111', 300000, 'AM'),
('111111', 5000, 'AM'),
('11112', 400000, 'AM'),
('11117', 100000, 'AM'),
('121212', 500000, 'AM'),
('12320', 50000, 'AM'),
('12327', 83000, 'PM'),
('12345', 45000, 'PM'),
('131313', 83000, 'PM'),
('141414', 63000, 'PM'),
('151515', 13000, 'PM'),
('161616', 5000, 'PM'),
('171717', 40000, 'PM'),
('181818', 1000, 'PM'),
('191919', 90000, 'PM'),
('20200', 123000, 'PM');

INSERT INTO AIRPLANE_OWNER (OwnerId)
VALUES
('PIA'),
('AliGroup'),
('Emirlines'),
('EAirways'),
('TAirlines'),
('Turkcell'),
('BlackBerry'),
('BAirways'),
('PTCL'),
('Johnson'),
('QAirways'),
('Vestel'),
('99999'),
('99991'),
('99990'),
('90917'),
('90900'),
('88888'),
('88881'),
('88880');

INSERT INTO PILOT (SSN, LIC_Num, Restr, PExperience, PRank)
VALUES
('30307', 518, 'Israel', 5, 'Co'),
('33330', 519, 'Israel', 5, 'Co'),
('33331', 520, 'Israel', 2, 'Co'),
('33333', 521, 'Israel', 3, 'Co'),
('40400', 522, 'Israel', 5, 'Co');

INSERT INTO FLIES (RegNumber, LIC_Num)
VALUES
             (101,518),
			 (102,518),
			 (103,518),
			 (104,518),
			 (101,522),
			 (606,521),
			 (102,522),
			 (103,522),
			 (101,518),
			 (102,518),
			 (103,518),
			 (104,518),
			 (103,519),
			 (101,521),
			 (104,522),
			 (102,519),
			 (101,519),
			 (101,520),
			 (102,520),
			 (506,519);

INSERT INTO MAINTAIN VALUES
		(10, '06-08-2022', '10100');
		INSERT INTO MAINTAIN VALUES
		(10, '1-1-2023', '101010');
		INSERT INTO MAINTAIN VALUES
		(11, '2023-02-03', '20200');
		INSERT INTO MAINTAIN VALUES
		(10, '2023-09-08', '161616');
		INSERT INTO MAINTAIN VALUES
		(12, '2023-11-02', '11117');

			  ---------------------QUERIES----------------------

--QUERY 1
SELECT  RegNumber 
FROM    AIRPLANE
WHERE   RegNumber NOT IN (SELECT RegNumber FROM AIRPLANE_SERVICE);
--QUERY 2
--QUERY 3
--QUERY 4
--QUERY 5
SELECT AVG(ESalary) as AVGPM
FROM EMPLOYEE
WHERE EMPLOYEE.EShift='PM';
--QUERY 6
--QUERY 7
Select PModel, RegNumber 
from Airplane
where RegNumber in (select RegNumber from AIRPLANE_SERVICE where SDate >= getdate() - 7 and SDate <=getDate());
--QUERY 8
--QUERY 9
SELECT LIC_Num, COUNT(*) NumberOfAirplanesAllowedToFly
FROM FLIES
GROUP BY LIC_Num;
--QUERY 10
Write a SQL query to find the location and capacity of the hangar with the most
available space.
SELECT  HLocation, HCapacity
FROM    HANGAR
WHERE   HNumber =(SELECT top 1 HNumber from AIRPLANE group by HNumber order by (count(*)) desc);
--QUERY 11
--QUERY 12
--QUERY 13
--QUERY 14
--QUERY 15
Write a SQL query to find the names of pilots who are qualified to fly a plane that is
currently undergoing maintenance.

--QUERY 16
--QUERY 17
--QUERY 18
--QUERY 19
SELECT HNumber, COUNT(*) NumberOfAirplanes
FROM Airplane
GROUP BY HNumber;
--QUERY 20
SELECT PModel, COUNT(*) NumberOfAirplanes
FROM Airplane
GROUP BY PModel;
--QUERY 21
--QUERY 22
SELECT EShift, AVG(ESalary) AS 
AVG_SAL FROM EMPLOYEE GROUP BY EShift;
--QUERY 23
--QUERY 24
--QUERY 25
--QUERY 26
--QUERY 27
--QUERY 28
--QUERY 29
--QUERY 30
