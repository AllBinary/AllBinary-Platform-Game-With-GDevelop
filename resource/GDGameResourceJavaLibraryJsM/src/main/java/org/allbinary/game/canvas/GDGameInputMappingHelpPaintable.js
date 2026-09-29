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
//not GWT import const Graphics
import { GDGameGameInputMappingFactory } from '../../../../org/allbinary/game/gd/input/GDGameGameInputMappingFactory.js';
//not GWT import const HelpPaintable
import { InputMappingHelpPaintable } from '../../../../org/allbinary/game/paint/help/InputMappingHelpPaintable.js';
//not GWT import const InputMappingHelpPaintable
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameInputMappingHelpPaintable extends InputMappingHelpPaintable {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDGameInputMappingHelpPaintable.SINGLETON;
    }
    constructor() {
        super(GDGameGameInputMappingFactory.getInstance().get(), BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().YELLOW);
        //For kotlin this is before the body of the constructor.
    }
    paintXY(graphics, x, y) {
    }
    paintThreedXYZ(graphics, x, y, z) {
    }
    //@Throws(Exception.constructor)
    nextFrame() {
    }
}
GDGameInputMappingHelpPaintable.SINGLETON = new GDGameInputMappingHelpPaintable();
