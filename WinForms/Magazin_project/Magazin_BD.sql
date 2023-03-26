-- CREAREA BAZEI DE DATE A MAGAZINULUI --
CREATE DATABASE MAGAZIN
DROP DATABASE MAGAZIN

CREATE TABLE EMITENT (
	EMITENT_ID INT PRIMARY KEY IDENTITY(1,1),
	DENUMIRE VARCHAR(50),
	IDNO VARCHAR(15),
	ADRESA VARCHAR(50)
)

CREATE TABLE FACTURA_REC (
	FACTURA_REC_ID INT PRIMARY KEY IDENTITY(1,1),
	NR_FACTURA VARCHAR(20),
	DATA_FACTURA DATE,
	EMITENT_ID INT FOREIGN KEY REFERENCES EMITENT(EMITENT_ID)
)

CREATE TABLE PRODUSE (
	PRODUSE_ID INT PRIMARY KEY IDENTITY(1,1),
	DENUMIRE VARCHAR(30),
	COD_PRODUS VARCHAR(20)
)

CREATE TABLE UNIT_MASURA (
	UNIT_MASURA_ID INT PRIMARY KEY IDENTITY(1,1),
	ABREVIERE VARCHAR(5),
	NUME VARCHAR(10)
)

CREATE TABLE OPERATOR (
	OPERATOR_ID INT PRIMARY KEY IDENTITY(1,1),
	NUME VARCHAR(30),
	PRENUME VARCHAR(30),
	FUNCTIA VARCHAR(20),
	USERNAME VARCHAR(10),
	PASS VARCHAR(10),
	COD VARCHAR(13)
)

CREATE TABLE FIRMA (
	FIRMA_ID INT PRIMARY KEY IDENTITY(1,1),
	NUME VARCHAR(50),
	COD_FISCAL VARCHAR(13),
	ADRESA VARCHAR(100)
)

CREATE TABLE FIRMA_OPERATOR (
	FIRMA_OPERATOR_ID INT PRIMARY KEY IDENTITY(1,1),	
	TIP_ACCES INT,
	FIRMA_ID INT FOREIGN KEY REFERENCES FIRMA(FIRMA_ID),
	OPERATOR_ID INT FOREIGN KEY REFERENCES OPERATOR(OPERATOR_ID)
)

CREATE TABLE RECEPTIE (
	RECEPTIE_ID INT PRIMARY KEY IDENTITY(1,1),
	PRODUSE_ID INT FOREIGN KEY REFERENCES PRODUSE(PRODUSE_ID),
	FIRMA_OPERATOR_ID INT FOREIGN KEY REFERENCES FIRMA_OPERATOR(FIRMA_OPERATOR_ID),
	UNIT_MASURA_ID INT FOREIGN KEY REFERENCES UNIT_MASURA(UNIT_MASURA_ID),
	FACTURA_REC_ID INT FOREIGN KEY REFERENCES FACTURA_REC(FACTURA_REC_ID),
	STOCK1 INT,
	STOCK2 INT,
	PRET_INTRARE DECIMAL(7,2),
	PRET_VANZ DECIMAL(7,2),
	TVA INT
)

CREATE TABLE DISCOUNT (
	DISCOUNT_ID INT PRIMARY KEY IDENTITY(1,1),
	NUME VARCHAR(20),
	VALOAREA INT,
	ACTIV BIT
)

CREATE TABLE CLIENT (
	CLIENT_ID INT PRIMARY KEY IDENTITY(1,1),
	DISCOUNT_ID INT FOREIGN KEY REFERENCES DISCOUNT(DISCOUNT_ID),
	NUME VARCHAR(30),
	PRENUME VARCHAR(20),
	DATA_NAST DATE,
	DATA_REG DATE,
	COD_CLIENT VARCHAR(13)
)

CREATE TABLE CEC (
	CEC_ID INT PRIMARY KEY IDENTITY(1,1),
	CLIENT_ID INT FOREIGN KEY REFERENCES CLIENT(CLIENT_ID),
	FIRMA_OPERATOR_ID INT FOREIGN KEY REFERENCES FIRMA_OPERATOR(FIRMA_OPERATOR_ID),
	NR_CEC INT,
	DATA_CEC DATETIME,
	SUMA_CEC FLOAT
)

CREATE TABLE VANZARE (
	VANZARE_ID INT PRIMARY KEY IDENTITY(1,1),
	CEC_ID INT FOREIGN KEY REFERENCES CEC(CEC_ID),
	RECEPTIE_ID INT FOREIGN KEY REFERENCES RECEPTIE(RECEPTIE_ID),
	CANTITATEA INT,
	SUMA DECIMAL(7,2),
	SUMA_DISC DECIMAL(8,3),
	SUMA_TOTAL DECIMAL(7,2)
)


-- INSERAM VALORI -- 
INSERT INTO DISCOUNT(NUME,VALOAREA,ACTIV)
VALUES ('',0,1),
	   ('DEPUTAT',40,1),
	   ('ANIVERSAR',3,1),
	   ('INCEPATOR',1,1),
	   ('SOCIAL',2,1)


INSERT INTO CLIENT(DISCOUNT_ID,NUME,PRENUME,DATA_NAST,DATA_REG,COD_CLIENT)
VALUES (1,'','',NULL,'2020-04-23',NULL),
	   (4,'SIRGHI','IVAN','1995-02-03','2020-04-23','*1'),
	   (3,'ESANU','BORIS','1976-09-02','2020-04-23','*2'),
	   (2,'TCACI','VADIM','1969-10-09','2020-04-23','*3'),
	   (5,'PIRVU','VALENTIN','1936-01-25','2020-04-23','*4')


INSERT INTO EMITENT (DENUMIRE,IDNO,ADRESA)
VALUES ('SRL PORTUGAL+','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL MAGDA&COMPANY','21351351512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL DULCINELA','21351325512','m. CHISINAU, or. CHISINAU'),
	   ('SRL ARTIZANA','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL ROGOB','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL BASARABIANORD','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL FRANZELUTA','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('SRL JLC','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3'),
	   ('II CARMEZZ','21351325512','m. CHISINAU, or. CHISINAU, str. VASILE LUPU, nr. 3')


INSERT INTO FIRMA(NUME,COD_FISCAL,ADRESA)
VALUES ('CASUTA TA','1009600029036','or. Chisinau, str. Dimo, nr. 90'),
	   ('CASUTA VOASTRA','1009600029036','or. Chisinau, str. Uzinelor, nr.24')


INSERT INTO OPERATOR(NUME,PRENUME,FUNCTIA,USERNAME,PASS,COD)
VALUES ('POPA','ANDREI','ADMIN','POPA','PA123','#1'),
	   ('UNCU','ALEXANDRU','MANAGER','U.A','UA123','#2'),
	   ('CIOCAN','ANDREEA','OPERATOR VANZARE','CA','CA123','#3'),
	   ('CONCITA','WURST','OPERATOR RECEPTIE','CW','CW123','#4'),
	   ('MARDARI','NICOLETA','OPERATOR VANZARE','MN','MN123',NULL)


INSERT INTO FIRMA_OPERATOR(FIRMA_ID,TIP_ACCES,OPERATOR_ID)
VALUES (1,1,1),  --1) ADMIN
	   (1,2,3),  --2) VANZATOR
	   (1,3,4)   --3) CEL MAI SLAB TIP DE ACCES


INSERT INTO UNIT_MASURA(ABREVIERE,NUME)
VALUES ('KG','KILOGRAM'),
	   ('G','GRAM'),
	   ('L','LITRU'),
	   ('Buc','BUCATA'),
	   ('Cut','CUTIE'),
	   ('BACS','BACS'),
	   ('SET','SET')


INSERT INTO PRODUSE(DENUMIRE,COD_PRODUS)
VALUES ('Lapte.CMea.1L.3%', 1),
	   ('Lapte.CMea.1L.6%', 2),
	   ('Lapte.CMea.1L.9%', 3),
	   ('Lapte.Alba.0.75L.3%', 4),
	   ('Lapte.JLC.1L.6%', 5),
	   ('Bere.Vit.2,5L.3,5%', 6),
	   ('Bere.Tim.2L.3%', 7),
	   ('Paine.FR.Dacia.fel.amb', 8),
	   ('Paine.FR.Bot.amb', 9),
	   ('Paine.7S.Impl', 10),
	   ('Salam.BN.Docto', 11),
	   ('Salam.Rogob.Serv', 12),
	   ('Salam.Cmez.Mosc', 13),
	   ('Salam.Mezel.Cremw', 14),
	   ('Salam.Pegas.Ciai', 15),
	   ('Bomb.Buc.LivMold', 16),
	   ('Bomb.Nefis.CuLapte', 17),
	   ('Cioco.Korona.CuAlun', 18),
	   ('Cioco.Milka.CuStaf', 19),
	   ('Pungi.Mici.Eco', 20),
	   ('Pungi.Medii.Eco', 21)

CREATE TABLE STOCK (
	STOCK_ID INT PRIMARY KEY IDENTITY(1,1),
	PRODUSE_ID INT FOREIGN KEY REFERENCES PRODUSE(PRODUSE_ID),
	STOCK INT DEFAULT 0
)