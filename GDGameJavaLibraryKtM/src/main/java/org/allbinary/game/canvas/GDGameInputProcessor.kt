
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        package org.allbinary.game.canvas




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.Animation
import org.allbinary.animation.special.SpecialAnimation
import org.allbinary.game.input.GameInputStrings
import org.allbinary.game.input.PlayerGameInput
import org.allbinary.game.input.PlayerInput
import org.allbinary.game.input.event.GameKeyEvent
import org.allbinary.layer.AllBinaryLayerManager
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDGameInputProcessor
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val gameInputStrings: GameInputStrings = GameInputStrings.getInstance()!!

    private val gameKeyEventList: BasicArrayList = BasicArrayListD()

    private val removalGameKeyEventList: BasicArrayList = BasicArrayListD()

    private val keyEventList: BasicArrayList = BasicArrayListD()

    private val removalKeyEventList: BasicArrayList = BasicArrayListD()

    private val playerGameInput: PlayerGameInput = PlayerInput(this.keyEventList, this.removalKeyEventList, this.gameKeyEventList, this.removalGameKeyEventList, 0)

                @Throws(Exception::class)
            
    open fun process(allbinaryLayerManager: AllBinaryLayerManager, specialAnimation: Animation)
        //nullable = true from not(false or (false and false)) = true
{
    //var allbinaryLayerManager = allbinaryLayerManager
    //var specialAnimation = specialAnimation

    
                        if(specialAnimation == SpecialAnimation.getInstance())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var globals: GDSceneGlobals = 
                                    (specialAnimation as GDSpecialAnimation).getGlobals()!!


    var gameKeyEvent: GameKeyEvent


    var size: Int = this.gameKeyEventList!!.size()!!





                        for (index in 0 until size)

        {
gameKeyEvent= this.gameKeyEventList!!.get(index) as GameKeyEvent
globals.inputProcessorArray[gameKeyEvent!!.getKey()]!!.processEvent(allbinaryLayerManager, gameKeyEvent)
}


    var size2: Int = this.removalGameKeyEventList!!.size()!!





                        for (index in 0 until size2)

        {
gameKeyEvent= this.removalGameKeyEventList!!.get(index) as GameKeyEvent
globals.inputProcessorArray[gameKeyEvent!!.getKey()]!!.processReleasedEvent(allbinaryLayerManager, gameKeyEvent)
}


    var keyAsInteger: Integer


    var size3: Int = this.keyEventList!!.size()!!


    
                        if(size3 > 0)
                        
                                    {
                                    keyAsInteger= this.keyEventList!!.get(0) as Integer
globals.anyKeyProcessorArray[0]!!.process(allbinaryLayerManager, keyAsInteger)

                                    }
                                




                        for (index in 0 until size3)

        {
keyAsInteger= this.keyEventList!!.get(index) as Integer
globals.unmappedInputProcessorArray[keyAsInteger!!.toInt()]!!.process(allbinaryLayerManager, keyAsInteger)
}


    var size4: Int = this.removalKeyEventList!!.size()!!





                        for (index in 0 until size4)

        {
keyAsInteger= this.removalKeyEventList!!.get(index) as Integer
globals.unmappedInputProcessorArray[keyAsInteger!!.toInt()]!!.processReleased(allbinaryLayerManager, keyAsInteger)
}

this.processInput(allbinaryLayerManager)
}


                @Throws(Exception::class)
            
    open fun processInput(allbinaryLayerManager: AllBinaryLayerManager)
        //nullable = true from not(false or (false and false)) = true
{
var allbinaryLayerManager = allbinaryLayerManager

        try {
            this.playerGameInput!!.update()
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.putF(commonStrings!!.EXCEPTION, this, this.gameInputStrings!!.PROCESS_INPUT)
}

}


    open fun getPlayerGameInput()
        //nullable = true from not(false or (false and true)) = true
: PlayerGameInput{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.playerGameInput
}


    open fun getGameKeyEventList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameKeyEventList
}


}
                
            

