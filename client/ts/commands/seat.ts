export const seat = (): void => {
    // change seat in vehicle
    RegisterCommand("seat", async (source: number, args : string[]) => {
        const [seat] = args;
        const vehicle = GetVehiclePedIsIn(PlayerPedId(), false);
        if (vehicle == 0) console.log('the ped isnt in a vehicle!');
        
        SetPedIntoVehicle(PlayerPedId(), vehicle, parseInt(seat));
        SetEntityAsNoLongerNeeded(vehicle);
    }, false);

    // command emit
    emit("chat:addSuggestion", "/seat", "swaps to a new seat if a player is in a vehicle", [
    {
        name: "Seat Index", 
        help: "Swaps to a new seat if a player is in a vehicle"
    }
]);
};

