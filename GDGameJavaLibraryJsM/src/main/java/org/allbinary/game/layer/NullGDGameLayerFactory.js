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
import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
//not GWT import const GDObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameLayerFactory } from './GDGameLayerFactory.js';
//not GWT import - same folder const GDGameLayer
export class NullGDGameLayerFactory extends GDGameLayerFactory {
    constructor() {
        super(null, null, null, null, null, null, null, null, false);
        //For kotlin this is before the body of the constructor.
    }
    create(gdObject) {
        throw new RuntimeException();
    }
}
