---@diagnostic disable: missing-return-value
---@diagnostic disable: return-type-mismatch

Lib.Register("module/quest/Quest_API");

function SetupQuest(_Data)
    if GUI then
        return;
    end
    error(not _Data.Name or not Quests[GetQuestID(_Data.Name)], "SetupQuest: A quest named '%s' already exists!", tostring(_Data.Name));
    return Lib.Quest.Global:CreateSimpleQuest(_Data);
end
API.CreateQuest = SetupQuest;

function SetupNestedQuest(_Data)
    if GUI or type(_Data) ~= "table" then
        return;
    end
    error(_Data.Segments ~= nil and #_Data.Segments ~= 0, "SetupNestedQuest: Segmented quest '%s' is missing it's segments!", tostring(_Data.Name));
    return Lib.Quest.Global:CreateNestedQuest(_Data);
end
API.CreateNestedQuest = SetupNestedQuest;

function AddDisableTriggerCondition(_Function)
    if GUI then
        return;
    end
    table.insert(Lib.Quest.Global.ExternalTriggerConditions, _Function);
end
API.AddDisableTriggerCondition = AddDisableTriggerCondition;

function AddDisableTimerCondition(_Function)
    if GUI then
        return;
    end
    table.insert(Lib.Quest.Global.ExternalTimerConditions, _Function);
end
API.AddDisableTimerCondition = AddDisableTimerCondition;

function AddDisableDecisionCondition(_Function)
    if GUI then
        return;
    end
    table.insert(Lib.Quest.Global.ExternalDecisionConditions, _Function);
end
API.AddDisableDecisionCondition = AddDisableDecisionCondition;

-- Legacy support

function QuestMessage(_Text, _Sender, _Receiver, _Callback, _AncestorWt, _Ancestor)
    if type(_Callback) == "number" then
        local tmp = _Callback;
        _AncestorWt = _Callback;
        _Callback = tmp;
    end

    local QuestTable = {
        Name        = "QSB_QuestMessage_" ..(Quests[0] +1),
        Success     = _Text,
        Sender      = _Sender,
        Receiver    = _Receiver,

        Goal_InstantSuccess(),
        Trigger_AlwaysActive(),
    };
    if _Callback then
        table.insert(QuestTable, Reward_MapScriptFunction(_Callback));
    end
    if _Ancestor and _AncestorWt then
        table.insert(QuestTable, Trigger_OnQuestSuccess(_Ancestor, _AncestorWt));
    end
    if _AncestorWt and not _Ancestor then
        table.insert(QuestTable, {
        Triggers.Custom2, {
            {QuestName = _Ancestor, WaitTime = _AncestorWt or 1,},
            function(_Data, _Quest)
                _Quest.StartedAt = _Quest.StartedAt or GetSecondsRealTime();
                return GetSecondsRealTime() > _AncestorWt + _Quest.StartedAt;
            end
        }});
    end
    SetupQuest(QuestTable);
end
API.CreateQuestMessage = QuestMessage;

