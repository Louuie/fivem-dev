import { seat } from "./seat";
import { spawnveh } from "./spawnveh";

// Handler function that executes all active commands
export const Handler = ():void => {
    seat(); spawnveh();
};