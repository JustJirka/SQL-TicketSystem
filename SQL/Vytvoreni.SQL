CREATE TABLE Technici
(
  TechnikID INT NOT NULL,
  Jmeno VARCHAR(50) NOT NULL,
  Prijmeni VARCHAR(50) NOT NULL,
  Email VARCHAR(200) NOT NULL,
  RodneCislo INT NOT NULL,
  Ulice VARCHAR(50) NOT NULL,
  Mesto VARCHAR(50) NOT NULL,
  PSC INT NOT NULL,
  Uroven INT NOT NULL,
  PRIMARY KEY (TechnikID)
);

CREATE TABLE Uzivatele
(
  Jméno VARCHAR(50) NOT NULL,
  Prijmeni VARCHAR(50) NOT NULL,
  UzivatelID INT NOT NULL,
  Ulice VARCHAR(50) NOT NULL,
  Mesto VARCHAR(50) NOT NULL,
  PSC INT NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Telefon INT NOT NULL,
  PRIMARY KEY (UzivatelID)
);

CREATE TABLE Tikety
(
  Zalozeni DATE NOT NULL,
  Popis VARCHAR(250) NOT NULL,
  Stav VARCHAR(10) NOT NULL,
  Ukonceni DATE NOT NULL,
  TicketID INT NOT NULL,
  TechnikID INT NOT NULL,
  UzivatelID INT NOT NULL,
  PRIMARY KEY (TicketID),
  FOREIGN KEY (TechnikID) REFERENCES Technici(TechnikID),
  FOREIGN KEY (UzivatelID) REFERENCES Uzivatele(UzivatelID)
);

CREATE TABLE Zarizeni
(
  Typ VARCHAR(100) NOT NULL,
  Název VARCHAR(100) NOT NULL,
  Datum_vydání DATE NOT NULL,
  Seriove_číslo INT NOT NULL,
  ZarizeniID INT NOT NULL,
  UzivatelID INT NOT NULL,
  PRIMARY KEY (ZarizeniID),
  FOREIGN KEY (UzivatelID) REFERENCES Uzivatele(UzivatelID)
);

CREATE TABLE StatusUpdate
(
  Komentar VARCHAR(250) NOT NULL,
  Datum DATE NOT NULL,
  StatusID INT NOT NULL,
  TicketID INT NOT NULL,
  TechnikID INT NOT NULL,
  PRIMARY KEY (StatusID),
  FOREIGN KEY (TicketID) REFERENCES Tikety(TicketID),
  FOREIGN KEY (TechnikID) REFERENCES Technici(TechnikID)
);

CREATE TABLE PrirazeneZarizeni
(
  TicketID INT NOT NULL,
  ZarizeniID INT NOT NULL,
  PRIMARY KEY (TicketID, ZarizeniID),
  FOREIGN KEY (TicketID) REFERENCES Tikety(TicketID),
  FOREIGN KEY (ZarizeniID) REFERENCES Zarizeni(ZarizeniID)
);