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

