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
//Current folder imports from return types, extended types, and scope (deduplicated)
import { ClientInformationFactory } from './ClientInformationFactory.js';
//not GWT import - same folder const ClientInformationFactory
import { GDGamePCClientInformation } from './GDGamePCClientInformation.js';
//not GWT import - same folder const ClientInformation
export class GDGameClientInformationInterfaceFactory extends ClientInformationFactory {
    static getFactoryInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDGameClientInformationInterfaceFactory.instance;
    }
    getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDGamePCClientInformation.instance;
    }
}
GDGameClientInformationInterfaceFactory.instance = new GDGameClientInformationInterfaceFactory();
