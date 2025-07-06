--- Stellt einge Funktionen für Diplomatie bereit.



--- Ändert die Diplomatie des Spielers zu den angegebenen Parteien.
---
--- Die aktuellen diplomatischen Beziehungen werden zwischengespeichert, sofern
--- kein Backup existiert.
---
--- @param _PlayerID integer Player ID
--- @param _State integer State ID
--- @param ... integer List of player IDs
function SetDiplomacyStateForPlayer(_PlayerID, _State, ...)
end
API.SetDiplomacyStateForPlayer = SetDiplomacyStateForPlayer;

--- Ändert die Diplomatie aller angegebenen Parteien zueinander.
---
--- Die aktuellen diplomatischen Beziehungen werden zwischengespeichert, sofern
--- kein Backup existiert.
---
--- @param _State integer State ID
--- @param ... integer List of player IDs
function SetDiplomacyStateForPlayers(_State, ...)
end
API.SetDiplomacyStateForPlayers = SetDiplomacyStateForPlayers;

--- Erstellt ein Backup der aktuellen diplomatischen Beziehungen aller Parteien,
--- wenn noch kein Backup existtiert.
function SaveDiplomacyStates()
end
API.SaveDiplomacyStates = SaveDiplomacyStates;

--- Setzt die diplomatischen Beziehungen zurück, falls ein Backup existiert.
--- Danach wird das Backup invalidiert.
function ResetDiplomacyStates()
end
API.ResetDiplomacyStates = ResetDiplomacyStates;



--- Die diplomatischen Beziehungen zwischen zwei Spielern haben sich geändert.
---
--- #### Parameters:
--- * `PlayerID1`: <b>integer</b> Frist player ID
--- * `PlayerID2`: <b>integer</b> Second player ID
--- * `OldState`:  <b>integer</b> Previous diplomatic state
--- * `NewState`:  <b>integer</b> New diplomatic state
Report.DiplomacyChanged = anyInteger

