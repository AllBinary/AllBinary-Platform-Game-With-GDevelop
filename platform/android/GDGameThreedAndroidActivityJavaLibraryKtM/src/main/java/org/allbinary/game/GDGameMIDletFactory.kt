
        /* Generated Code Do Not Modify */
        package org.allbinary.game




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.midlet.MIDlet
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory
import org.allbinary.midlet.MidletFactoryInterface

open public class GDGameMIDletFactory : MidletFactoryInterface {
        
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

    
                        if(GDGameMIDletFactory.SINGLETON == 
                                    null
                                )
                        
                                    {
                                    GDGameMIDletFactory.SINGLETON= GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance())
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!!.getInstance()

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameMIDletFactory.SINGLETON
}


}
                
            

