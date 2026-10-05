
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
        package org.allbinary.game.layer.behavior




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.util.BasicArrayList

open public class DestroyOutsideBehavior : GDBehavior {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!!

    override fun process(gameLayerList: BasicArrayList, index: Int, graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameLayerList = gameLayerList
    //var index = index
    //var graphics = graphics

    var gameLayer: GDGameLayer = gameLayerList!!.get(index) as GDGameLayer


    var gdObject: GDObject = gameLayer!!.gdObject


    
                        if(gdObject == 
                                    null
                                )
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

    
                        if(gdObject!!.x > this.SceneWindowWidth() +gdObject!!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(gdObject!!.y > this.SceneWindowHeight() +gdObject!!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(gdObject!!.y <  -gdObject!!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(gdObject!!.x <  -gdObject!!.Height(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun SceneWindowWidth()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!!.getLastWidth()
}


    open fun SceneWindowHeight()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!!.getLastHeight()
}


}
                
            

