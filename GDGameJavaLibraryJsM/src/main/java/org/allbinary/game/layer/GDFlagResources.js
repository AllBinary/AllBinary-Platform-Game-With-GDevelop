/*
        *
        *  To change this template, choose Tools | Templates  and open the template in the editor.
*/
/* Generated Code Do Not Modify */
import { FlagGameResources } from '../../../../org/allbinary/game/layer/waypoint/FlagGameResources.js';
//not GWT import const FlagGameResources
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDFlagResources extends FlagGameResources {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDFlagResources.SINGLETON;
    }
    constructor() {
        super();
        var ROOT = "/gd_flag";
        ;
        var SMALL = "_64_by_64.png";
        ;
        var MEDIUM = SMALL;
        ;
        var SIZE_FOUR = SMALL;
        ;
        var SIZE_FIVE = SMALL;
        ;
        var SIZE_SIX = SMALL;
        ;
        var SIZE = [
            SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX
        ];
        ;
        super.init(ROOT, SIZE);
        this.NAME = "Player Waypoint";
    }
}
GDFlagResources.SINGLETON = new GDFlagResources();
