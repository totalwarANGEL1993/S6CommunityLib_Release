Lib.Require("comfort/IsLocalScript");
Lib.Register("module/city/Construction_API");

function UseForceBallistaDistance(_Flag)
    if not IsLocalScript() then
        ExecuteLocal("UseForceBallistaDistance(%s)", tostring(_Flag == true));
    end
    Lib.Construction.AquireContext();
    this.Construction.ForceBallistaDistance = _Flag == true;
    Lib.Construction.ReleaseContext();
end
API.UseForceBallistaDistance = UseForceBallistaDistance;

function CustomRuleConstructBuilding(_PlayerID, _FunctionName, ...)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:CustomRuleConstructBuilding(_PlayerID, _FunctionName, unpack(arg));
end
API.CustomRuleConstructBuilding = CustomRuleConstructBuilding;
API.RestrictBuildingCustomFunction = CustomRuleConstructBuilding;

function CustomRuleConstructRoad(_PlayerID, _FunctionName, ...)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:CustomRuleConstructRoad(_PlayerID, _FunctionName, unpack(arg));
end
API.CustomRuleConstructRoad = CustomRuleConstructRoad;
API.RestrictRoadCustomFunction = CustomRuleConstructRoad;

function CustomRuleConstructWall(_PlayerID, _FunctionName, ...)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:CustomRuleConstructWall(_PlayerID, _FunctionName, unpack(arg));
end
API.CustomRuleConstructWall = CustomRuleConstructWall;

function CustomRuleKnockdownBuilding(_PlayerID, _FunctionName, ...)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:CustomRuleKnockdownBuilding(_PlayerID, _FunctionName, unpack(arg));
end
API.CustomRuleKnockdownBuilding = CustomRuleKnockdownBuilding;
API.ProtectBuildingCustomFunction = CustomRuleKnockdownBuilding;

function WhitelistConstructTypeInArea(_PlayerID, _Type, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructTypeInArea(_PlayerID, _Type, _X, _Y, _Area);
end
API.WhitelistConstructTypeInArea = WhitelistConstructTypeInArea;

function WhitelistConstructCategoryInArea(_PlayerID, _Category, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructCategoryInArea(_PlayerID, _Category, _X, _Y, _Area);
end
API.WhitelistConstructCategoryInArea = WhitelistConstructCategoryInArea;

function WhitelistConstructTypeInTerritory(_PlayerID, _Type, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructTypeInTerritory(_PlayerID, _Type, _Territory);
end
API.WhitelistConstructTypeInTerritory = WhitelistConstructTypeInTerritory;

function WhitelistConstructCategoryInTerritory(_PlayerID, _Category, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructCategoryInTerritory(_PlayerID, _Category, _Territory);
end
API.WhitelistConstructCategoryInTerritory = WhitelistConstructCategoryInTerritory;

function BlacklistConstructTypeInArea(_PlayerID, _Type, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructTypeInArea(_PlayerID, _Type, _X, _Y, _Area);
end
API.BlacklistConstructTypeInArea = BlacklistConstructTypeInArea;
API.RestrictBuildingTypeInArea = BlacklistConstructTypeInArea;

function BlacklistConstructCategoryInArea(_PlayerID, _Category, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructCategoryInArea(_PlayerID, _Category, _X, _Y, _Area);
end
API.BlacklistConstructCategoryInArea = BlacklistConstructCategoryInArea;
API.RestrictBuildingCategoryInArea = BlacklistConstructCategoryInArea;

function BlacklistConstructTypeInTerritory(_PlayerID, _Type, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructTypeInTerritory(_PlayerID, _Type, _Territory);
end
API.BlacklistConstructTypeInTerritory = BlacklistConstructTypeInTerritory;
API.RestrictBuildingTypeInTerritory = BlacklistConstructTypeInTerritory;

function BlacklistConstructCategoryInTerritory(_PlayerID, _Category, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructCategoryInTerritory(_PlayerID, _Category, _Territory);
end
API.BlacklistConstructCategoryInTerritory = BlacklistConstructCategoryInTerritory;
API.RestrictBuildingCategoryInTerritory = BlacklistConstructCategoryInTerritory;

function WhitelistConstructRoadInArea(_PlayerID, _IsRoad, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructRoadInArea(_PlayerID, _IsRoad, _X, _Y, _Area);
end
API.WhitelistConstructRoadInArea = WhitelistConstructRoadInArea;

function WhitelistConstructWallInArea(_PlayerID, _IsWall, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructWallInArea(_PlayerID, _IsWall, _X, _Y, _Area);
end
API.WhitelistConstructWallInArea = WhitelistConstructWallInArea;

function WhitelistConstructRoadInTerritory(_PlayerID, _IsRoad, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructRoadInTerritory(_PlayerID, _IsRoad, _Territory);
end
API.WhitelistConstructRoadInTerritory = WhitelistConstructRoadInTerritory;

function WhitelistConstructWallInTerritory(_PlayerID, _IsWall, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistConstructWallInTerritory(_PlayerID, _IsWall, _Territory);
end
API.WhitelistConstructWallInTerritory = WhitelistConstructWallInTerritory;

function BlacklistConstructRoadInArea(_PlayerID, _IsRoad, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructRoadInArea(_PlayerID, _IsRoad, _X, _Y, _Area);
end
API.BlacklistConstructRoadInArea = BlacklistConstructRoadInArea;
API.RestrictStreetInArea = function(_PlayerID, _X, _Y, _Area)
    return BlacklistConstructRoadInArea(_PlayerID, true, _X, _Y, _Area);
end;
API.RestrictTrailInArea = function(_PlayerID, _X, _Y, _Area)
    return BlacklistConstructRoadInArea(_PlayerID, false, _X, _Y, _Area);
end;

function BlacklistConstructWallInArea(_PlayerID, _IsWall, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructWallInArea(_PlayerID, _IsWall, _X, _Y, _Area);
end
API.BlacklistConstructWallInArea = BlacklistConstructWallInArea;

function BlacklistConstructRoadInTerritory(_PlayerID, _IsRoad, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructRoadInTerritory(_PlayerID, _IsRoad, _Territory);
end
API.BlacklistConstructRoadInTerritory = BlacklistConstructRoadInTerritory;
API.RestrictStreetInTerritory = function(_PlayerID, _Territory)
    return BlacklistConstructRoadInTerritory(_PlayerID, true, _Territory);
end;
API.RestrictTrailInTerritory = function(_PlayerID, _Territory)
    return BlacklistConstructRoadInTerritory(_PlayerID, false, _Territory);
end;

function BlacklistConstructWallInTerritory(_PlayerID, _IsWall, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistConstructWallInTerritory(_PlayerID, _IsWall, _Territory);
end
API.BlacklistConstructWallInTerritory = BlacklistConstructWallInTerritory;

function WhitelistKnockdownTypeInArea(_PlayerID, _Type, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistKnockdownTypeInArea(_PlayerID, _Type, _X, _Y, _Area);
end
API.WhitelistKnockdownTypeInArea = WhitelistKnockdownTypeInArea;

function WhitelistKnockdownCategoryInArea(_PlayerID, _Category, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistKnockdownCategoryInArea(_PlayerID, _Category, _X, _Y, _Area);
end
API.WhitelistKnockdownCategoryInArea = WhitelistKnockdownCategoryInArea;

function WhitelistKnockdownTypeInTerritory(_PlayerID, _Type, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistKnockdownTypeInTerritory(_PlayerID, _Type, _Territory);
end
API.WhitelistKnockdownTypeInTerritory = WhitelistKnockdownTypeInTerritory;

function WhitelistKnockdownCategoryInTerritory(_PlayerID, _Category, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:WhitelistKnockdownCategoryInTerritory(_PlayerID, _Category, _Territory);
end
API.WhitelistKnockdownCategoryInTerritory = WhitelistKnockdownCategoryInTerritory;

function BlacklistKnockdownTypeInArea(_PlayerID, _Type, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistKnockdownTypeInArea(_PlayerID, _Type, _X, _Y, _Area);
end
API.BlacklistKnockdownTypeInArea = BlacklistKnockdownTypeInArea;
API.ProtectBuildingTypeInArea = BlacklistKnockdownTypeInArea;

function BlacklistKnockdownCategoryInArea(_PlayerID, _Category, _X, _Y, _Area)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistKnockdownCategoryInArea(_PlayerID, _Category, _X, _Y, _Area);
end
API.BlacklistKnockdownCategoryInArea = BlacklistKnockdownCategoryInArea;
API.ProtectBuildingCategoryInArea = BlacklistKnockdownCategoryInArea;

function BlacklistKnockdownTypeInTerritory(_PlayerID, _Type, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistKnockdownTypeInTerritory(_PlayerID, _Type, _Territory);
end
API.BlacklistKnockdownTypeInTerritory = BlacklistKnockdownTypeInTerritory;
API.ProtectBuildingTypeInTerritory = BlacklistKnockdownTypeInTerritory;

function BlacklistKnockdownCategoryInTerritory(_PlayerID, _Category, _Territory)
    assert(not IsLocalScript(), "Can not be used in local script!");
    return Lib.Construction.Global:BlacklistKnockdownCategoryInTerritory(_PlayerID, _Category, _Territory);
end
API.BlacklistKnockdownCategoryInTerritory = BlacklistKnockdownCategoryInTerritory;
API.ProtectBuildingCategoryInTerritory = BlacklistKnockdownCategoryInTerritory;

function DeleteFromProtectionList(_ID)
    assert(not IsLocalScript(), "Can not be used in local script!");
    Lib.Construction.Global:UnlistKnockdown(_ID);
end
API.DeleteProtection = DeleteFromProtectionList;
API.DeleteFromProtectionList = DeleteFromProtectionList;

function DeleteFromRestrictionList(_ID)
    assert(not IsLocalScript(), "Can not be used in local script!");
    Lib.Construction.Global:UnlistConstruction(_ID);
end
API.DeleteRestriction = DeleteFromRestrictionList;
API.DeleteFromRestrictionList = DeleteFromRestrictionList;

