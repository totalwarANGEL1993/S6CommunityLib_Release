Lib.Require("comfort/IsLocalScript");
Lib.Register("module/information/DialogSystem_API");

function NewDialog(_Name, _PlayerID, _Dialog)
    assert(GUI == nil);
    _Dialog = _Dialog or {};
    assert(type(_Dialog) == "table");

    _Dialog.Name = _Name;
    _Dialog.PlayerID = _PlayerID;
    Lib.DialogSystem.Global:ExpandDialogTable(_Dialog);

    local AP = function(_Page)
        local Page;
        if type(_Page) == "table" then
            -- Page
            Page = _Dialog:BeginPage()

            -- Properties
                :SetName(_Page.Name)
                :SetActor(_Page.Actor)
                :SetTitle(_Page.Title)
                :SetText(_Page.Text)
                :SetSpeech(_Page.Speech)
                :SetDuration(_Page.Duration)
                :UseSkipping(_Page.AutoSkip)
                :SetAction(_Page.Action)
                :SetFadeIn(_Page.FadeIn)
                :SetFadeOut(_Page.FadeOut)
                :SetFaderAlpha(_Page.FaderAlpha)
                :SetTarget(_Page.Target)
                :SetPosition(_Page.Position)
                :UseCloseUp(_Page.DialogCamera)
                :SetAngle(_Page.Angle)
                :SetZoom(_Page.Zoom)
                :SetRotation(_Page.Rotation);
            -- /Properties

            -- MC
            if _Page.MC then
                MC = Page:BeginChoice();
                for i= 1, #_Page.MC do
                    local Option = Array_Append({}, _Page.MC[i]);
                    if _Page.MC[i].ID then
                        table.insert(Option, 1, _Page.MC[i].ID);
                    end
                    MC:Option(unpack(Option));
                end
            -- /MC
                MC:EndChoice();
            end

            -- /Page
            Page:EndPage();
        else
            _Dialog:Redirect(_Page)
            Page = _Page or -1;
        end
        return Page;
    end

    local ASP = function(...)
        if type(arg[1]) ~= "number" then
            Name = table.remove(arg, 1);
        end
        local Sender   = table.remove(arg, 1);
        local Position = table.remove(arg, 1);
        local Title    = table.remove(arg, 1);
        local Text     = table.remove(arg, 1);
        local Dialog   = table.remove(arg, 1);
        local Action;
        if type(arg[1]) == "function" then
            Action = table.remove(arg, 1);
        end
        return AP {
            Name         = Name,
            Title        = Title,
            Text         = Text,
            Actor        = Sender,
            Target       = Position,
            DialogCamera = Dialog == true,
            Action       = Action,
        }
    end

    _Dialog.AP = AP;
    _Dialog.ASP = ASP;
    return _Dialog;
end
API.NewDialog = NewDialog;

function AddDialogPages(_Dialog)
    local Dialog = NewDialog(nil, nil, _Dialog);
    return Dialog.AP, Dialog.ASP;
end
API.AddDialogPages = AddDialogPages;

function IsDialogActive(_PlayerID)
    if not IsLocalScript() then
        return Lib.DialogSystem.Global:GetCurrentDialog(_PlayerID) ~= nil;
    end
    return Lib.DialogSystem.Local:GetCurrentDialog(_PlayerID) ~= nil;
end
API.IsDialogActive = IsDialogActive;

function StartDialog(_Dialog, _Name, _PlayerID)
    if GUI then
        return;
    end
    local PlayerID = _PlayerID;
    if not PlayerID and not Framework.IsNetworkGame() then
        PlayerID = 1; -- Human player?
    end
    assert(_Name ~= nil);
    assert(_PlayerID ~= nil);
    assert(type(_Dialog) == "table", "Dialog must be a table!");
    assert(#_Dialog > 0, "Dialog does not contain pages!");
    for i=1, #_Dialog do
        assert(
            type(_Dialog[i]) ~= "table" or _Dialog[i].__Legit,
            "Page is not initialized!"
        );
    end
    if _Dialog.EnableSky == nil then
        _Dialog.EnableSky = true;
    end
    if _Dialog.EnableFoW == nil then
        _Dialog.EnableFoW = false;
    end
    if _Dialog.HideNotes == nil then
        _Dialog.HideNotes = false;
    end
    if _Dialog.EnableGlobalImmortality == nil then
        _Dialog.EnableGlobalImmortality = true;
    end
    if _Dialog.EnableBorderPins == nil then
        _Dialog.EnableBorderPins = false;
    end
    if _Dialog.RestoreGameSpeed == nil then
        _Dialog.RestoreGameSpeed = true;
    end
    if _Dialog.RestoreCamera == nil then
        _Dialog.RestoreCamera = true;
    end
    if _Dialog.Background == nil then
        _Dialog.Background = false;
    end
    Lib.DialogSystem.Global:StartDialog(_Name, PlayerID, _Dialog);
end
API.StartDialog = StartDialog;

function AP(_Data)
    assert(false);
end

function ASP(...)
    assert(false);
end

-- Legacy support

function API.CreateQuestDialog(_Messages)
    -- Check input
    assert(type(_Messages) == "table" and #_Messages > 0);
    assert(_Messages.Name ~= nil);
    if not _Messages.PlayerID then
        _Messages.PlayerID = _Messages.PlayerID or (_Messages[1][3] or 1);
    end
    assert(_Messages.PlayerID ~= nil);

    -- Start dialog after delay
    RequestJob(function(_Messages)
        local TriggerDialog = true;
        if _Messages.Ancestor then
            local Quest = Quests[GetQuestID(_Messages.Ancestor)];
            assert(Quest ~= nil);
            TriggerDialog = false;
            if Quest.State == QuestState.Over then
                if Quest.Result ~= QuestResult.Interrupted then
                    _Messages.Counter = _Messages.Counter or (_Messages.Delay or 0);
                    _Messages.Counter = _Messages.Counter - 1;
                    if _Messages.Counter <= 0 then
                        TriggerDialog = true;
                    end
                end
            end
        end
        if TriggerDialog then
            API.CreateQuestDialog_Internal(_Messages);
            return true;
        end
    end, _Messages);
end

function API.CreateQuestDialog_Internal(_Messages)
    local Dialog = {
        Background = true,
        RestoreCamera = false
    };
    local AP = AddDialogPages(Dialog);
    for i= 1, #_Messages do
        AP {
            Actor    = _Messages[i][2],
            Title    = GetPlayerName(_Messages[i][2]),
            Text     = _Messages[i][1],
            Duration = _Messages[i][4] or -1,
            Callback = _Messages[i][5],
        }
    end
    Dialog.Finished = _Messages.Finished;
    StartDialog(Dialog, _Messages.Name, _Messages.PlayerID);
end

function API.InterruptQuestDialog(_Dialog)
    log("API.InterruptQuestDialog is not supported!");
end

function API.RestartQuestDialog()
    log("API.RestartQuestDialog is not supported!");
end

