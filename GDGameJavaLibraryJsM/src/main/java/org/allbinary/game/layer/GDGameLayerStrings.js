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
import { Object } from '../../../../java/lang/Object.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameLayerStrings extends Object {
    constructor() {
        super(...arguments);
        this.ADD_FORCE_AL = "AddForceUsingPolarCoordinates";
        this.LENGTH = "length: ";
        this.MULTIPLE_TIMES = "Attempting to add to cache more than 1 time: ";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDGameLayerStrings.instance;
    }
}
GDGameLayerStrings.instance = new GDGameLayerStrings();
