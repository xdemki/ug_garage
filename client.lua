ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        
    end
end)

RegisterCommand('real', function (source, args)
    local _source = source 
    SetNuiFocus(true, true)
    SendNUIMessage({ open = true })
end)