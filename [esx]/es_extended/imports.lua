ESX = exports['es_extended']:getSharedObject()

if not IsDuplicityVersion() then -- Only register this event for the client
    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        ESX.PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        ESX.PlayerLoaded = false
    end)
end
