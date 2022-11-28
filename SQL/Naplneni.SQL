--Technici
INSERT INTO Technici (TechnikID, Jmeno, Prijmeni,Email,RodneCislo, Mesto, Ulice, PSC, Uroven,PopisneCislo)
VALUES
(1,'Josef','Depa', 'depa@h-desk.cz', 7402436971, 'Adamov', 'České Budějovice', 37371, 5, 18),
(2, 'Jana', 'Polišenská', 'polisenska@h-desk.cz', 8542678215, 'Borek', 'České Budějovice', 37367, 4, 120 ),
(3, 'Petr', 'Vykoupil', 'vykoupil@h-desk.cz', 9857824698, 'Bělov', 'Zlín', 76821, 8, 9),
(4, 'Hana', 'Vykoupilová,', 'vykoupilova@h-desk.cz', 9951548762, 'Bělov', 'Zlín', 76821, 8, 4),
(5, 'Samanta', 'Olafová', 'olafova@h-desk.cz', 846842574, 'Abertamy', 'Karlovy Vary', 36235, 1, 61),
(6, 'Nela', 'Herkova', 'herkova@h-desk.cz', 5482167452, 'Andělská Hora', 'Karlovy Vary', 36471, 2, 68),
(7, 'František', 'Flek', 'flek@h-desk.cz', 0154869213, 'Chabařovice', 'Ústí nad Labem',40001, 3, 12),
(8, 'Jan', 'Hanak', 'hanak@h-desk.cz', 5487621857, 'Chlumec', 'Ústí nad Labem', 40339, 2, 12),
(9, 'Karel', 'Bek', 'bek@h-desk.cz', 6487568542, 'Hanušovice', 'Šumperk', 78833, 5,750),
(10, 'Vlastislava', 'Otrafetanová', 'otrafetanova@h-desk.cz', 5705469785, 'Dolní Studénky', 'Šumperk', 78820, 10,918),
(11, 'Radoslava', 'Roklatová', 'roklatova@h-desk.cz', 0485769125, 'Brníčko', 'Šumperk', 78975, 9,115)

--Uživatele
INSERT INTO Uzivatele (UzivatelID, Jmeno, Prijmeni, Mesto, Ulice, PSC, Email, Telefon, PopisneCislo)
VALUES
(1, 'Zbyněk', 'Vlček', 'Barchovice', 'Kolín', 28163, 'vlcek@seznam.cz', 602854752, 3),
(2, 'Petra', 'Vyhnálková', 'Běřunice', 'Nymburk', '28908',  'vyhnalkova.petra@gmail.cz', 604589512, 8),
(3, 'Michal', 'Uhrák', 'Bílá', 'Liberec', 46343,  'uhrak@gmail.com', 608457957, 56),
(4, 'Barbora', 'Tyšlicová',  'Babylon', 'Domažlice', 34401, 'tyslicova.b@seznam.cz', 777526854, 126),
(5, 'Svatopluk', 'Paloncý', 'Batňovice', 'Trutnov', 54232,  'paloncy@email.cz', 702968854,450),
(6, 'Ema', 'Krostanová', 'Arnolec', 'Jihlava', 58827,  'krostanova-ema@gmail.cz', 722941523, 810),
(7, 'Hynek', 'Mareš', 'Branky', 'Vsetín', 75645,  'mares@pots.cz', 799147756,915),
(8, 'Štěpán', 'Šinkovský', 'Hranice', 'Přerov', 75301,  'sinkovskystepanek@seznam.cz', 770059963, 9),
(9, 'Alexandra', 'Stará', 'Albrechtice', 'Karviná', 73543,  'stara@utb.cz', 739574625,87),
(10, 'Xénie', 'Matušinská', 'Aš', 'Cheb', 35201,  'matusinska@post.cz', 730485541,4),
(11, 'Tomáš', 'Zavadil', 'Bělá', 'Semily', 51401,  'zavadiltom@cez.cz', 601234587,9)

--Zařízení
INSERT INTO Zarizeni (ZarizeniID,Znacka,Model,DatumVydani, SerioveCislo)
VALUES
(1, 'televize', 'LG', 'hfis51vsz', '2019-11-27', 594448210, ''),
(2, 'reproduktor', 'niceboy', '86nd', '2022-4-5', 84215845, ''),
(3, 'sluchátka', 'sencor', 'i50', '2005-8-11', 456446, ''),
(4, 'klávesnice', 'Apple', '78pro', '2020-2-7', 58415669, ''),
(5, 'monitor', 'samsung', 'top10', '2010-10-10', 8547596, ''),
(6, 'mobilní telefon', 'xiaomi', 'no5', '2014-9-6', 548216475, ''),
(7, 'notebook', 'Lenovo', '028', '2017-6-6', 52481569, ''),
(8, 'myš', 'connect', 'IT101', '2022-25-11', 02100215, ''),
(9, 'powerbanka', 'Hummer', '45', '1999-12-17', 000001, ''),
(10, 'tiskárna', 'canon', 'OPE11', '2018-1-1', 36412555, ''),
(11, 'projektor', 'optoma', 'k45', '2022-2-2', 745415545, ''),

--Přiřazená zařízení
INSERT INTO ZarizeniUzivatele (ZarizeniID, UzivatelID)
VALUES
(1, 1),
(1, 3),
(3, 5),
(4, 1),
(6, 7),
(7, 6),
(4, 8),
(9, 9),
(10, 8),
(11, 5)

--Tikety
INSERT INTO Tikety (TicketID, UzivatelID,TechnikID, ZarizeniID, Popis, DatumVytvoreni, DatumUzavreni, Stav)