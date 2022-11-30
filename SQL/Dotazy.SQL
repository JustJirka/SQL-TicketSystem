--Vypíše tikety včetně jejich zařízení a uživatele, který je přiřazen k tiketu
SELECT [Tikety].[TicketID], [Tikety].[Popis], [Zarizeni].[Typ] AS [Zarizeni], [Uzivatele].[Jmeno] AS [Uzivatel]
FROM [Tikety]
LEFT JOIN [ZarizeniTicketu] ON [Tikety].[TicketID] = [ZarizeniTicketu].[TicketID]
LEFT JOIN [Zarizeni] ON [ZarizeniTicketu].[ZarizeniID] = [Zarizeni].[ZarizeniID]
LEFT JOIN [Uzivatele] ON [Tikety].[UzivatelID] = [Uzivatele].[UzivatelID]

--Vypíše techniky kteří mají přiřazené tikety
SELECT [Tikety].[TicketID], [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni] AS [Technik]
FROM [Tikety]
LEFT JOIN [Technici] ON [Tikety].[TechnikID] = [Technici].[TechnikID]
WHERE [Tikety].[TechnikID] IS NOT NULL

--Vypíše počet tiketů které mají přiřazené technika a které jsou v stavu "otevřeno"
SELECT [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni] AS [Technik], COUNT([Tikety].[TicketID]) AS [PocetOtevrenychTicketu]
FROM [Tikety]
LEFT JOIN [Technici] ON [Tikety].[TechnikID] = [Technici].[TechnikID]
WHERE [Tikety].[TechnikID] IS NOT NULL AND [Tikety].[Stav] = 'otevřeno'
GROUP BY [Technici].[Jmeno] + ' ' + [Technici].[Prijmeni]

--Vypíše všechny tikety zařízení které vlastní uživatel s ID 1
SELECT [Tikety].[TicketID], [Tikety].[Popis], [Zarizeni].[Typ] AS [Zarizeni], [Uzivatele].[Jmeno] AS [Uzivatel]
FROM [Tikety]
LEFT JOIN [ZarizeniTicketu] ON [Tikety].[TicketID] = [ZarizeniTicketu].[TicketID]
LEFT JOIN [Zarizeni] ON [ZarizeniTicketu].[ZarizeniID] = [Zarizeni].[ZarizeniID]
LEFT JOIN [Uzivatele] ON [Zarizeni].[UzivatelID] = [Uzivatele].[UzivatelID]
WHERE [Uzivatele].[UzivatelID] = 1

--Vypíše techniky kteří napsali více než jeden status update
SELECT Technici.Jmeno, Technici.Prijmeni FROM Technici
JOIN StatusUpdate ON Technici.TechnikID = StatusUpdate.TechnikID
GROUP BY Technici.Jmeno, Technici.Prijmeni
HAVING COUNT(*) > 1

--U tiketu s id 5 nastaví stav tiketu na "zavřený" a nastaví datum ukončení tiketu na aktuální datum
UPDATE Tikety
SET Tikety.TicketID = 'zavřený', Tikety.Ukonceni = GETDATE()
WHERE Tikety.TicketID=5);

--Přidá k tiketům které nemají žádný status update status update s textem "Omlouváme se za zpoždění, pracujeme na tom."
INSERT INTO StatusUpdate (Komentar, Datum, TicketID, TechnikID)
SELECT 'Omlouváme se za zpoždění, pracujeme na tom.', Tikety.Zalozeni, Tikety.TicketID, Tikety.TechnikID
FROM Tikety
WHERE NOT EXISTS (SELECT * FROM StatusUpdate WHERE StatusUpdate.TicketID = Tikety.TicketID);




--
--- procedury
--


--Přidá tikety které nemají přiřazené technika technikovi který má nejméně tiketů
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