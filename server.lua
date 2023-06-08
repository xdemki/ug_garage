ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("ug_garage:getOwnedVehicles", function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @id', { ['@id'] = "char1:43d6edbf95f185226913c6f2e45ad31caf113ac5" }, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('ug_garage:spawnVehicle', function(source, cb, data)

    local model = data.model
    local coords = data.coords
    local properties = { 
        plate = data.plate
    }

    ESX.OneSync.SpawnVehicle(model, coords, 0, properties)
    cb(true)
end)