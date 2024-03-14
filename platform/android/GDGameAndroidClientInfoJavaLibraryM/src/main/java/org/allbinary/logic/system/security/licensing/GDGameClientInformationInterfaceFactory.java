package org.allbinary.logic.system.security.licensing;

public class GDGameClientInformationInterfaceFactory
{
    private static final AbeClientInformationInterface SINGLETON = 
        new GDGameAndroidMobileClientInformation();

    public static AbeClientInformationInterface getInstance()
    {
        return SINGLETON;
    }
}
