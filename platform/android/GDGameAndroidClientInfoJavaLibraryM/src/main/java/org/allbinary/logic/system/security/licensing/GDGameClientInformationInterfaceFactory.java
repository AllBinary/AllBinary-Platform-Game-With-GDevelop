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
    
    public ClientInformation getInstance()
    {
        return GDGameAndroidMobileClientInformation.instance;
    }
}
