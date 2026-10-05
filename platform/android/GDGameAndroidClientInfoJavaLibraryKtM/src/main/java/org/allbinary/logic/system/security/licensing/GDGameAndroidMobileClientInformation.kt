
        /* Generated Code Do Not Modify */
        package org.allbinary.logic.system.security.licensing




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.string.CommonSeps

open public class GDGameAndroidMobileClientInformation : MobileClientInformation {
        
companion object {
            
    val instance: GDGameAndroidMobileClientInformation = GDGameAndroidMobileClientInformation()

        }
            public constructor ()                        

                            : super(GDGameSoftwareInfo.getInstance()!!.getName() +ANDROID_DESC, GDGameSoftwareInfo.getInstance()!!.getVersion(), GDGameSoftwareInfo.getInstance()!!.getName() +ANDROID_DESC +CommonSeps.getInstance()!!.SPACE +GDGameSoftwareInfo.getInstance()!!.getVersion(), GDGameSoftwareInfo.getInstance()!!.toShortString()){


                            //For kotlin this is before the body of the constructor.
                    
}


}
                
            

