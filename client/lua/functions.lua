function msg(msg)
    TriggerEvent("chat:addMessage", {
      color = {255,0,0},
      multiline = true,
      args = {"[Server]:", msg}
    })  
  end

function givePlayerWeapon(hash)
  buttonSeq = true
  buttonPressed = false
  while buttonSeq do
    Citizen.Wait(1)
    if IsControlJustPressed(1, 74) then
      buttonPressed = true
      buttonSeq = false
    end
  end
    while buttonPressed and buttonSeq == false do
      ped = GetPlayerPed(-1)
      Citizen.Wait(1)
      GiveWeaponToPed(ped, GetHashKey(hash), 200, false, true)
      buttonPressed = false
    end
    msg("fixed event")

    SetEntityAsNoLongerNeeded(ped)
end

-- function spawnVehicle(vehicle)
--    local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0,5)
--    if vehicle == nil then vehicle = "adder" end
--    RequestModel(vehicle)

--    while not HasModelLoaded(vehicle) do
--     Citizen.Wait(100)
--     print("client took to long to create the v")
--     break
--    end

--    local cvehicle = CreateVehicle(vehicle, pos, GetEntityHeading(PlayerPedId() + 10), true, false)

--    SetEntityAsNoLongerNeeded(cvehicle)

--    SetModelAsNoLongerNeeded(vehicle)
-- end

function teleportToWaypoint()
  if GetFirstBlipInfoId( 8 ) ~= 0 then
    local waypointBlip = GetFirstBlipInfoId( 8 )  
    local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector())
    StartPlayerTeleport(PlayerId(), coord, 0.0, false, true, true)
    while IsPlayerTeleportActive() do 
      Citizen.Wait(5)
    end
  else
    msg("Error you have no waypoint set to teleport too!")
  end 
end
