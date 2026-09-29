/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2011 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
/* Generated Code Do Not Modify */
import { HelpPaintable } from '../../../../org/allbinary/game/paint/help/HelpPaintable.js';
//not GWT import const HelpPaintable
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameHelpPaintable extends HelpPaintable {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDGameHelpPaintable.SINGLETON;
    }
    constructor() {
        super("Help Screen", BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().RED);
        //For kotlin this is before the body of the constructor.
        this.setInputInfoP([
            "Line 1", "Line 2"
        ]);
    }
}
GDGameHelpPaintable.SINGLETON = new GDGameHelpPaintable();
