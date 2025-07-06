Lib.Register("comfort/IsHistoryEdition");

function IsHistoryEdition()
    return Network.IsNATReady ~= nil;
end
API.IsHistoryEdition = IsHistoryEdition;

-- Legacy support
function API.IsHistoryEditionNetworkGame()
    return IsHistoryEdition() and Framework.IsNetworkGame();
end

