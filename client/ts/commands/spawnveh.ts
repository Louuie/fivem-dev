import { Delay } from '../utils/delay';

export const spawnveh = ():void => {
    // spawn vehicle 
    RegisterCommand("spawnveh", async (source: number, args : string[]) => {
        const [model] = args;
        const modelHash = GetHashKey(model);
    
        RequestModel(modelHash);
    
        while (!HasModelLoaded(modelHash)) await Delay(100);
    
        const [x, y, z] = GetEntityCoords(PlayerPedId(), true);
        const heading = GetEntityHeading(PlayerPedId());
    
        const vehicle = CreateVehicle(modelHash, x, y, z, heading, true, true);
    
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1);
    
        SetEntityAsNoLongerNeeded(vehicle);
        SetModelAsNoLongerNeeded(model);
    }, false);

    // command emit
    emit("chat:addSuggestion", "/spawnveh", "spawns a vehicle", [
        {
            name: "Model", 
            help: "Spawns a vehicle of the player's choice"
        }
    ]);
};