
        /* Generated Code Do Not Modify */
        package org.allbinary.logic.system.security.licensing




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class GDGameClientInformationInterfaceFactory : ClientInformationFactory {
        
companion object {
            
    private val instance: ClientInformationFactory = GDGameClientInformationInterfaceFactory()

    open fun getFactoryInstance()
        //nullable = true from not(false or (false and true)) = true
: ClientInformationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: ClientInformation{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAndroidMobileClientInformation.instance
}


}
                
            

