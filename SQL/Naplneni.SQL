--Technici
INSERT INTO Technici (Jmeno, Prijmeni,Email,RodneCislo, Mesto, Ulice, PSC, Uroven,PopisneCislo)
VALUES
('Josef','Depa', 'depa@h-desk.cz', 7402436971, 'Adamov', 'České Budějovice', 37371, 5, 18),
('Jana', 'Polišenská', 'polisenska@h-desk.cz', 8542678215, 'Borek', 'České Budějovice', 37367, 4, 120 ),
('Petr', 'Vykoupil', 'vykoupil@h-desk.cz', 9857824698, 'Bělov', 'Zlín', 76821, 8, 9),
('Hana', 'Vykoupilová,', 'vykoupilova@h-desk.cz', 9951548762, 'Bělov', 'Zlín', 76821, 8, 4),
('Samanta', 'Olafová', 'olafova@h-desk.cz', 846842574, 'Abertamy', 'Karlovy Vary', 36235, 1, 61),
('Nela', 'Herkova', 'herkova@h-desk.cz', 5482167452, 'Andělská Hora', 'Karlovy Vary', 36471, 2, 68),
('František', 'Flek', 'flek@h-desk.cz', 0154869213, 'Chabařovice', 'Ústí nad Labem',40001, 3, 12),
('Jan', 'Hanak', 'hanak@h-desk.cz', 5487621857, 'Chlumec', 'Ústí nad Labem', 40339, 2, 12),
('Karel', 'Bek', 'bek@h-desk.cz', 6487568542, 'Hanušovice', 'Šumperk', 78833, 5,750),
('Vlastislava', 'Otrafetanová', 'otrafetanova@h-desk.cz', 5705469785, 'Dolní Studénky', 'Šumperk', 78820, 10,918),
('Radoslava', 'Roklatová', 'roklatova@h-desk.cz', 0485769125, 'Brníčko', 'Šumperk', 78975, 9,115)

--Uživatele
INSERT INTO Uzivatele (Jmeno, Prijmeni, Mesto, Ulice, PSC, Email, Telefon, PopisneCislo)
VALUES
('Zbyněk', 'Vlček', 'Barchovice', 'Kolín', 28163, 'vlcek@seznam.cz', 602854752, 3),
('Petra', 'Vyhnálková', 'Běřunice', 'Nymburk', '28908',  'vyhnalkova.petra@gmail.cz', 604589512, 8),
('Michal', 'Uhrák', 'Bílá', 'Liberec', 46343,  'uhrak@gmail.com', 608457957, 56),
('Barbora', 'Tyšlicová',  'Babylon', 'Domažlice', 34401, 'tyslicova.b@seznam.cz', 777526854, 126),
('Svatopluk', 'Paloncý', 'Batňovice', 'Trutnov', 54232,  'paloncy@email.cz', 702968854,450),
('Ema', 'Krostanová', 'Arnolec', 'Jihlava', 58827,  'krostanova-ema@gmail.cz', 722941523, 810),
('Hynek', 'Mareš', 'Branky', 'Vsetín', 75645,  'mares@pots.cz', 799147756,915),
('Štěpán', 'Šinkovský', 'Hranice', 'Přerov', 75301,  'sinkovskystepanek@seznam.cz', 770059963, 9),
('Alexandra', 'Stará', 'Albrechtice', 'Karviná', 73543,  'stara@utb.cz', 739574625,87),
('Xénie', 'Matušinská', 'Aš', 'Cheb', 35201,  'matusinska@post.cz', 730485541,4),
('Tomáš', 'Zavadil', 'Bělá', 'Semily', 51401,  'zavadiltom@cez.cz', 601234587,9)

--Zařízení
INSERT INTO Zarizeni (Typ, Znacka,Model,DatumVydani, SerioveCislo, UzivatelID)
VALUES
('televize', 'LG', 'hfis51vsz', '2019-11-27', '5A94448210',1),
('reproduktor', 'niceboy', '86nd', '2022-4-5', '842HF/15845', NULL),
('sluchátka', 'sencor', 'i50', '2005-8-11', '456D6', 3),
('klávesnice', 'Apple', '78pro', '2020-2-7', '5841D5669',NULL),
('monitor', 'samsung', 'top10', '2010-10-10', '8547F596', 4),
('mobilní telefon', 'xiaomi', 'no5', '2014-9-6', '548G2G16475', 5),
('notebook', 'Lenovo', '028', NULL, '52481456A9', NULL),
('myš', 'connect', 'IT101', '2022-11-25', '02100215', 4),
('powerbanka', 'Hummer', '45', '1999-12-17', '00001', 8),
('tiskárna', 'canon', 'OPE11', '2018-1-1', '36412555', 2),
('projektor', 'optoma', 'k45', '2022-2-2', '745415545', 10)

--Tikety
INSERT INTO Tikety (TechnikID, UzivatelID, Popis, Zalozeni, Ukonceni, Stav)
VALUES
(2, 2, 'Nefunguje ovládání zvuku na televizi', '2020-11-27', '2020-11-28', 'uzavřeno'),
(2, 3, 'Vypadává zvuk při přehrávání z youtube', '2021-5-20', NULL, 'otevřeno'),
(NULL, 3, 'Pravé sluchátko se utrhlo', '2022-8-25', '2022-9-30', 'uzavřeno'),
(3, 3, 'Nefunguje Wifi na 3. Patře', '2022-11-30','2022-11-30','uzavřeno'),
(7, 4, 'Nefunguje klávesnice', '2020-12-1', '2020-12-2', 'uzavřeno'),
(6, 5, 'Nefunguje výstup z počítače ani na monitor ani na televizi', '2022-12-2', NULL, 'otevřeno'),
(8, 8, 'Nefungují mé přihlašovací údaje', '2022-12-3', NULL, 'otevřeno'),
(NULL, 4, 'Nefunguje klávesnice opět', '2022-10-4', NULL, 'otevřeno'),
(10, 3,'Nefunguje myš', '2022-12-5', '2022-12-6', 'uzavřeno'),
(10, 2, 'Nefungují čipové senzory na dveřích', '2022-10-6', NULL, 'otevřeno'),
(NULL, 1, 'Tiskárna tiskne pouze fialově', '2022-12-7', NULL, 'otevřeno')

--StatusUpdate
INSERT INTO StatusUpdate (TicketID, TechnikID, Komentar, Datum)
VALUES
(1, 2, 'Vyměněn kabel. Nepomohlo proběhne další diagnostika', '2020-11-28'),
(1, 2, 'Nastavil jsem ovládání zvuku na televizi. Problém se jeví jako vyřešen otevřete nový ticket pokud se problém objeví znovu', '2020-11-28'),
(2,3, 'Vypadávání zvuku při přehrávání z youtube je způsobeno špatným signálem nejspíše chyba v zařízení', '2021-5-21'),
(2, 4, 'Odeslán na opravu', '2021-5-22'),
(3,6, 'Pravé sluchátko se utrhlo, není opravitelné, Sluchátka byla recyklována zažádejte si o nové', '2022-8-26'),
(4,3, 'Wifi na 3. Patře je vypnuté z důvodu výmněny routeru jak bylo psáno 14 dní předem mailem', '2022-12-1'),
(5,7,'Klavesnice nebyla zapojena do pc po zapojení funguje.','2022-12-30'),
(6, 6, 'Výstup z počítače je v pořádku, problém je v zařízení', '2022-12-3'),
(6, 5, 'Zařízení bylo odesláno na opravu', '2022-12-4'),
(7, 8, 'Nefungují přihlašovací údaje byly změněny', '2022-12-4'),
(8, 3, 'Klávesnice byla dignostikována a nejeví žádné známky poruchy bude probíhat další diagnostika', '2022-12-5'),
(9, 10, 'Myš byla vyměněna za novou', '2022-12-6'),
(10, 10, 'Čipové senzory byly obědnány na opravu technikem', '2022-12-7')

--Přiřazená zařízení
INSERT INTO ZarizeniTicketu (ZarizeniID, TicketID)
VALUES
(1, 1),
(3, 2),
(2, 3),
(4, 5),
(5, 6),
(1, 6),
(4, 8),
(8, 9),
(10,11)