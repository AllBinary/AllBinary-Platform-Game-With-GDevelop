
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
        package org.allbinary.logic.system.security.licensing




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.string.CommonSeps
import org.allbinary.game.canvas.GDGameSoftwareInfo

open public class GDGamePCClientInformation : AbeClientInformation {
        
companion object {
            
    val instance: GDGamePCClientInformation = GDGamePCClientInformation()

    private val PC_DESC: String = "PC"

        }
            public constructor ()                        

                            : super(GDGameSoftwareInfo.getInstance()!!.getName() +GDGamePCClientInformation.PC_DESC, GDGameSoftwareInfo.getInstance()!!.getVersion(), GDGameSoftwareInfo.getInstance()!!.getName() +GDGamePCClientInformation.PC_DESC +CommonSeps.getInstance()!!.SPACE +GDGameSoftwareInfo.getInstance()!!.getVersion(), GDGameSoftwareInfo.getInstance()!!.toShortString()){


                            //For kotlin this is before the body of the constructor.
                    
}


}
                
            

