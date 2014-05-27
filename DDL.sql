CREATE TABLE Amet ( 
	amet_kood SMALLINT NOT NULL,
	nimetus VARCHAR(20) NOT NULL,
	kirjeldus VARCHAR(255) NOT NULL
)
;

CREATE TABLE Ariklient ( 
	osapool_id INTEGER NOT NULL
)
;

CREATE TABLE Eraklient ( 
	osapool_id INTEGER NOT NULL
)
;

CREATE TABLE Isik ( 
	osapool_id INTEGER NOT NULL,
	eesnimi VARCHAR(50) NOT NULL,
	perenimi VARCHAR(50) NOT NULL,
	isikukood CHAR(11) NOT NULL
)
;

CREATE TABLE Kampaania ( 
	kampaania_id INTEGER NOT NULL,
	kampaania_number VARCHAR(10) NOT NULL,
	nimetus VARCHAR(50) NOT NULL,
	toode_id INTEGER NOT NULL,
	alguse_kuupaev DATE NOT NULL,
	lopu_kuupaev DATE NOT NULL,
	eelarve_summa DECIMAL(8,2) NOT NULL,
	markused MEMO NOT NULL,
	tootaja_osapool_id INTEGER NOT NULL,
	kampaania_seisund_kood SMALLINT NOT NULL
)
;

CREATE TABLE Kampaania_seisund ( 
	kampaania_seisund_kood SMALLINT NOT NULL,
	nimetus VARCHAR(20) NOT NULL,
	kirjeldus VARCHAR(255) NOT NULL
)
;

CREATE TABLE Klient ( 
	osapool_id INTEGER NOT NULL
)
;

CREATE TABLE Meedialiik ( 
	meedialiik_kood SMALLINT NOT NULL,
	nimetus VARCHAR(20) NOT NULL,
	kirjeldus VARCHAR(255) NOT NULL
)
;

CREATE TABLE Meediaplaan ( 
	meediaplaani_number VARCHAR(10) NOT NULL,
	markused MEMO,
	kampaania_id INTEGER NOT NULL,
	meedialiik_kood SMALLINT NOT NULL,
	meediaplaani_seisund_kood SMALLINT NOT NULL
)
;

CREATE TABLE Meediaplaani_seisund ( 
	meediaplaani_seisund_kood SMALLINT NOT NULL,
	nimetus VARCHAR(20) NOT NULL,
	kirjeldus VARCHAR(255) NOT NULL
)
;

CREATE TABLE Organisatsioon ( 
	osapool_id INTEGER NOT NULL,
	nimi VARCHAR(50) NOT NULL,
	ariregistri_kood CHAR(10) NOT NULL
)
;

CREATE TABLE Osapool ( 
	osapool_id INTEGER NOT NULL,
	e_post VARCHAR(100) NOT NULL
)
;

CREATE TABLE Sihtryhm ( 
	sihtryhm_kood SMALLINT NOT NULL,
	nimetus VARCHAR(20) NOT NULL,
	kirjeldus VARCHAR(255) NOT NULL
)
;

CREATE TABLE Toode ( 
	toode_id INTEGER NOT NULL,
	nimetus VARCHAR(30) NOT NULL,
	sihtryhm_kood SMALLINT NOT NULL,
	tootemark_id INTEGER NOT NULL
)
;

CREATE TABLE Tootaja ( 
	osapool_id INTEGER NOT NULL,
	amet_kood SMALLINT NOT NULL,
	kasutajanimi VARCHAR(20) NOT NULL,
	parool CHAR(32) NOT NULL,
	konto_vabastamise_aeg TIMESTAMP
)
;

CREATE TABLE Tootemark ( 
	tootemark_id INTEGER NOT NULL,
	nimi VARCHAR(30) NOT NULL,
	logo VARCHAR(255),
	tunnuslause VARCHAR(150),
	klient_osapool_id INTEGER NOT NULL
)
;


ALTER TABLE Amet
	ADD CONSTRAINT AK_Amet_nimetus UNIQUE (nimetus)
;
ALTER TABLE Isik
	ADD CONSTRAINT AK_Isik_isikukood UNIQUE (isikukood)
;
ALTER TABLE Kampaania_seisund
	ADD CONSTRAINT AK_Kampaania_seisund_nimetus UNIQUE (nimetus)
;
ALTER TABLE Meedialiik
	ADD CONSTRAINT AK_Meedialiik_nimetus UNIQUE (nimetus)
;
ALTER TABLE Meediaplaan
	ADD CONSTRAINT AK_Meediaplaan_number UNIQUE (meediaplaani_number)
;
ALTER TABLE Meediaplaani_seisund
	ADD CONSTRAINT AK_Meediaplaani_seisund_nimetus UNIQUE (nimetus)
;
ALTER TABLE Organisatsioon
	ADD CONSTRAINT AK_Organisatsioon_ariregistri_kood UNIQUE (ariregistri_kood)
;
ALTER TABLE Organisatsioon
	ADD CONSTRAINT AK_Organisatsioon_nimi UNIQUE (nimi)
;
ALTER TABLE Sihtryhm
	ADD CONSTRAINT AK_Sihtryhm_nimetus UNIQUE (nimetus)
;
ALTER TABLE Toode
	ADD CONSTRAINT AK_Toode_tootemargi_nimetus UNIQUE (tootemark_id, nimetus)
;
ALTER TABLE Tootaja
	ADD CONSTRAINT AK_Tootaja_kasutajanimi UNIQUE (kasutajanimi)
;
ALTER TABLE Tootemark
	ADD CONSTRAINT AK_Tootemark_nimi UNIQUE (nimi)
;
ALTER TABLE Amet ADD CONSTRAINT PK_Amet 
	PRIMARY KEY (amet_kood)
;


ALTER TABLE Ariklient ADD CONSTRAINT PK_Ariklient 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Eraklient ADD CONSTRAINT PK_Eraklient 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Isik ADD CONSTRAINT PK_Isik 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Kampaania ADD CONSTRAINT PK_Kampaania 
	PRIMARY KEY (kampaania_id)
;


ALTER TABLE Kampaania_seisund ADD CONSTRAINT PK_Kampaania_seisund 
	PRIMARY KEY (kampaania_seisund_kood)
;


ALTER TABLE Klient ADD CONSTRAINT PK_Klient 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Meedialiik ADD CONSTRAINT PK_Meedialiik 
	PRIMARY KEY (meedialiik_kood)
;


ALTER TABLE Meediaplaan ADD CONSTRAINT PK_Meediaplaan 
	PRIMARY KEY (kampaania_id, meedialiik_kood)
;


ALTER TABLE Meediaplaani_seisund ADD CONSTRAINT PK_Meediaplaani_seisund 
	PRIMARY KEY (meediaplaani_seisund_kood)
;


ALTER TABLE Organisatsioon ADD CONSTRAINT PK_Organisatsioon 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Osapool ADD CONSTRAINT PK_Osapool 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Sihtryhm ADD CONSTRAINT PK_Sihtryhm 
	PRIMARY KEY (sihtryhm_kood)
;


ALTER TABLE Toode ADD CONSTRAINT PK_Toode 
	PRIMARY KEY (toode_id)
;


ALTER TABLE Tootaja ADD CONSTRAINT PK_Tootaja 
	PRIMARY KEY (osapool_id)
;


ALTER TABLE Tootemark ADD CONSTRAINT PK_Tootemark 
	PRIMARY KEY (tootemark_id)
;




ALTER TABLE Ariklient ADD CONSTRAINT FK_Ariklient_Organisatsioon 
	FOREIGN KEY (osapool_id) REFERENCES Organisatsioon (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Ariklient ADD CONSTRAINT FK_Ariklient_klient 
	FOREIGN KEY (osapool_id) REFERENCES Klient (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Eraklient ADD CONSTRAINT FK_Eraklient_isik 
	FOREIGN KEY (osapool_id) REFERENCES Isik (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Eraklient ADD CONSTRAINT FK_Eraklient_klient 
	FOREIGN KEY (osapool_id) REFERENCES Klient (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Isik ADD CONSTRAINT FK_Isik_osapool 
	FOREIGN KEY (osapool_id) REFERENCES Osapool (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Kampaania ADD CONSTRAINT FK_Kampaania_kampaania_seisund 
	FOREIGN KEY (kampaania_seisund_kood) REFERENCES Kampaania_seisund (kampaania_seisund_kood)
;

ALTER TABLE Kampaania ADD CONSTRAINT FK_Kampaania_tootaja 
	FOREIGN KEY (tootaja_osapool_id) REFERENCES Tootaja (osapool_id)
;

ALTER TABLE Kampaania ADD CONSTRAINT FK_Kampaania_toode 
	FOREIGN KEY (toode_id) REFERENCES Toode (toode_id)
;

ALTER TABLE Meediaplaan ADD CONSTRAINT FK_Meediaplaan_kampaania 
	FOREIGN KEY (kampaania_id) REFERENCES Kampaania (kampaania_id)
;

ALTER TABLE Meediaplaan ADD CONSTRAINT FK_Meediaplaan_meedialiik 
	FOREIGN KEY (meedialiik_kood) REFERENCES Meedialiik (meedialiik_kood)
;

ALTER TABLE Meediaplaan ADD CONSTRAINT FK_Meediaplaan_meediaplaani_seisund 
	FOREIGN KEY (meediaplaani_seisund_kood) REFERENCES Meediaplaani_seisund (meediaplaani_seisund_kood)
;

ALTER TABLE Organisatsioon ADD CONSTRAINT FK_Organisatsioon_osapool 
	FOREIGN KEY (osapool_id) REFERENCES Osapool (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Toode ADD CONSTRAINT FK_Toode_sihtryhm 
	FOREIGN KEY (sihtryhm_kood) REFERENCES Sihtryhm (sihtryhm_kood)
;

ALTER TABLE Toode ADD CONSTRAINT FK_Toode_tootemark 
	FOREIGN KEY (tootemark_id) REFERENCES Tootemark (tootemark_id)
;

ALTER TABLE Tootaja ADD CONSTRAINT FK_Tootaja_amet 
	FOREIGN KEY (amet_kood) REFERENCES Amet (amet_kood)
;

ALTER TABLE Tootaja ADD CONSTRAINT FK_Tootaja_Isik 
	FOREIGN KEY (osapool_id) REFERENCES Isik (osapool_id)
ON DELETE CASCADE
;

ALTER TABLE Tootemark ADD CONSTRAINT FK_Tootemark_klient 
	FOREIGN KEY (klient_osapool_id) REFERENCES Klient (osapool_id)
;
