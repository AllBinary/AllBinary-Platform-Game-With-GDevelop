
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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
        package playn.core




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.canvas.Processor
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.playn.AllBinaryPlayNGame
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList
import playn.html.HtmlPlatform

open public class AllBinaryPlayNGameRunnableProcessor : Processor {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val WAITING_DEVICEFACTORY: String = "waiting on org.microemu.device.DeviceFactory to load"

    private val WAITING_BRIDGE: String = "waiting on org.microemu.MIDletBridge to load"

    private val WAITING_PLAYN_CANVAS_GRAPHICS: String = "waiting on org.microemu.device.playn.PlaynCanvasDisplayGraphics to load"

    private val WAITING: String = "waiting on AllBinaryPlayNGameRunnable to load"

    private val WAITING2: String = "waiting on OpenGLES to load"

    private val platform: HtmlPlatform

    private val list: BasicArrayList

    private val initInterface: AllBinaryPlayNGame

    val gdGameProcessor: GDGameProcessor
public constructor (platform: HtmlPlatform, gdGameProcessor: GDGameProcessor, list: BasicArrayList){
    //var platform = platform
    //var gdGameProcessor = gdGameProcessor
    //var list = list
this.logUtil!!.putF(this.toString() +":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings!!.CONSTRUCTOR)
this.platform= platform
this.list= list
this.gdGameProcessor= gdGameProcessor
this.initInterface= AllBinaryPlayNGame(this.platform, GDGameMidletFactory(), this, true)
this.initInterface!!.updateRate= this.initInterface!!.waitFrameRate
}


    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(!this.isDeviceFactoryLoaded())
                        
                                    {
                                    this.logUtil!!.putF(WAITING_DEVICEFACTORY, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(!this.isMIDletBridgeLoaded())
                        
                                    {
                                    this.logUtil!!.putF(WAITING_BRIDGE, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(!this.isPlaynCanvasDisplayGraphicsLoaded())
                        
                                    {
                                    this.logUtil!!.putF(WAITING_PLAYN_CANVAS_GRAPHICS, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(!this.isAllBinaryPlayNGameRunnableReady())
                        
                                    {
                                    this.logUtil!!.putF(WAITING, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(!this.isOpenGLESPackageLoaded())
                        
                                    {
                                    this.logUtil!!.putF(WAITING2, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.logUtil!!.putF(this.commonStrings!!.START +this.list.size(), this, this.commonStrings!!.PROCESS)

    
                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!!.putF(this.commonStrings!!.EXCEPTION +":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings!!.PROCESS)

                                    }
                                

    var gameRunnable: Any = this.createGameRunnable(this.list)!!

this.initInterface!!.setUsedRunnable(gameRunnable)
this.logUtil!!.putF(this.commonStrings!!.INIT +this.list.size(), this, this.commonStrings!!.PROCESS)
this.gdGameProcessor!!.setInitInterface(this.initInterface)
this.initInterface!!.setLoadGameRunnableProcessor(this.gdGameProcessor)
}


    open fun isDeviceFactoryLoaded()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isMIDletBridgeLoaded()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isPlaynCanvasDisplayGraphicsLoaded()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isAllBinaryPlayNGameRunnableReady()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isOpenGLESPackageLoaded()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun createGameRunnable(list: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: Any
                //native - START
                {
                    
                }



                //native - END
                

}
                
            

