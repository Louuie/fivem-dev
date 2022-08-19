RegisterCommand("hello", function ()
    msg("refreshed?")
end, false)


-- RegisterCommand("spawnveh", function (source, args)
--     spawnVehicle(args[1])
-- end, false)

RegisterCommand("teleport", function (source, args)
    teleportToWaypoint()
end)