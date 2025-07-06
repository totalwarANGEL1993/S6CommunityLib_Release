--- Move an entity to a position and executes a function.

--- Move an entity to a position and executes a function.
--- @param _Entity any Entity to move
--- @param _Target any Position to move to
--- @param _Action function Action on arrival
--- @param _IgnoreBlocking boolean Ignore blocking
function MoveAndExecute(_Entity, _Target, _Action, _IgnoreBlocking)
end
API.MoveEntityAndLookAt = MoveAndLookAt;
API.MoveAndLookAt = MoveAndLookAt;

