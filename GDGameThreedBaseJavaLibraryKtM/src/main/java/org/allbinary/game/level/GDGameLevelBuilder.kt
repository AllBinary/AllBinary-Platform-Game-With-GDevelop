
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
        package org.allbinary.game.level




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.layer.LayerInterfaceFactory
import org.allbinary.layer.LayerInterfaceVisitor

open public class GDGameLevelBuilder
            : Object
        
                , LayerInterfaceVisitor {
        

    private val layerManager: AllBinaryGameLayerManager
public constructor (layerManager: AllBinaryGameLayerManager)
            : super()
        {
    //var layerManager = layerManager
this.layerManager= layerManager
}


                @Throws(Exception::class)
            
    open fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var layerInterfaceFactory: LayerInterfaceFactory = LayerInterfaceFactory.getInstance()!!

layerInterfaceFactory!!.init()

    var artificialIntelligenceInterfaceFactoryInterfaceFactory: ArtificialIntelligenceInterfaceFactoryInterfaceFactory = ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance()!!

artificialIntelligenceInterfaceFactoryInterfaceFactory!!.clear()
}


                @Throws(Exception::class)
            
    open fun build()
        //nullable = true from not(false or (false and true)) = true
{
}


                @Throws(Exception::class)
            
    open fun visit(layerInterface: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
{
var layerInterface = layerInterface
layerInterface!!.setVisible(true)
this.layerManager!!.append(layerInterface)
}


}
                
            

