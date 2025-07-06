Lib.Require("comfort/LookAt");
Lib.Register("comfort/MoveAndExecute");

function MoveAndExecute(_Entity, _Target, _Action, _IgnoreBlocking)
    local ID = GetID(_Entity);
    assert(Lib.Loader.IsLocalEnv == false, "Can only be used in global script.");
    assert(ID ~= 0, "Moving entity does not exist!");

    local Target;
    if type(_Target) ~= "table" then
        local ID2 = GetID(_Target);
        local x,y,z = Logic.EntityGetPos(ID2);
        Target = {X= x, Y= y};
    else
        Target = _Target;
    end

    if _IgnoreBlocking then
        Logic.MoveEntity(ID, Target.X, Target.Y);
        if Logic.IsSettler(ID) == 1 then
            Logic.SetTaskList(ID, TaskLists.TL_NPC_WALK);
        end
    else
        Logic.MoveSettler(ID, Target.X, Target.Y);
    end

    StartSimpleJobEx(function(_Entity, _Target, _Action)
        if not IsExisting(_Entity) then
            return true;
        end
        if Logic.IsEntityMoving(GetID(_Entity)) == false then
            if type(_Action) == "function" then
                _Action(_Entity, _Target);
            end
            return true;
        end
    end, _Entity, _Target, _Action);
end
API.MoveEntityAndExecute = MoveAndExecute;
API.MoveAndExecute = MoveAndExecute;

