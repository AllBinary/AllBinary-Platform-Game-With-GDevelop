/*
        *
        *  To change this template, choose Tools | Templates  and open the template in the editor.
*/
/* Generated Code Do Not Modify */
import { FlagGameResources } from '../../../../org/allbinary/game/layer/waypoint/FlagGameResources.js';
//not GWT import const FlagGameResources
//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDFlagResources extends FlagGameResources {
    static getInstance() {
        if (GDFlagResources.instance == NullUtil.getInstance().NULL_OBJECT) {
            GDFlagResources.instance = new GDFlagResources();
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDFlagResources.instance;
    }
    constructor() {
        super();
        let ROOT = "/gd_flag";
        ;
        let SMALL = "_64_by_64.png";
        ;
        let MEDIUM = SMALL;
        ;
        let SIZE_FOUR = SMALL;
        ;
        let SIZE_FIVE = SMALL;
        ;
        let SIZE_SIX = SMALL;
        ;
        let SIZE = [
            SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX
        ];
        ;
        super.init(ROOT, SIZE);
        this.NAME = "Player Waypoint";
    }
}
GDFlagResources.instance = NullUtil.getInstance().NULL_OBJECT;
