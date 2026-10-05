
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
        
import javax.microedition.lcdui.CommandListener
import javax.microedition.lcdui.Font
import javax.microedition.lcdui.Graphics
import org.allbinary.game.init.GDGameStaticInitializerFactory
import org.allbinary.game.state.GameStateFactory
import org.allbinary.input.accelerometer.AccelerometerSensorFactory
import org.allbinary.input.gyro.AllBinaryOrientationSensor
import org.allbinary.input.gyro.GyroSensorFactory
import org.allbinary.media.audio.GDGameSoundsFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.logic.string.StringUtil
import org.allbinary.ai.OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer
import org.allbinary.game.GameInfo
import org.allbinary.game.GameTypeFactory
import org.allbinary.game.IntermissionFactory
import org.allbinary.game.collision.OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer
import org.allbinary.game.combat.canvas.CombatGameCanvas
import org.allbinary.game.configuration.GameSpeed
import org.allbinary.game.configuration.event.ChangedGameFeatureListener
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeature
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.TouchFeatureFactory
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
import org.allbinary.game.displayable.canvas.GamePerformanceInitUpdatePaintable
import org.allbinary.game.displayable.canvas.StartIntermissionPaintable
import org.allbinary.game.input.OptimizedGameInputLayerProcessorForCollidableLayer
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.PlayerGameInputGameLayer
import org.allbinary.game.layer.identification.GroupLayerManagerListener
import org.allbinary.game.score.BasicHighScoresFactory
import org.allbinary.game.state.GameState
import org.allbinary.game.tick.OptimizedTickableLayerProcessor
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.graphics.displayable.command.MyCommandsFactory
import org.allbinary.input.motion.button.BaseTouchInput
import org.allbinary.input.motion.button.GDGameNeededTouchButtonsBuilder
import org.allbinary.input.motion.button.GDGameTouchButtonsBuilder
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
import org.allbinary.media.AllBinaryVibration
import org.allbinary.media.audio.AllBinaryMediaManager
import org.allbinary.media.audio.PlayerQueue
import org.allbinary.media.audio.PrimaryPlayerQueueFactory
import org.allbinary.media.audio.SecondaryPlayerQueueFactory
import org.allbinary.time.TimeDelayHelper

open public class GDGameGameCanvas : AllBinaryGameCanvas {
        

    private val WAIT: Int = GameSpeed.getInstance()!!.getDelay()!!

    private val portion: Int = 4

    private val abeClientInformation: AbeClientInformationInterface
public constructor (abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener, allBinaryGameLayerManager: AllBinaryGameLayerManager)                        

                            : super(commandListener, allBinaryGameLayerManager, BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()), GDGameStaticInitializerFactory(), false){
    //var abeClientInformation = abeClientInformation
    //var commandListener = commandListener
    //var allBinaryGameLayerManager = allBinaryGameLayerManager


                            //For kotlin this is before the body of the constructor.
                    
this.abeClientInformation= abeClientInformation
}

public constructor (abeClientInformation: AbeClientInformationInterface, allBinaryGameLayerManager: AllBinaryGameLayerManager)                        

                            : this(abeClientInformation, 
                            null, allBinaryGameLayerManager){
    //var abeClientInformation = abeClientInformation
    //var allBinaryGameLayerManager = allBinaryGameLayerManager


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun initSpecialPaint()
        //nullable = true from not(false or (false and true)) = true
{
super.initSpecialPaint()

open class GDStartIntermissionPaintable : StartIntermissionPaintable {
        
 constructor (combatGameCanvas: AllBinaryGameCanvas)                        

                            : super(combatGameCanvas, arrayOf(StringUtil.getInstance()!!.EMPTY_STRING), BasicColorFactory.getInstance()!!.RED, Font.getDefaultFont()){
    //var combatGameCanvas = combatGameCanvas


                            //For kotlin this is before the body of the constructor.
                    
this.lineYOffsetArray= intArrayOf(0)
}


}
                
            

                    //Otherwise - statement - EmptyStmt

this.setStartIntermissionPaintable(GDStartIntermissionPaintable(this))
}


                @Throws(Exception::class)
            
    override fun mediaInit()
        //nullable = true from not(false or (false and true)) = true
{
logUtil!!.putF(commonStrings!!.START, this, "mediaInit")
AllBinaryMediaManager.init(GDGameSoundsFactory.getInstance())
}


                @Throws(Exception::class)
            
    override fun updateTouch()
        //nullable = true from not(false or (false and true)) = true
{

    var gameInfo: GameInfo = this.gameLayerManager!!.getGameInfo()!!


    
                        if(gameInfo!!.getGameType() != GameTypeFactory.getInstance()!!.BOT)
                        
                                    {
                                    
    var nextTouchInputFactory: BaseTouchInput = GDGameTouchButtonsBuilder.getInstance(this.getSensorGameUpdateProcessor())!!


    
                        if(Features.getInstance()!!.isFeature(TouchFeatureFactory.getInstance()!!.AUTO_HIDE_SHOW_SCREEN_BUTTONS))
                        
                                    {
                                    
    
                        if(gameInfo!!.getCurrentLevel() -getStartLevel() >= 1)
                        
                                    {
                                    nextTouchInputFactory= GDGameNeededTouchButtonsBuilder.getInstance(this.getSensorGameUpdateProcessor())

                                    }
                                

                                    }
                                
this.updateCurrentTouchInputFactory(nextTouchInputFactory)

                                    }
                                
}


                @Throws(Exception::class)
            @Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun initConfigurable(abeClientInformation: AbeClientInformationInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var abeClientInformation = abeClientInformation

        try {
            
    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!!


    
                        if(ChangedGameFeatureListener.getInstance()!!.isChanged())
                        
                                    {
                                    super.initConfigurable(abeClientInformation)
progressCanvas!!.addNormalPortion(portion, "Group Manager")
GroupLayerManagerListener.getInstance()!!.init(3)
AllBinaryVibration.init()
ChangedGameFeatureListener.getInstance()!!.setChanged(false)

    
                        if(!this.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

                                    }
                                
                        else {
                            progressCanvas!!.addNormalPortion(4, "Skipping Configurable")

                        }
                            
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, "initConfigurable", e)
}

}


                @Throws(Exception::class)
            
    override fun threadInit()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var portion: Int = 60

super.initApp(abeClientInformation)

    
                        if(!this.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(!this.isInitialized())
                        
                                    {
                                    
    
                        if(!this.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!!

progressCanvas!!.addNormalPortion(portion, "Main Processors")
this.setWait(WAIT)
this.loadState()

    var list: BasicArrayList = BasicArrayListD()


    var features: Features = Features.getInstance()!!


    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!!


    
                        if(features.isFeature(gameFeatureFactory!!.ARTIFICIAL_INTELLEGENCE_PROCESSOR))
                        
                                    {
                                    list.add(OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer())

                                    }
                                

    
                        if(features.isFeature(gameFeatureFactory!!.GAME_INPUT_LAYER_PROCESSOR))
                        
                                    {
                                    list.add(OptimizedGameInputLayerProcessorForCollidableLayer())

                                    }
                                

    
                        if(features.isFeature(gameFeatureFactory!!.COLLIDABLE_INTERFACE_LAYER_PROCESSOR))
                        
                                    {
                                    list.add(OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer())

                                    }
                                

    
                        if(features.isFeature(gameFeatureFactory!!.TICKABLE_LAYER_PROCESSOR))
                        
                                    {
                                    list.add(OptimizedTickableLayerProcessor())

                                    }
                                
gameLayerManager!!.setLayerProcessorList(list)
progressCanvas!!.addNormalPortion(portion, "Initializing Game")

                                    }
                                
this.buildGameInit(false)
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, "_init", e)
}

}


                @Throws(Exception::class)
            
    override fun buildGameInit(isProgress: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var isProgress = isProgress
this.loadResources(gameLayerManager!!.getGameInfo()!!.getCurrentLevel())

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!!


    var portion: Int = 30


    
                        if(isProgress && this.isMainCanvas())
                        
                                    {
                                    progressCanvas!!.start()
this.getCustomCommandListener()!!.commandAction(MyCommandsFactory.getInstance()!!.SET_DISPLAYABLE, progressCanvas)
portion= 4

                                    }
                                
PrimaryPlayerQueueFactory.getInstance()!!.clear()
SecondaryPlayerQueueFactory.getInstance()!!.clear()
gameLayerManager!!.cleanup()

    
                        if(!this.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
progressCanvas!!.addNormalPortion(portion, "Building Game Level")
progressCanvas!!.addNormalPortion(portion, "Set Background")

    
                        if(!this.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
gameLayerManager!!.append(PlayerGameInputGameLayer(0))
progressCanvas!!.addNormalPortion(portion, "Ending Custom Build")

    
                        if(gameLayerManager!!.getGameInfo()!!.getGameType() != GameTypeFactory.getInstance()!!.BOT)
                        
                                    {
                                    
                                    }
                                
super.buildGame(portion)
this.getStartIntermissionInterface()!!.setEnabled(true)
this.getEndLevelIntermissionInterface()!!.setEnabled(false)
this.setGameState(this.gameStateFactory!!.PLAYING_GAME_STATE)
}


                @Throws(Exception::class)
            
    override fun setGameState(gameState: GameState)
        //nullable = true from not(false or (false and false)) = true
{
var gameState = gameState
super.setGameState(gameState)

    var intermissionFactory: IntermissionFactory = IntermissionFactory.getInstance()!!


    
                        if(this.getGameState() == this.gameStateFactory!!.PLAYING_GAME_STATE)
                        
                                    {
                                    this.setMainStateProcessor(this.getProcessGameProcessor())

                                    }
                                
                             else 
    
                        if(this.getGameState() == intermissionFactory!!.WAIT_LEVEL_INTERMISSION_GAME_STATE || this.getGameState() == intermissionFactory!!.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE || this.getGameState() == intermissionFactory!!.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE)
                        
                                    {
                                    
                                    }
                                
                        else {
                            this.setMainStateProcessor(this.getProcessGameProcessor())

                        }
                            
}


    private val gamePerformanceInitUpdatePaintable: GamePerformanceInitUpdatePaintable = GamePerformanceInitUpdatePaintable()

    private val gyroOrientationSensor: AllBinaryOrientationSensor = GyroSensorFactory.getInstance()!!

    private val accelerometerOrientationSensor: AllBinaryOrientationSensor = AccelerometerSensorFactory.getInstance()!!

    open fun draw(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
var graphics = graphics
this.clear(graphics)
this.basicSetColorUtil!!.setBasicColorP(graphics, gameLayerManager!!.getForegroundBasicColor())
gameLayerManager!!.paint(graphics, 0, 0)
nonBotPaintable!!.paint(graphics)
gameSpecificPaintable!!.paint(graphics)
gamePerformanceInitUpdatePaintable!!.paint(graphics)
touchPaintable!!.paint(graphics)
screenCapture!!.saveFrame()

    var halfHeight: Int = GameTickDisplayInfoSingleton.getInstance()!!.getLastHalfHeight()!!

graphics.drawString(this.gyroOrientationSensor!!.toString(), 0, halfHeight +30 +60, 0)
graphics.drawString(this.accelerometerOrientationSensor!!.toString(), 0, halfHeight +30 +75, 0)
this.getTouchPaintableP()!!.paint(graphics)
}


    private var playerTimeDelayHelper: TimeDelayHelper = TimeDelayHelper(2000)

    private val primaryPlayerQueue: PlayerQueue = PrimaryPlayerQueueFactory.getInstance()!!

    private val secondaryPlayerQueue: PlayerQueue = SecondaryPlayerQueueFactory.getInstance()!!

    private val features: Features = Features.getInstance()!!

    private val soundGameFeature: GameFeature = GameFeatureFactory.getInstance()!!.SOUND

                @Throws(Exception::class)
            
    open fun processGame()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(playerTimeDelayHelper!!.isTimeTNT())
                        
                                    {
                                    
    
                        if(this.features.isFeature(soundGameFeature))
                        
                                    {
                                    
                                    }
                                

                                    }
                                
super.processGame()
this.gamePerformanceInitUpdatePaintable!!.update()
}


}
                
            

