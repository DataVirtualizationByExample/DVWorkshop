
DROP DATABASE IF EXISTS brokerinfo;

create DATABASE brokerinfo;

\connect brokerinfo;

CREATE TABLE BrokerInformation (
  BrokerId varchar(15) NOT NULL,
  BrokerLastName varchar(25) NOT NULL,
  BrokerFirstName varchar(10) NOT NULL,
  PRIMARY KEY (BrokerId)
);

INSERT INTO BrokerInformation VALUES ('B1231','Young','Andre'),('B1232','Broadus','Calvin'),('B1233','Townshend','Pete'),('B1234','Daddy','Puff'),('B1235','Carter','Shawn'),('B1236','','Prince'),('B1237','McEnroe','John');

CREATE TABLE BrokerCustomer (
  BrokerId varchar(15) DEFAULT NULL,
  CustomerID varchar(15) DEFAULT NULL,
  CONSTRAINT FK_BrokerId_1 FOREIGN KEY (BrokerId) REFERENCES BrokerInformation (BrokerId)
);

INSERT INTO BrokerCustomer VALUES ('B1234','CST01002'),('B1235','CST01007'),('B1233','CST01003'),('B1231','CST01006'),('B1232','CST01004'),('B1237','CST01009'),('B1236','CST01010'),('B1232','CST01011'),('B1237','CST01005'),('B1236','CST01012'),('B1236','CST01013'),('B1236','CST01016');

--------------- CREATE Apaccustomers Database -------------------------
DROP DATABASE IF EXISTS apaccustomers;

CREATE DATABASE apaccustomers;

\connect apaccustomers;

--
-- Table structure for table ACCOUNT
--

CREATE TABLE ACCOUNT (
  AccountId decimal(18,0) NOT NULL,
  CustID varchar(12) NOT NULL,
  AccountType char(10) DEFAULT NULL,
  AccountStatus char(10) DEFAULT NULL,
  DATEOPENED timestamp NOT NULL,
  DATECLOSED timestamp DEFAULT NULL,
  PRIMARY KEY (AccountId)
);


--
-- Table structure for table ACCOUNTHOLDINGS
--

CREATE TABLE ACCOUNTHOLDINGS (
  TransactionID varchar(12) NOT NULL,
  AccountID decimal(18,0) NOT NULL,
  ProductID varchar(12) NOT NULL,
  PURCHASEDATE timestamp NOT NULL,
  ProductShares decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (TransactionID)
);

--
-- Table structure for table CUSTOMER
--

CREATE TABLE CUSTOMER (
  CustID varchar(12) NOT NULL,
  F_name varchar(25) NOT NULL,
  L_name varchar(25) NOT NULL,
  M_name varchar(15) DEFAULT NULL,
  StreetAddress varchar(50) NOT NULL,
  StreetAddress2 varchar(50) DEFAULT NULL,
  CITY varchar(25) NOT NULL,
  StateProvince varchar(25) DEFAULT NULL,
  POSTALCODE varchar(15) DEFAULT NULL,
  COUNTRY varchar(10) DEFAULT NULL,
  PhoneNumber varchar(30) DEFAULT NULL,
  PRIMARY KEY (CustID)
);

------- CREATE CONSTRAINTS  ----------------------------

ALTER TABLE accountholdings ADD CONSTRAINT "FK_Acctholdings_AcctID" FOREIGN KEY ("accountid")
      REFERENCES account ("accountid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE account ADD CONSTRAINT "FK_Account_CustID" FOREIGN KEY ("custid")
      REFERENCES customer ("custid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

--
-- Dumping data for table CUSTOMER
--

INSERT INTO CUSTOMER VALUES ('CST02010','Cladius','Earl','Chance','14 Central Ave',NULL,'Brisbane','Queensland','2150','AU','(61)0011-555-8181'),('CST02011','Ken','Chan',NULL,'1017 Kwai Fong',NULL,'Hong Kong',NULL,NULL,'PRC','(852)555-1870'),('CST02012','Athene','Chambers','Elswyth','1212 Berkeley Gardens','Apt 215','Milton','NSW','2100','AU','(61)0011-555-1720'),('CST02013','John','Albee','Fredrick','99 George Street',NULL,'Parramatta','NSW','2124','AU','(61)0011-555-6709'),('CST02014','Lifeng','Chen',NULL,'7/F Fortune Plaza','No. 7','Beijing','Zhonglu','100020','China','(86)10-555-5402'),('CST02015','Sanjeev','Chauhan',NULL,'54 Swami Vivekanand Rd','Apartment 2','Mumbai','Maharashtra','400 302','India','(91)22-555-9120'),('CST02016','Nanda','Chaudhari',NULL,'27 Marve Rd',NULL,'Mumbai','Maharashtra','400 120','India','(91)555-6225 '),('CST02017','Kaustubh','Chawla',NULL,'58 Marigold Ave',NULL,'Pune',NULL,'411 014','India','(91)555-2367'),('CST02018','Simon','Chen','Keat','No. 5 Hengyang Road',NULL,'Taipei City',NULL,'100','Taiwan','(886)45.23.68.89'),('CST02019','Hong','Choong',NULL,'112 Robinson Road',NULL,'Singapore',NULL,'12210','Singapore','(65)0300-076548'),('CST02020','Xizhen','Lim',NULL,'1101 Nanking Street',NULL,'Beijing','Zhonglu','100020','China','(86)10-555-5402'),('CST02021','Lawrence','Du',NULL,'1217 Queen Street',NULL,'Milton','NSW','2100','AU','(61)0011-563-4318');

--
-- Dumping data for table ACCOUNT
--

INSERT INTO ACCOUNT VALUES ('19990210','CST02010','Personal','Active','1999-10-12 00:00:00',NULL),('19990211','CST02011','Personal','Active','1999-11-03 00:00:00',NULL),('20000212','CST02012','Personal','Active','2000-01-20 00:00:00',NULL),('20000213','CST02013','Personal','Active','2000-02-01 00:00:00',NULL),('20000214','CST02014','Personal','Active','2000-03-15 00:00:00',NULL),('20000216','CST02015','Personal','Active','2000-05-15 00:00:00',NULL),('20000217','CST02016','Personal','Active','2000-07-18 00:00:00',NULL),('20000218','CST02017','Personal','Active','2000-07-19 00:00:00',NULL),('20010223','CST02018','Personal','Active','2001-02-13 00:00:00',NULL),('20010224','CST02019','Personal','Active','2001-05-18 00:00:00',NULL),('20010225','CST02020','Personal','Closed','2001-06-26 00:00:00','2002-02-22 00:00:00'),('20010226','CST02021','Personal','Active','2001-07-25 00:00:00',NULL);

--
-- Dumping data for table ACCOUNTHOLDINGS
--

INSERT INTO ACCOUNTHOLDINGS VALUES ('TXT001016','19990210','PRD01090','1999-10-12 00:00:00','85.000000'),('TXT001017','19990211','PRD01075','1999-11-03 00:00:00','110.000000'),('TXT001018','20000212','PRD01091','2000-01-20 00:00:00','150.000000'),('TXT001019','20000213','PRD01072','2000-02-01 00:00:00','165.000000'),('TXT001020','20000214','PRD01027','2000-03-15 00:00:00','225.750000'),('TXT001022','20000216','PRD01047','2000-05-15 00:00:00','123.000000'),('TXT001024','20000217','PRD01041','2000-07-18 00:00:00','183.875000'),('TXT001025','20000218','PRD01051','2000-07-19 00:00:00','222.500000'),('TXT001026','20000217','PRD01063','2000-08-15 00:00:00','95.000000'),('TXT001027','20000218','PRD01016','2000-08-30 00:00:00','45.000000'),('TXT001035','19990210','PRD01028','2001-01-26 00:00:00','50.000000'),('TXT001036','20010223','PRD01035','2001-02-13 00:00:00','112.000000'),('TXT001038','20000212','PRD01031','2001-04-26 00:00:00','135.000000'),('TXT001039','20010224','PRD01053','2001-05-18 00:00:00','105.500000'),('TXT001040','20010225','PRD01059','2001-06-26 00:00:00','140.625000'),('TXT001041','20010226','PRD01060','2001-07-25 00:00:00','126.875000'),('TXT001042','20010226','PRD01064','2001-07-25 00:00:00','80.000000'),('TXT001047','20000218','PRD01092','2001-10-12 00:00:00','45.000000'),('TXT001048','20010226','PRD01086','2001-10-16 00:00:00','250.000000'),('TXT001049','19990210','PRD01021','2001-10-17 00:00:00','140.000000'),('TXT001054','20010224','PRD01008','2001-11-16 00:00:00','80.000000'),('TXT001062','20000212','PRD01099','2002-01-29 00:00:00','175.000000'),('TXT001068','19990211','PRD01094','2002-03-07 00:00:00','102.000000');
--
-- Current Database: eucustomers
--
DROP DATABASE IF EXISTS eucustomers;

CREATE DATABASE eucustomers;

\connect eucustomers;

--
-- Table structure for table account
--

CREATE TABLE account (
  AccountId decimal(18,0) NOT NULL,
  CustomerID varchar(12) NOT NULL,
  AccountType char(10) DEFAULT NULL,
  AccountStatus char(10) DEFAULT NULL,
  DATEOPENED timestamp NOT NULL,
  DATECLOSED timestamp DEFAULT NULL,
  PRIMARY KEY (AccountId)
);

--
-- Table structure for table accountholdings
--

CREATE TABLE accountholdings (
  TransactionID varchar(12) NOT NULL,
  AccountID decimal(18,0) NOT NULL,
  ProductID varchar(12) NOT NULL,
  PURCHASEDATE timestamp NOT NULL,
  ProductShares decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (TransactionID)
);


--
-- Table structure for table customer
--

CREATE TABLE customer (
  CustomerID varchar(12) NOT NULL,
  FIRSTNAME varchar(25) NOT NULL,
  LASTNAME varchar(25) NOT NULL,
  MIDDLENAME varchar(15) DEFAULT NULL,
  StreetAddress varchar(50) NOT NULL,
  StreetAddress2 varchar(50) DEFAULT NULL,
  CITY varchar(25) NOT NULL,
  StateProvince varchar(25) DEFAULT NULL,
  POSTALCODE varchar(15) NOT NULL,
  COUNTRY varchar(10) DEFAULT NULL,
  PhoneNumber varchar(30) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
);

--------------- CREATE CONSTRAINTS -------------------------

ALTER TABLE accountholdings ADD CONSTRAINT "FK_AcctHoldings_AcctID" FOREIGN KEY ("accountid")
      REFERENCES account ("accountid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE account ADD CONSTRAINT "FK_Account_AcctID" FOREIGN KEY ("customerid")
      REFERENCES customer ("customerid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

--
-- Dumping data for table customer
--

INSERT INTO customer VALUES ('CST01010','Ian','Hardy','Thomas','120 Hanover Square',NULL,'London',NULL,'WA1 1DP','UK','(171)555-8181'),('CST01011','Elizabeth','Ashworth','Brown','1817 Chancelor Road',NULL,'London',NULL,'OX15 4NB','UK','(171)555-1870'),('CST01012','Alfred','Teagarden','Lloyd','12 Berkeley Gardens','Flat 25','Westminster',NULL,'SW7 1EZ','UK','(199)555-1720'),('CST01013','Amelia','Lindberg','Anne','95 Wadhurst Road',NULL,'Farnborough',NULL,'GU14 4LT','UK','(186)555-6709'),('CST01014','Jack','Crowther','Devon','450 Queensbridge Lane',NULL,'Scorborough',NULL,'YO2 5SC','UK','(165)555-5402'),('CST01016','Jean','LaRue','Claude','54 Rue St. Laurent','Apartment 66','Montreal','Quebec','H1J 1C3','Canada','(514)555-9120'),('CST01017','Alejandro','Carmino',NULL,'Gran Via, 1',NULL,'Madrid',NULL,'28011','Spain','(91)555-6225 '),('CST01018','Edwardo','Salvedore','Diego','Rambla de Cataluna, 58',NULL,'Barcelona',NULL,'08022','Spain','(93)555-2367 '),('CST01023','Marie','Bertrande',NULL,'78, rue de la Maison',NULL,'Paris',NULL,'75012','France','(1)45.23.68.89'),('CST01024','Herbert','MeCustomerIDer','Charles','Obere Street, 92',NULL,'Berlin',NULL,'12210','Germany','0300-076548'),('CST01025','Hanna','Rogers','Nancy','3500 Drouillard Road',NULL,'Windsor','Ontario','M5C 2V9','Canada','(416)555-9876'),('CST01026','Veronique','Treillon','Carine','705, boulevard Tigre',NULL,'Lyon',NULL,'69005','France','78.56.43.18'),('CST01028','Pierre','Henriotte','Claude','15, rue Alsace-Lorraine',NULL,'Toulouse',NULL,'31010','France','61.77.68.18'),('CST01029','Laurence','Perrier','Charles','35, rue Royale',NULL,'Marseille',NULL,'13010','France','91.24.45.67'),('CST01030','Sven','Mueller','Phillip','Magazinweg 67',NULL,'Frankfurt',NULL,'60550','Germany','069-0245885'),('CST01031','Daniel','LaBlanche',NULL,'88, place Provincial',NULL,'Paris',NULL,'75014','France','(1)47.55.65.15'),('CST01032','Paul','Zimmerman','David','2536 Oaklawn Avenue',NULL,'Vancouver','British Columbia','V3F 2K1','Canada','(604)555-2729'),('CST01033','Alexander','Franken','Horst','Berliner Platz 85',NULL,'Munich',NULL,'80806','Germany','089-0877435');

--
-- Dumping data for table account
--

INSERT INTO account VALUES ('19990010','CST01010','Personal','Active','1999-10-12 00:00:00',NULL),('19990011','CST01011','Personal','Active','1999-11-03 00:00:00',NULL),('20000012','CST01012','Personal','Active','2000-01-20 00:00:00',NULL),('20000013','CST01013','Personal','Active','2000-02-01 00:00:00',NULL),('20000014','CST01014','Personal','Active','2000-03-15 00:00:00',NULL),('20000016','CST01016','Personal','Active','2000-05-15 00:00:00',NULL),('20000017','CST01017','Personal','Active','2000-07-18 00:00:00',NULL),('20000018','CST01018','Personal','Active','2000-07-19 00:00:00',NULL),('20010023','CST01023','Personal','Active','2001-02-13 00:00:00',NULL),('20010024','CST01024','Personal','Active','2001-05-18 00:00:00',NULL),('20010025','CST01025','Personal','Closed','2001-06-26 00:00:00','2002-02-22 00:00:00'),('20010026','CST01026','Personal','Active','2001-07-25 00:00:00',NULL),('20010028','CST01028','Personal','Active','2001-09-04 00:00:00',NULL),('20010029','CST01029','Personal','Active','2001-09-18 00:00:00',NULL),('20010030','CST01030','Personal','Active','2001-10-11 00:00:00',NULL),('20010031','CST01031','Personal','Active','2001-10-25 00:00:00',NULL),('20010032','CST01032','Personal','Active','2001-11-09 00:00:00',NULL),('20010033','CST01033','Personal','Active','2001-12-06 00:00:00',NULL);

--
-- Dumping data for table accountholdings
--

INSERT INTO accountholdings VALUES ('TXT001016','19990010','PRD01090','1999-10-12 00:00:00','85.000000'),('TXT001017','19990011','PRD01075','1999-11-03 00:00:00','110.000000'),('TXT001018','20000012','PRD01091','2000-01-20 00:00:00','150.000000'),('TXT001019','20000013','PRD01072','2000-02-01 00:00:00','165.000000'),('TXT001020','20000014','PRD01027','2000-03-15 00:00:00','225.750000'),('TXT001022','20000016','PRD01047','2000-05-15 00:00:00','123.000000'),('TXT001024','20000017','PRD01041','2000-07-18 00:00:00','183.875000'),('TXT001025','20000018','PRD01051','2000-07-19 00:00:00','222.500000'),('TXT001026','20000017','PRD01063','2000-08-15 00:00:00','95.000000'),('TXT001027','20000018','PRD01016','2000-08-30 00:00:00','45.000000'),('TXT001035','19990010','PRD01028','2001-01-26 00:00:00','50.000000'),('TXT001036','20010023','PRD01035','2001-02-13 00:00:00','112.000000'),('TXT001038','20000012','PRD01031','2001-04-26 00:00:00','135.000000'),('TXT001039','20010024','PRD01053','2001-05-18 00:00:00','105.500000'),('TXT001040','20010025','PRD01059','2001-06-26 00:00:00','140.625000'),('TXT001041','20010026','PRD01060','2001-07-25 00:00:00','126.875000'),('TXT001042','20010026','PRD01064','2001-07-25 00:00:00','80.000000'),('TXT001044','20010028','PRD01078','2001-09-04 00:00:00','55.000000'),('TXT001045','20010029','PRD01095','2001-09-18 00:00:00','116.000000'),('TXT001046','20010030','PRD01083','2001-10-11 00:00:00','130.000000'),('TXT001047','20000018','PRD01092','2001-10-12 00:00:00','45.000000'),('TXT001048','20010026','PRD01086','2001-10-16 00:00:00','250.000000'),('TXT001049','19990010','PRD01021','2001-10-17 00:00:00','140.000000'),('TXT001050','20010031','PRD01043','2001-10-25 00:00:00','132.375000'),('TXT001051','20010032','PRD01045','2001-11-09 00:00:00','155.625000'),('TXT001054','20010024','PRD01008','2001-11-16 00:00:00','80.000000'),('TXT001055','20010033','PRD01020','2001-12-06 00:00:00','130.000000'),('TXT001056','20010031','PRD01010','2001-12-12 00:00:00','165.000000'),('TXT001059','20010030','PRD01009','2001-12-20 00:00:00','50.000000'),('TXT001062','20000012','PRD01099','2002-01-29 00:00:00','175.000000'),('TXT001068','19990011','PRD01094','2002-03-07 00:00:00','102.000000'),('TXT001073','20010029','PRD01077','2002-03-28 00:00:00','210.000000'),('TXT001074','20010032','PRD01080','2002-04-01 00:00:00','192.000000');


--
-- Current Database: products
--
DROP DATABASE IF EXISTS products;

CREATE DATABASE products;

\connect products;

--
-- Table structure for table productdata
--

CREATE TABLE productdata (
  ProductID varchar(10) NOT NULL,
  ProductName varchar(60) DEFAULT NULL,
  ProductType varchar(15) DEFAULT NULL,
  ISSUER varchar(10) DEFAULT NULL,
  EXCHANGE varchar(10) DEFAULT NULL,
  DJIComponent decimal(1,0) NOT NULL,
  SP500Component decimal(1,0) NOT NULL,
  NAS100Component decimal(1,0) NOT NULL,
  AMEXINTComponent decimal(1,0) NOT NULL,
  PrimaryBusiness varchar(30) DEFAULT NULL,
  PRIMARY KEY (ProductID)
);

--
-- Table structure for table productsymbols
--

CREATE TABLE productsymbols (
  ProductID varchar(10) NOT NULL,
  SymbolType decimal(10,0) DEFAULT NULL,
  SYMBOL varchar(10) NOT NULL,
  CUSIP varchar(20) DEFAULT NULL
);

------------ CREATE CONSTRAINTS ------------------

ALTER TABLE productsymbols ADD CONSTRAINT "FK_Productsymbols_ProductID" FOREIGN KEY ("productid")
      REFERENCES productdata ("productid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

--
-- Dumping data for table productsymbols
--

INSERT INTO productdata VALUES ('PRD01002','The Boeing Company','Stock','Orange','NYSE','1','1','0','0','defense'),('PRD01003','Monsanto Company','Stock','LeggMsn','NYSE','0','0','0','0',NULL),('PRD01004','Oracle Corporation','Stock','MMFinan','NasdaqNM','0','1','1','0','computer software'),('PRD01005','Sybase Incorporated','Stock','MMFinan','NYSE','0','0','0','0','computer software'),('PRD01006','Microsoft Corporation','Stock','MMFinan','NasdaqNM','1','1','1','0','computer software'),('PRD01007','International Business Machines Corporation','Stock','MMFinan','NYSE','1','1','0','0',NULL),('PRD01008','Dell Computer Corporation','Stock','MMFinan','NasdaqNM','0','1','1','0','computer hardware'),('PRD01009','Hewlett-Packard Company','Corporate Bond','LeggMsn','NYSE','0','0','0','0',NULL),('PRD01010','Hewlett-Packard Company','Stock','LeggMsn','NYSE','1','1','0','0','computer hardware'),('PRD01011','Gateway, Incorporated','Stock','LeggMsn','NYSE','0','1','0','0','computer hardware'),('PRD01012','General Electric Company','Stock','Orange','NYSE','1','1','0','0',NULL),('PRD01013','Merck and Company','Stock','Orange','NYSE','1','1','0','0','pharmaceuticals'),('PRD01014','Walt Disney Company','Stock','Orange','NYSE','1','1','0','0','entertainment'),('PRD01015','McDonalds Corporation','Stock','Orange','NYSE','1','1','0','0','food'),('PRD01016','Dow Chemical Company','Stock','Orange','NYSE','0','1','0','0','chemicals'),('PRD01017','General Motors Corporation','Corporate Bond','Orange','NYSE','0','0','0','0',NULL),('PRD01018','General Motors Corporation','Stock','Orange','NYSE','1','1','0','0','automobiles'),('PRD01019','General Motors Corporation','Stock','Orange','Toronto','0','0','0','0','automobiles'),('PRD01020','Peoplesoft Incorporated','Stock','LeggMsn','NasdaqNM','0','1','1','0','computer software'),('PRD01021','Rational Software','Stock','LeggMsn','NasdaqNM','0','1','1','0','computer software'),('PRD01022','Sun Microsystems Incorporated','Stock','LeggMsn','NasdaqNM','0','1','1','1',NULL),('PRD01023','Sun Microsystems Incorporated','Stock','LeggMsn','NasdaqNM','0','1','1','1',NULL),('PRD01024','Sinclair Broadcast Group Incorporated','Stock','LeggMsn','NasdaqNM','0','0','0','0',NULL),('PRD01025','Columbia Sportsware Company','Stock','LeggMsn','NasdaqNM','0','0','0','0',NULL),('PRD01026','Columbia Banking System Incorporated','Stock','Orange','NasdaqNM','0','0','0','0',NULL),('PRD01027','British Sky Broadcasting Group PLC','Corporate Bond','Orange','NYSE','0','0','0','0',NULL),('PRD01028','British Sky Broadcasting Group PLC','Stock','Orange','NYSE','0','0','0','0',NULL),('PRD01029','Columbia Strategic Value Fund','Mutual Fund','Orange','Nasdaq','0','0','0','0',NULL),('PRD01030','Columbia Technology Fund','Mutual Fund','Orange','Nasdaq','0','0','0','0',NULL),('PRD01031','Ford Motor Company','Stock','Orange','NYSE','0','1','0','0','automobiles'),('PRD01032','Ford Motor Credit Company','Corporate Bond','Orange','NYSE','0','0','0','0',NULL),('PRD01033','Ford Motor Credit Company','Stock','Orange','NYSE','0','0','0','0',NULL),('PRD01034','SAP AG','Stock','Orange','NYSE','0','0','0','0',NULL),('PRD01035','Saputo Incorporated','Stock','Orange','Toronto','0','0','0','0',NULL),('PRD01036','Toyota Motor Corporation','Stock','Orange','NYSE','0','0','0','0','automobiles'),('PRD01037','Toyota Motor Credit Corporation','Corporate Bond','Orange','NYSE','0','0','0','0',NULL),('PRD01038','Honda Motor Company Limited','Stock','Orange','NYSE','0','0','0','0','automobiles'),('PRD01039','Lockheed Martin Corporation','Stock','Orange','NYSE','0','1','0','0','defense'),('PRD01040','Fidelity Bancorp Incorporated of Pennsylvania','Stock','Orange','NasdaqNM','0','0','0','0','banking'),('PRD01041','Fidelity Advisor Series I Equity Growth Fund','Mutual Fund','Orange','Nasdaq','0','0','0','0',NULL),('PRD01042','Fidelity Advisor Series VII Technology Fund','Mutual Fund','Orange','Nasdaq','0','0','0','0',NULL),('PRD01043','Fidelity Advisor Series VII Healthcare Fund','Mutual Fund','Orange','Nasdaq','0','0','0','0',NULL),('PRD01044','Fidelity Advisor Series VII Financial Services Fund','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01045','Fidelity National Information Solutions Incorporated','Stock','MMFinan','NasdaqNM','0','0','0','0',NULL),('PRD01046','Eli Lilly and Company','Stock','MMFinan','NYSE','0','1','0','0','pharmaceuticals'),('PRD01047','Palm, Incorporated','Stock','MMFinan','NasdaqNM','0','1','0','1','computer hardware'),('PRD01048','H. J. Heinz Company','Stock','MMFinan','NYSE','0','1','0','0','food'),('PRD01049','Coca-Cola Company','Stock','MMFinan','NYSE','1','1','0','0','soft drinks'),('PRD01050','PepsiCo, Incorporated','Stock','MMFinan','NYSE','0','1','0','0','soft drinks'),('PRD01051','Merrill Lynch Balanced Capital Fund','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01052','Merrill Lynch Dragor Fund Incorporated','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01053','Merrill Lynch Equity Income Fund','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01054','Merrill Lynch Fundamental Growth Fund Incorporated','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01055','Merrill Lynch Global Growth Fund Incorporated','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01056','Merrill Lynch Global Technology Fund Incorporated','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01057','Morgan Stanley Convertible Securities Trust','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01058','Morgan Stanley Capital Opportunities Trust Fund','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01059','Morgan Stanley Developing Growth Securities Trust','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01060','Morgan Stanley Dean Witter Balanced Income Fund','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01061','Morgan Stanley Growth A','Mutual Fund','MMFinan','NasdaqSC','0','0','0','0',NULL),('PRD01062','Morgan Stanley Dean Witter Limited Term Municipal','Mutual Fund','MMFinan','Nasdaq','0','0','0','0',NULL),('PRD01063','Qwest Communications International Incorporated','Stock','MMFinan','NYSE','0','1','0','1','communications'),('PRD01064','American National Insurance Company','Stock','Orange','NasdaqNM','0','0','0','0','insurance'),('PRD01065','National Western Life Insurance Company','Stock','Orange','NasdaqNM','0','0','0','0','insurance'),('PRD01066','Cotton States Life Insurance Company','Stock','Orange','NasdaqNM','0','0','0','0','insurance'),('PRD01067','Kansas City Life Insurance Company','Stock','Orange','NasdaqSC','0','0','0','0','insurance'),('PRD01068','North Coast Life Insurance Company','Stock','Orange','NasdaqSC','0','0','0','0','insurance'),('PRD01069','Terra Nova Insurance Holdings PLC','Corporate Bond','Orange','NYSE','0','0','0','0',NULL),('PRD01070','21st Century Insurance Group','Stock','Orange','NYSE','0','0','0','0','insurance'),('PRD01071','White Mountains Insurance Group','Stock','Orange','NYSE','0','0','0','0','insurance'),('PRD01072','Zenith National Insurance Corporation','Stock','Orange','NYSE','0','0','0','0','insurance'),('PRD01073','Industrial-Alliance Life Insurance Company','Stock','Orange','Toronto','0','0','0','0','insurance'),('PRD01074','Southern Security Life Insurance Company','Stock','Orange','NasdaqSC','0','0','0','0','insurance'),('PRD01075','Metropolitan Financial Corporation','Stock','Orange','NasdaqNM','0','0','0','0',NULL),('PRD01076','Boston Life Sciences Incorporated','Stock','Orange','NasdaqNM','0','0','0','0','biotechnology'),('PRD01077','Integra Bank Corporation','Stock','Orange','NasdaqNM','0','0','0','0','banking'),('PRD01078','Patriot Bank Corporation','Stock','Orange','NasdaqNM','0','0','0','0','banking'),('PRD01079','Citizens Banking Corporation','Stock','MMFinan','NasdaqNM','0','0','0','0','banking'),('PRD01080','Charter Communications, Incorporated','Stock','MMFinan','NasdaqNM','0','0','1','0','cable television'),('PRD01081','Emmis Communications Corporation','Stock','MMFinan','NasdaqNM','0','0','0','0','broadcasting'),('PRD01082','Nextel Communications, Incorporated','Stock','MMFinan','NasdaqNM','0','1','1','0','communications'),('PRD01083','AOL-Time Warner, Incorporated','Stock','MMFinan','NYSE','0','1','0','1','internet service'),('PRD01084','A. G. Edwards Incorporated','Stock','MMFinan','NYSE','0','0','0','0','financial services'),('PRD01085','Yahoo Incorporated','Stock','MMFinan','NasdaqNM','0','1','1','1','internet service'),('PRD01086','Earthlink Incorporated','Stock','MMFinan','NasdaqNM','0','0','0','1','internet service'),('PRD01087','Northrop Grumman Systems Corporation','Stock','MMFinan','NYSE','0','1','0','0','defense'),('PRD01088','Novell Incorporated','Stock','MMFinan','NasdaqNM','0','1','0','1','computer software'),('PRD01089','Amazon.com, Incorporated','Stock','MMFinan','NasdaqNM','0','0','1','1','internet retailer'),('PRD01090','Juniper Networks, Incorporated','Stock','MMFinan','NasdaqNM','0','0','1','1',NULL),('PRD01091','Red Hat, Incorporated','Stock','MMFinan','NasdaqNM','0','0','0','1',NULL),('PRD01092','Boston Scientific Corporation','Stock','MMFinan','NYSE','0','1','0','0','medical supplies'),('PRD01093','Inex Pharmaceuticals, Incorporated','Stock','MMFinan','Toronto','0','0','0','0','pharmaceuticals'),('PRD01094','Triangle Pharmaceuticals, Incorporated','Stock','MMFinan','NasdaqNM','0','0','0','0','pharmaceuticals'),('PRD01095','Cytovax Biotechnologies Incorporated','Stock','MMFinan','Toronto','0','0','0','0','biotechnology'),('PRD01096','Commonwealth Biotechnologies, Incorporated','Stock','MMFinan','NasdaqSC','0','0','0','0','biotechnology'),('PRD01097','British Biotechnology plc','Stock','MMFinan','NasdaqNM','0','0','0','0','pharmaceuticals'),('PRD01098','SBC Communications Incorporated','Stock','MMFinan','NYSE','1','1','0','0','communications'),('PRD01099','Honeywell International','Stock','MMFinan','NYSE','1','1','0','0',NULL),('PRD01100','Hilton Hotels Corporation','Stock','MMFinan','NYSE','0','1','0','0','resorts'),('PRD01101','Hilton Hotels Corporation','Corporate Bond','MMFinan','NYSE','0','0','0','0',NULL),('PRD01102','Mercury Interactive Corporation','Stock','MMFinan','NasdaqNM','0','1','1','0','computer software');

INSERT INTO productsymbols VALUES ('PRD01002','1','BA','097023105'),('PRD01003','1','MON','61166W101'),('PRD01004','1','ORCL','68389X105'),('PRD01005','1','SY','871130100'),('PRD01006','1','MSFT','594918104'),('PRD01007','1','IBM','459200101'),('PRD01008','1','DELL','247025109'),('PRD01009','1','HWP0J17',NULL),('PRD01010','1','HPQ','428236103'),('PRD01011','1','GTW','367626108'),('PRD01012','1','GE','369604103'),('PRD01013','1','MRK','589331107'),('PRD01014','1','DIS','254687106'),('PRD01015','1','MCD','580135101'),('PRD01016','1','DOW','260543103'),('PRD01017','1','GMA0AI02',NULL),('PRD01018','1','GM','370442105'),('PRD01019','1','GM.TO',NULL),('PRD01020','1','PSFT','712713106'),('PRD01021','1','RATL','75409P202'),('PRD01022','1','SUNW','866810104'),('PRD01023','1','HMT','44107P104'),('PRD01024','1','SBGI','829226109'),('PRD01025','1','COLM','198516106'),('PRD01026','1','COLB','197236102'),('PRD01027','1','BSY6B09',NULL),('PRD01028','1','BSY','111013108'),('PRD01029','1','CSVFX','198526105'),('PRD01030','1','CMTFX','198545105'),('PRD01031','1','F','345370860'),('PRD01032','1','FMCR6K08',NULL),('PRD01033','1','FCZ','345397202'),('PRD01034','1','SAP','803054204'),('PRD01035','1','SAP.TO',NULL),('PRD01036','1','TM','892331307'),('PRD01037','1','TYMC5A03',NULL),('PRD01038','1','HMC','438128308'),('PRD01039','1','LMT','539830109'),('PRD01040','1','FSBI','315831107'),('PRD01041','1','EPGAX','315805853'),('PRD01042','1','FABTX','315918672'),('PRD01043','1','FACDX','315918847'),('PRD01044','1','FAFDX','315918813'),('PRD01045','1','FNIS','31620P109'),('PRD01046','1','LLY','532457108'),('PRD01047','1','PALM','696642107'),('PRD01048','1','HNZ','423074103'),('PRD01049','1','KO','191216100'),('PRD01050','1','PEP','713448108'),('PRD01051','1','MACPX','590192100'),('PRD01052','1','MADRX','59019V108'),('PRD01053','1','MADVX','589927201'),('PRD01054','1','MAFGX','589958107'),('PRD01055','1','MAGGX','59020J100'),('PRD01056','1','MAGTX','589983105'),('PRD01057','1','CNSAX','616960100'),('PRD01058','1','CPOAX','61747T106'),('PRD01059','1','DGRAX','616937108'),('PRD01060','1','BINBX','616959201'),('PRD01061','1','GRTAX','616922100'),('PRD01062','1','DWLTX','616974101'),('PRD01063','1','Q','749121109'),('PRD01064','1','ANAT','028591105'),('PRD01065','1','NWLIA','638522102'),('PRD01066','1','CSLI','221774102'),('PRD01067','1','KCLI','484836101'),('PRD01068','1','NCLIP','658654207'),('PRD01069','1','TNA7E08',NULL),('PRD01070','1','TW','90130N103'),('PRD01071','1','WTM','G9618E107'),('PRD01072','1','ZNT','989390109'),('PRD01073','1','IAG.TO',NULL),('PRD01074','1','SSLI','843805102'),('PRD01075','1','METF','59189N108'),('PRD01076','1','BLSI','100843408'),('PRD01077','1','IBNK','45814P105'),('PRD01078','1','PBIX','70335P103'),('PRD01079','1','CBCF','174420109'),('PRD01080','1','CHTR','16117M107'),('PRD01081','1','EMMS','291525103'),('PRD01082','1','NXTL','65332V103'),('PRD01083','1','AOL','00184A105'),('PRD01084','1','AGE','281760108'),('PRD01085','1','YHOO','984332106'),('PRD01086','1','ELNK','270321102'),('PRD01087','1','NOC','666807102'),('PRD01088','1','NOVL','670006105'),('PRD01089','1','AMZN','023135106'),('PRD01090','1','JNPR','48203R104'),('PRD01091','1','RHAT','756577102'),('PRD01092','1','BSX','101137107'),('PRD01093','1','IEX.TO',NULL),('PRD01094','1','VIRS','89589H104'),('PRD01095','1','CXB.TO',NULL),('PRD01096','1','CBTE','202739108'),('PRD01097','1','BBIOD','110515202'),('PRD01098','1','SBC','78387G103'),('PRD01099','1','HON','438516106'),('PRD01100','1','HLT','432848109'),('PRD01101','1','HLT5E06',NULL),('PRD01102','1','MERQ','589405109');
--
-- Current Database: uscustomers
--
DROP DATABASE IF EXISTS uscustomers;

CREATE DATABASE uscustomers;

\connect uscustomers;

--
-- Table structure for table account
--

CREATE TABLE account (
  AccountID decimal(18,0) NOT NULL,
  SSN varchar(12) NOT NULL,
  AccountType char(10) DEFAULT NULL,
  AccountStatus char(10) DEFAULT NULL,
  DATEOPENED timestamp NOT NULL,
  DATECLOSED timestamp DEFAULT NULL,
  PRIMARY KEY (AccountID)
);

--
-- Table structure for table accountholdings
--

CREATE TABLE accountholdings (
  TransactionID varchar(12) NOT NULL,
  AccountID decimal(18,0) NOT NULL,
  ProductID varchar(12) NOT NULL,
  PURCHASEDATE timestamp NOT NULL,
  ProductShares decimal(20,6) NOT NULL,
  PRIMARY KEY (TransactionID)
);


--
-- Table structure for table customer
--

CREATE TABLE customer (
  SSN varchar(12) NOT NULL,
  FIRSTNAME varchar(25) NOT NULL,
  LASTNAME varchar(25) NOT NULL,
  MIDDLEInitial varchar(15) DEFAULT NULL,
  StreetAddress1 varchar(50) NOT NULL,
  AptNumber varchar(50) DEFAULT NULL,
  CITY varchar(25) NOT NULL,
  State varchar(25) DEFAULT NULL,
  ZipCode varchar(15) NOT NULL,
  Phone varchar(30) DEFAULT NULL,
  PRIMARY KEY (SSN)
);

------- CREATE CONSTRAINTS  ----------------------------

ALTER TABLE accountholdings ADD CONSTRAINT "FK_Acctholdings_AcctID" FOREIGN KEY ("accountid")
      REFERENCES account ("accountid") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE account ADD CONSTRAINT "FK_Account_SSN" FOREIGN KEY ("ssn")
      REFERENCES customer ("ssn") MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Dumping data for table customer
--

INSERT INTO customer VALUES ('CST01002','Joseph','Smith',NULL,'1234 Main Street','Apartment 56','New York','New York','10174','(646)555-1776'),('CST01003','Nicholas','Ferguson','Robert','202 Palomino Drive',NULL,'Pittsburgh','Pennsylvania','15071','(412)555-4327'),('CST01004','Jane','Aire',NULL,'15 State Street',NULL,'Philadelphia','Pennsylvania','19154','(814)555-6789'),('CST01005','Charles','Jones','Howard','1819 Maple Street','Apartment 17F','Stratford','Connecticut','06614','(203)555-3947'),('CST01006','Virginia','Jefferson','Louise','1710 South 51st Street','Apartment 3245','New York','New York','10175','(718)555-2693'),('CST01007','Ralph','Bacon','Herbert','57 Barn Swallow Avenue',NULL,'Charlotte','North Carolina','28205','(704)555-4576'),('CST01008','Bonnie','Dragon','Anne','88 Cinderella Lane',NULL,'Jacksonville','Florida','32225','(904)555-6514'),('CST01009','Herbert','Smith','Lomas','12225 Waterfall Way','Building 100, Suite 9','Portland','Oregon','97220','(971)555-7803'),('CST01015','Jack','Corby','Thomas','1 Lone Star Way',NULL,'Dallas','Texas','75231','(469)555-8023'),('CST01019','Robin','Evers','Lynn','1814 Falcon Avenue',NULL,'Atlanta','Georgia','30355','(470)555-4390'),('CST01020','Lloyd','Abercrombie','Henry','1954 Hughes Parkway',NULL,'Los Angeles','California','90099','(213)555-2312'),('CST01021','Scott','Watters','George','24 Mariner Way',NULL,'Seattle','Washington','98124','(206)555-6790'),('CST01022','Sandra','King','Rose','96 Lakefront Parkway',NULL,'Minneapolis','Minnesota','55426','(651)555-9017'),('CST01027','Maryanne','Peters',NULL,'35 Grand View Circle','Apartment 5F','Cincinnati','Ohio','45232','(513)555-9067'),('CST01034','Corey','Snyder','James','1760 Boston Commons Avenue','Suite 543','Boston','Massachusetts','02136 ','(617)555-3546'),('CST01035','Henry','Thomas','Karl','345 Hilltop Parkway',NULL,'San Francisco','California','94129','(415)555-2093'),('CST01036','James','Drew','Carey','876 Lakefront Lane',NULL,'Cleveland','Ohio','44107','(216)555-6523');

--
-- Dumping data for table account
--

INSERT INTO account VALUES ('19980002','CST01002','Personal','Active','1998-02-01 00:00:00',NULL),('19980003','CST01003','Personal','Active','1998-03-06 00:00:00',NULL),('19980004','CST01004','Personal','Active','1998-03-07 00:00:00',NULL),('19980005','CST01005','Personal','Active','1998-06-15 00:00:00',NULL),('19980006','CST01006','Personal','Active','1998-09-15 00:00:00',NULL),('19990007','CST01007','Personal','Active','1999-01-20 00:00:00',NULL),('19990008','CST01008','Personal','Active','1999-04-16 00:00:00',NULL),('19990009','CST01009','Business','Active','1999-06-25 00:00:00',NULL),('20000015','CST01015','Personal','Closed','2000-04-20 00:00:00','2001-06-22 00:00:00'),('20000019','CST01019','Personal','Active','2000-10-08 00:00:00',NULL),('20000020','CST01020','Personal','Active','2000-10-20 00:00:00',NULL),('20000021','CST01021','Personal','Active','2000-12-05 00:00:00',NULL),('20010022','CST01022','Personal','Active','2001-01-05 00:00:00',NULL),('20010027','CST01027','Personal','Active','2001-08-22 00:00:00',NULL),('20020034','CST01034','Business','Active','2002-01-22 00:00:00',NULL),('20020035','CST01035','Personal','Active','2002-02-12 00:00:00',NULL),('20020036','CST01036','Personal','Active','2002-03-22 00:00:00',NULL);

--
-- Dumping data for table accountholdings
--

INSERT INTO accountholdings VALUES ('TXT001002','19980002','PRD01008','1998-02-01 00:00:00','50.000000'),('TXT001003','19980002','PRD01042','1998-02-01 00:00:00','25.250000'),('TXT001004','19980003','PRD01002','1998-03-06 00:00:00','100.000000'),('TXT001005','19980003','PRD01029','1998-03-06 00:00:00','25.000000'),('TXT001006','19980003','PRD01055','1998-03-06 00:00:00','50.500000'),('TXT001007','19980004','PRD01062','1998-03-07 00:00:00','30.125000'),('TXT001008','19980005','PRD01050','1998-06-15 00:00:00','18.000000'),('TXT001009','19980006','PRD01046','1998-09-15 00:00:00','200.000000'),('TXT001010','19990007','PRD01067','1999-01-20 00:00:00','65.000000'),('TXT001011','19990008','PRD01052','1999-04-16 00:00:00','102.125000'),('TXT001012','19990007','PRD01068','1999-05-11 00:00:00','85.000000'),('TXT001013','19990008','PRD01076','1999-05-21 00:00:00','105.000000'),('TXT001014','19990009','PRD01060','1999-06-25 00:00:00','120.375000'),('TXT001015','19980003','PRD01048','1999-07-22 00:00:00','150.000000'),('TXT001021','20000015','PRD01032','2000-04-20 00:00:00','135.000000'),('TXT001023','19980006','PRD01030','2000-06-12 00:00:00','90.625000'),('TXT001028','20000019','PRD01042','2000-10-08 00:00:00','350.750000'),('TXT001029','20000020','PRD01030','2000-10-20 00:00:00','126.875000'),('TXT001030','20000020','PRD01018','2000-11-14 00:00:00','100.000000'),('TXT001031','20000019','PRD01031','2000-11-15 00:00:00','125.000000'),('TXT001032','20000021','PRD01037','2000-12-05 00:00:00','400.000000'),('TXT001033','20010022','PRD01058','2001-01-05 00:00:00','236.625000'),('TXT001034','19990008','PRD01015','2001-01-23 00:00:00','180.000000'),('TXT001037','19980005','PRD01038','2001-03-23 00:00:00','125.000000'),('TXT001043','20010027','PRD01076','2001-08-22 00:00:00','70.000000'),('TXT001052','20000020','PRD01006','2001-11-14 00:00:00','125.000000'),('TXT001053','19980003','PRD01049','2001-11-15 00:00:00','100.000000'),('TXT001057','20000021','PRD01011','2001-12-18 00:00:00','44.000000'),('TXT001058','20010027','PRD01021','2001-12-19 00:00:00','115.000000'),('TXT001060','20020034','PRD01055','2002-01-22 00:00:00','188.875000'),('TXT001061','19990009','PRD01102','2002-01-24 00:00:00','30.000000'),('TXT001063','20020035','PRD01058','2002-02-12 00:00:00','110.125000'),('TXT001064','20020035','PRD01083','2002-02-13 00:00:00','70.000000'),('TXT001065','20020034','PRD01088','2002-02-22 00:00:00','25.000000'),('TXT001066','20000019','PRD01089','2002-02-26 00:00:00','195.000000'),('TXT001067','19980004','PRD01090','2002-03-05 00:00:00','250.000000'),('TXT001069','20000021','PRD01014','2002-03-12 00:00:00','300.000000'),('TXT001070','20010027','PRD01024','2002-03-14 00:00:00','136.000000'),('TXT001071','20020036','PRD01012','2002-03-22 00:00:00','54.000000'),('TXT001072','20020036','PRD01037','2002-03-26 00:00:00','188.875000'),('TXT001075','19980005','PRD01068','2002-04-01 00:00:00','26.000000');




