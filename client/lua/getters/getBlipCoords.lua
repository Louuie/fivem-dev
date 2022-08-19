function getBlipCoords()
    if GetFirstBlipInfoId( 8 ) ~= 0 then
        local waypointBlip = GetFirstBlipInfoId( 8 )  
        local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Ctizien.ResultAsVector())
        return coord.x, coord.y, coord.z
    else
        msg("Error you have no waypoint set to teleport too!")
    end
end