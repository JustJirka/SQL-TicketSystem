# SQL-TicketSystem
Databáze je složena z šesti tabulek. Tabulky: Uživatele, Technici, Tikety, Zařízeni,
StatusUpdate a ZarizeniTicketu. Každá tabulka obsahuje odpovídající údaje. Například
tabulka Tikety obsahuje TicketID, Zalozeni(datum založení tiketu), Stav(otevřeno nebo
uzavřeno), Ukonceni(datum uzavření ticketu, zdali je otevřený jedná se o NULL),
TechnikID(ID technika, který je přiřazený tiketu), UzivatelID(ID uživatele, jenž založil tiket)

## Jak použit
1. Vytvořte tabulky spuštěním souboru Vytvoreni.SQL
2. Přidejte data do tabulek pomocí Naplneni.SQL
3. Nyní můžete použít dotazy ze souboru Dotazy.SQL
