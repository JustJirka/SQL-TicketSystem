--1. Vypíše tikety včetně jejich zařízení a uživatele, který je přiřazen k tiketu
SELECT [Tikety].[TicketID], [Tikety].[Popis], [Zarizeni].[Typ] AS [Zarizeni], [Uzivatele].[Jmeno] AS [Uzivatel]
FROM [Tikety]
LEFT JOIN [ZarizeniTicketu] ON [Tikety].[TicketID] = [ZarizeniTicketu].[TicketID]
LEFT JOIN [Zarizeni] ON [ZarizeniTicketu].[ZarizeniID] = [Zarizeni].[ZarizeniID]
LEFT JOIN [Uzivatele] ON [Tikety].[UzivatelID] = [Uzivatele].[UzivatelID]

--2. Vypíše techniky kteří mají přiřazené tikety
SELECT [Tikety].[TicketID], [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni] AS [Technik]
FROM [Tikety]
LEFT JOIN [Technici] ON [Tikety].[TechnikID] = [Technici].[TechnikID]
WHERE [Tikety].[TechnikID] IS NOT NULL

--3. Vypíše počet tiketů které mají přiřazené technika a které jsou v stavu "otevřeno"
SELECT [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni] AS [Technik], COUNT([Tikety].[TicketID]) AS [PocetOtevrenychTicketu]
FROM [Tikety]
LEFT JOIN [Technici] ON [Tikety].[TechnikID] = [Technici].[TechnikID]
WHERE [Tikety].[TechnikID] IS NOT NULL AND [Tikety].[Stav] = 'otevřeno'
GROUP BY [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni]

--4. Vypíše všechny tikety zařízení které vlastní uživatel s ID 1
SELECT [Tikety].[TicketID], [Tikety].[Popis], [Zarizeni].[Typ] AS [Zarizeni], [Uzivatele].[Jmeno] AS [Uzivatel]
FROM [Tikety]
LEFT JOIN [ZarizeniTicketu] ON [Tikety].[TicketID] = [ZarizeniTicketu].[TicketID]
LEFT JOIN [Zarizeni] ON [ZarizeniTicketu].[ZarizeniID] = [Zarizeni].[ZarizeniID]
LEFT JOIN [Uzivatele] ON [Zarizeni].[UzivatelID] = [Uzivatele].[UzivatelID]
WHERE [Uzivatele].[UzivatelID] = 1

--5. Vypíše techniky kteří napsali více než jeden status update
SELECT Technici.Jmeno, Technici.Prijmeni FROM Technici
JOIN StatusUpdate ON Technici.TechnikID = StatusUpdate.TechnikID
GROUP BY Technici.Jmeno, Technici.Prijmeni
HAVING COUNT(*) > 1

--6. U tiketu s id 5 nastaví stav tiketu na "zavřený" a nastaví datum ukončení tiketu na aktuální datum
UPDATE Tikety
SET Tikety.TicketID = 'zavřený', Tikety.Ukonceni = GETDATE()
WHERE Tikety.TicketID=5);

--7. Přidá k tiketům které nemají žádný status update status update s textem "Omlouváme se za zpoždění, pracujeme na tom."
INSERT INTO StatusUpdate (Komentar, Datum, TicketID, TechnikID)
SELECT 'Omlouváme se za zpoždění, pracujeme na tom.', Tikety.Zalozeni, Tikety.TicketID, Tikety.TechnikID
FROM Tikety
WHERE NOT EXISTS (SELECT * FROM StatusUpdate WHERE StatusUpdate.TicketID = Tikety.TicketID)

--8. Smaže zákazníky kteří nemají žádné zařízení ani ticket
DELETE FROM Uzivatele
WHERE UzivatelID NOT IN (SELECT UzivatelID FROM Zarizeni)
AND UzivatelID NOT IN (SELECT UzivatelID FROM Tikety)

--9. Smaže tikety které nemají žádného majitele
DELETE FROM Tikety
WHERE UzivatelID IS NULL;

--10.Zobrazí tikety od data 2021-01-01
SELECT * FROM Tikety WHERE Zalozeni >= '2021-01-01'

--11. Zobrazí první 3 uživatele podle počtu tiketů
SELECT UzivatelID, COUNT(TicketID) AS PocetTiketu
FROM Tikety
GROUP BY UzivatelID
ORDER BY PocetTiketu DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY

--12. Sniží uroveň všem Technikům kteří nezpracovali žádný ticket za posledních 6. měsíců o 1 a zvýší uroven všem Technikům kteří zpracovali alespoň jeden ticket za posledních 6. měsíců o 1
DECLARE @datum DATE = DATEADD(MONTH, -6, GETDATE());
UPDATE Technici
SET Uroven = Uroven + 1
WHERE EXISTS (SELECT * FROM Tikety WHERE TechnikID = Technici.TechnikID AND Zalozeni > @datum);
UPDATE Technici
SET Uroven = Uroven - 1
WHERE NOT EXISTS (SELECT * FROM Tikety WHERE TechnikID = Technici.TechnikID AND Zalozeni > @datum);

--13. Přidá nového technika
INSERT INTO Technici (Jmeno, Prijmeni, Email, RodneCislo, Ulice, PopisneCislo, Mesto, PSC, Uroven)
VALUES ('Petr', 'Novak', 'novak@utb.cz', 123456789, 'Králec', 120, 'Dolní studénky', 78820, 1)

--14. Zobrazí všechny techniky z Českých budějovic
SELECT * FROM Technici WHERE Mesto = 'České Budějovice'

--15. Zobrazí všechny uživatele co mají email na doménu gmail.com
SELECT * FROM Uzivatele WHERE Email LIKE '%@gmail.com'

--Triger který při vytvoření tiketu nastaví stav tiketu na "otevřeno" a nastaví datum založení tiketu na aktuální datum
CREATE TRIGGER OteviraniTicketu ON Tikety
AFTER INSERT
AS
BEGIN
UPDATE Tikety
SET Stav = 'otevřeno', Zalozeni = GETDATE()
WHERE TicketID = (SELECT MAX(TicketID) FROM Tikety)
END


-- Procedura která přidá tikety které nemají přiřazené technika technikovi který má nejméně tiketů
CREATE PROCEDURE [dbo].[PridatTiketyTechnikovi]
AS
BEGIN
    DECLARE @TechnikID INT
    DECLARE @TicketID INT
    DECLARE @PocetTiketu INT
    DECLARE @MinPocetTiketu INT
    DECLARE @MinTechnikID INT

    SET @PocetTiketu = (SELECT COUNT(*) FROM Tikety WHERE TechnikID IS NULL)

    WHILE (@PocetTiketu > 0)
    BEGIN
        SET @MinPocetTiketu = (SELECT MIN(PocetTiketu) FROM (SELECT COUNT(*) AS PocetTiketu FROM Tikety GROUP BY TechnikID) AS MinPocetTiketu)
        SET @MinTechnikID = (SELECT TechnikID FROM (SELECT COUNT(*) AS PocetTiketu, TechnikID FROM Tikety GROUP BY TechnikID) AS MinPocetTiketu WHERE PocetTiketu = @MinPocetTiketu)
        SET @TicketID = (SELECT TOP 1 TicketID FROM Tikety WHERE TechnikID IS NULL)
        UPDATE Tikety SET TechnikID = @MinTechnikID WHERE TicketID = @TicketID
        SET @PocetTiketu = @PocetTiketu - 1
    END
END