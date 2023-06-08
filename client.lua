ESX = exports["es_extended"]:getSharedObject()
textUiStatus = false
uiOpend = false

local coords = {
    vector3(150, -1040.795654, 29.364136),
    vector3(215.630768, -809.525269, 30.7288882)
}

RegisterCommand('real', function(source, args) 
    local data = {
        model = 'gb200',
        coords = vector3(215.630768, -809.525269, 30.7288882),
        plate = 'ESX'
    }

    ESX.TriggerServerCallback('ug_garage:spawnVehicle', function(status)
        if status then 
            print(true)
        else 
            print(false)
        end
    end, data)
end)

Citizen.CreateThread(function()
    while true do

        for i, v in ipairs(coords) do

            local source = GetPlayerPed(-1)
            local playerCoordsData = GetEntityCoords(source)
            local playerCoords = vector3(playerCoordsData.x, playerCoordsData.y,playerCoordsData.z)
            local garageCoords = v
            local distance = #(playerCoords - garageCoords)

            if distance < 1 then
                if textUiStatus == false then
                    exports['okokTextUI']:Open('[E] to enter', 'darkblue', 'right')
                    textUiStatus = true
                elseif textUiStatus == true then 
                    if uiOpend then 
                        exports['okokTextUI'].Close()
                        textUiStatus = false
                    end
                end

                if IsControlJustReleased(0, 51) then
                    ESX.TriggerServerCallback('ug_garage:getOwnedVehicles', function(vehicles)
                        print(data)
                        SetNuiFocus(true, true)
                        SendNUIMessage({open = true, data = vehicles})
                        uiOpend = true
                    end)
                end
            else
                exports['okokTextUI'].Close()
                textUiStatus = false
            end
        end

        Citizen.Wait(0)
    end
end)

RegisterNUICallback('close', function(data)
    SetNuiFocus(false, false)
    SendNUIMessage({open = false})
    uiOpend = false
end)
