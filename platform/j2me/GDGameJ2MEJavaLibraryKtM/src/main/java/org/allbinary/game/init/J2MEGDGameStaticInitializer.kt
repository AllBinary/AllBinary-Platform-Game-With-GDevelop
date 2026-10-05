
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
        package org.allbinary.game.init




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import javax.microedition.lcdui.CommandListener
import org.allbinary.game.configuration.GDGameGameFeatures
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

open public class J2MEGDGameStaticInitializer : GDGameStaticInitializer {
        

    private var platformGameInitialized: Boolean= false
public constructor (resourceInitializationArray: Array<ResourceInitialization?>, portion: Int)                        

                            : super(resourceInitializationArray, portion){
var resourceInitializationArray = resourceInitializationArray
var portion = portion


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    override fun initKey(portion: Int)
        //nullable = true from not(false or (false and false)) = true
{
var portion = portion
super.initKey(portion)
}


                @Throws(Exception::class)
            
    override fun init(abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener, level: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var abeClientInformation = abeClientInformation
    //var commandListener = commandListener
    //var level = level
super.init(abeClientInformation, commandListener, level)

    
                        if(this.isPlatformGameInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.setPlatformGameInitialized(true)
ProgressCanvasFactory.getInstance()!!.addNormalPortion(50, "Game Options")
GDGameGameFeatures().
                            init()
}


    open fun setPlatformGameInitialized(platformGameInitialized: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var platformGameInitialized = platformGameInitialized
this.platformGameInitialized= platformGameInitialized
}


    open fun isPlatformGameInitialized()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.platformGameInitialized
}


}
                
            

