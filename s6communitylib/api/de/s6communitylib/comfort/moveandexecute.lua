--- Bewegt eine Entität zur Zielposition und führt eine Funktion aus.

--- Bewegt eine Entität zur Zielposition und führt eine Funktion aus.
--- @param _Entity any Zu bewegende Entität
--- @param _Target any Zielposition
--- @param _Action function Aktion bei Ankunft
--- @param _IgnoreBlocking boolean Blocking ignorieren
function MoveAndExecute(_Entity, _Target, _Action, _IgnoreBlocking)
end
API.MoveEntityAndLookAt = MoveAndLookAt;
API.MoveAndLookAt = MoveAndLookAt;

