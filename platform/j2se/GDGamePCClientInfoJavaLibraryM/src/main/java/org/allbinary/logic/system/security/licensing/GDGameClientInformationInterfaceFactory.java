/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
*/
package org.allbinary.logic.system.security.licensing;

public class GDGameClientInformationInterfaceFactory extends ClientInformationFactory
{
    private static final ClientInformationFactory instance = new GDGameClientInformationInterfaceFactory();

    /**
     * @return the instance
     */
    public static ClientInformationFactory getFactoryInstance() {
        return instance;
    }
    
    private ClientInformation clientInformation;

    public ClientInformation getInstance()
    {
        if(this.clientInformation == null) {
            clientInformation = new GDGamePCClientInformation();
        }
        return clientInformation;
    }
}
