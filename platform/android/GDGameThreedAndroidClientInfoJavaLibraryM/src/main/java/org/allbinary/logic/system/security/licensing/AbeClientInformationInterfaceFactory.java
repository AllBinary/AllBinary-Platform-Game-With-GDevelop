package org.allbinary.logic.system.security.licensing;

public class AbeClientInformationInterfaceFactory
{
    private static final AbeClientInformationInterface SINGLETON = 
        new GDGameAndroidMobileClientInformation();

    public static AbeClientInformationInterface getInstance()
    {
        return SINGLETON;
    }
}
