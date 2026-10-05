
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
        package org.allbinary.game.canvas




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.game.canvas.GDGameMenuPaintable
import javax.microedition.lcdui.CommandListener
import org.allbinary.game.init.GDGameStaticInitializerFactory
import org.allbinary.game.layer.GDGameLayerManager
import org.allbinary.logic.communication.log.PreLogUtil
import org.allbinary.game.GameInfo
import org.allbinary.game.GameMode
import org.allbinary.game.GameTypeFactory
import org.allbinary.game.PlayerTypesFactory
import org.allbinary.game.configuration.GameSpeed
import org.allbinary.game.displayable.canvas.DemoCanvas
import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.paint.ColorFillPaintableFactory
import org.allbinary.game.score.BasicHighScoresFactory
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.form.FormPaintable
import org.allbinary.graphics.paint.NullInitUpdatePaintable
import org.allbinary.graphics.paint.NullPaintable
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

open public class GDGameStartCanvas : DemoCanvas {
        

    private val WAIT: Int = ((GameSpeed.getInstance()!!.getDelay() *3) shr 1)
public constructor (abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener)                        

                            : super(abeClientInformation, commandListener, BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()), NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(), GDGameStaticInitializerFactory(), false){
    //var abeClientInformation = abeClientInformation
    //var commandListener = commandListener


                            //For kotlin this is before the body of the constructor.
                    
this.setWait(this.WAIT)
GD0SpecialAnimation.getInstance(this, 
                            null)
}


                @Throws(Exception::class)
            
    override fun initPostPaint()
        //nullable = true from not(false or (false and true)) = true
{
this.setBasicGameDemoPaintable(GDGameMenuPaintable(FormPaintable(this.getMenuForm())))
this.setSpecialAnimationInterface(GD0SpecialAnimation.getInstance())
this.setDefaultPaintableInterface(ColorFillPaintableFactory.getInstance()!!.getInstance(BasicColorFactory.getInstance()!!.RED, false))
}


    override fun getNextRandom()
        //nullable = true from not(false or (false and true)) = true
: Int{
PreLogUtil.put("******************Demo Next Random Is Always 1", this, "getNextRandom")



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 1
}


                @Throws(Exception::class)
            
    override fun createGameLayerManager(randomValue: Int)
        //nullable = true from not(false or (false and false)) = true
: AllBinaryGameLayerManager{
var randomValue = randomValue

    var gameInfo: GameInfo = GameInfo(GameTypeFactory.getInstance()!!.BOT, GameMode.SERVER, PlayerTypesFactory.getInstance()!!.PLAYER_TYPE_ONE, GDGameLayerManager.MAX_LEVEL, randomValue)




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameLayerManager(
                            null, 
                            null, gameInfo)
}


                @Throws(Exception::class)
            
    override fun createRunnable(randomValue: Int)
        //nullable = true from not(false or (false and false)) = true
: GameCanvasRunnableInterface{
var randomValue = randomValue



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameGameCanvas(this.abeClientInformation, this.createGameLayerManager(this.getNextRandom()))
}


}
                
            

