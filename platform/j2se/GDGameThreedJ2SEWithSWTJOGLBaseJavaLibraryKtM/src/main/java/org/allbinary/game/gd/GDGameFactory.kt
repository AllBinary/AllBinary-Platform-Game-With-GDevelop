
        /* Generated Code Do Not Modify */
        package org.allbinary.game.gd




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.midlet.MIDlet
import org.allbinary.game.GDGameMIDlet
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory
import org.allbinary.midlet.MidletFactoryInterface

open public class GDGameFactory : MidletFactoryInterface {
        
companion object {
            
    private var SINGLETON: MIDlet = 
                null
            

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: MIDlet{

    
                        if(GDGameFactory.SINGLETON == 
                                    null
                                )
                        
                                    {
                                    GDGameFactory.SINGLETON= GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance())

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameFactory.SINGLETON
}


}
                
            

