
        /* Generated Code Do Not Modify */

        


















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { ClientInformationFactory } from './ClientInformationFactory.js';
//not GWT import - same folder const ClientInformationFactory
import { GDGameAndroidMobileClientInformation } from './GDGameAndroidMobileClientInformation.js';
//not GWT import - same folder const GDGameAndroidMobileClientInformation
import { ClientInformation } from './ClientInformation.js';
//not GWT import - same folder const ClientInformation

export class GDGameClientInformationInterfaceFactory extends ClientInformationFactory {
        

    private static readonly instance: ClientInformationFactory = new GDGameClientInformationInterfaceFactory();

    public static getFactoryInstance(): ClientInformationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    public getInstance(): ClientInformation{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAndroidMobileClientInformation.instance;
    
}


}



