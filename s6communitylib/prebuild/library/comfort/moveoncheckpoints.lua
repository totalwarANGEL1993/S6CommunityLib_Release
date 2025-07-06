Lib.Require("comfort/LookAt");
Lib.Register("comfort/MoveOnCheckpoints");

function MoveOnCheckpoints(_Entity, _Checkpoints, _IgnoreBlocking)
    local ID = GetID(_Entity);
    assert(Lib.Loader.IsLocalEnv == false, "Can only be used in global script.");
    assert(ID ~= 0, "Moving entity does not exist!");
    Path:new(ID, _Checkpoints, nil, nil, nil, nil, _IgnoreBlocking == true, nil, nil, 200);
end
API.MoveEntityOnCheckpoints = MoveOnCheckpoints;
API.MoveOnCheckpoints = MoveOnCheckpoints;

