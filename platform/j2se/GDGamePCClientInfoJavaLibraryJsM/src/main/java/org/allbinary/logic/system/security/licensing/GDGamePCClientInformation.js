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
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
import { GDGameSoftwareInfo } from '../../../../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo
//Current folder imports from return types, extended types, and scope (deduplicated)
import { AbeClientInformation } from './AbeClientInformation.js';
//not GWT import - same folder const AbeClientInformation
export class GDGamePCClientInformation extends AbeClientInformation {
    constructor() {
        super(GDGameSoftwareInfo.getInstance().getName() + GDGamePCClientInformation.PC_DESC, GDGameSoftwareInfo.getInstance().getVersion(), GDGameSoftwareInfo.getInstance().getName() + GDGamePCClientInformation.PC_DESC + CommonSeps.getInstance().SPACE + GDGameSoftwareInfo.getInstance().getVersion(), GDGameSoftwareInfo.getInstance().toShortString());
        //For kotlin this is before the body of the constructor.
    }
}
GDGamePCClientInformation.instance = new GDGamePCClientInformation();
GDGamePCClientInformation.PC_DESC = "PC";
