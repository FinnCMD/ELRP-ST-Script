RegisterCommand("weapon", function(_, args)
    if (args[1] == nil) then 
        TriggerEvent("chat:addMessage", "^1Please give a valid weapon name.");
        return false; 
    end
    local weapon_name = args[1];

    local weapon_hash = GetHashKey("weapon_" .. weapon_name);
    if not IsWeaponValid(weapon_hash) then
        TriggerEvent("chat:addMessage", "^6\'" .. weapon_name .. "\' ^1is not a valid weapon!");
        return false;
    end

    if (HasPedGotWeapon(PlayerPedId(), weapon_hash, 0)) then
        TriggerEvent("chat:addMessage", "^1Ped already has a ^4" .. weapon_name .. "^1!");
        return false;
    end

    GiveWeaponToPed(PlayerPedId(), weapon_hash, 999999, 0, 1);
    TriggerEvent("chat:addMessage", "^6Gave ped a ^4" .. weapon_name .. "^6!");
end)

RegisterCommand("removeweapon", function(_, args)
    if (args[1] == nil) then
        RemoveAllPedWeapons(PlayerPedId(), 0);
        TriggerEvent("chat:addMessage", "^2Removed all ped weapons!");
        return false;
    end
    local weapon_name = args[1];

    local weapon_hash = GetHashKey("weapon_" .. weapon_name);
    if not IsWeaponValid(weapon_hash) then
        TriggerEvent("chat:addMessage", "^4\'" .. weapon_name .. "\' ^1is not a valid weapon!");
        return false;
    end

    if (not HasPedGotWeapon(PlayerPedId(), weapon_hash, 0)) then
        TriggerEvent("chat:addMessage", "^1Ped doesn't have a ^4" .. weapon_name .. "^1!");
        return false;
    end

    RemoveWeaponFromPed(PlayerPedId(), weapon_hash);
    TriggerEvent("chat:addMessage", "^2Removed ^4" .. weapon_name .. "^2 from ped!");
end)