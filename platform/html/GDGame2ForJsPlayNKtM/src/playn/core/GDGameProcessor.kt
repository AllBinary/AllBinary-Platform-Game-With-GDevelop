
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */
        package playn.core




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.canvas.Processor
import org.allbinary.init.Init
import org.allbinary.init.InitInterface
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.playn.AllBinaryPlayNGame
import org.allbinary.playn.processors.GameHtmlHasLoadedResourcesProcessor
import org.allbinary.playn.processors.GameHtmlLoadResourcesProcessor
import org.allbinary.playn.processors.MidletStartupProcessor
import org.allbinary.playn.processors.StringArrayFactory
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList

open public class GDGameProcessor : Processor {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val NULL_INIT: InitInterface = Init()

    private val list: BasicArrayList

    private var initInterface: InitInterface = this.NULL_INIT

    private var alreadyDone: Boolean = false
public constructor (list: BasicArrayList){
    //var list = list
this.logUtil!!.putF(this.toString() +":GDGameProcessor", this, this.commonStrings!!.CONSTRUCTOR)
this.list= list
}


    open fun setInitInterface(initInterface: InitInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var initInterface = initInterface
this.logUtil!!.putF("setInitInterface", this, this.commonStrings!!.PROCESS)
this.initInterface= initInterface
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.alreadyDone)
                        
                                    {
                                    this.logUtil!!.putF("already done", this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.initInterface == this.NULL_INIT)
                        
                                    {
                                    this.logUtil!!.putF("waiting for set InitInterface", this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.logUtil!!.putF(this.commonStrings!!.START +this.list.size(), this, this.commonStrings!!.PROCESS)

    
                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!!.putF(this.commonStrings!!.EXCEPTION +":GDGameProcessor", this, this.commonStrings!!.PROCESS)

                                    }
                                
this.logUtil!!.putF("GDGamesModuleReadyProcessor - setDevice", this, this.commonStrings!!.INIT)
this.setDevice()

    var miniSpaceWarsModuleReadyProcessor: GDGameModuleReadyProcessor = GDGameModuleReadyProcessor(this.initInterface, this.list)

this.list.add(miniSpaceWarsModuleReadyProcessor)
this.logUtil!!.putF(this.commonStrings!!.ADD +"GDGamesModuleReadyProcessor" +this.list.size(), this, this.commonStrings!!.PROCESS)
this.alreadyDone= true
(this.initInterface as AllBinaryPlayNGame).setLoadGameRunnableProcessor(miniSpaceWarsModuleReadyProcessor)
this.initInterface= this.NULL_INIT

    
                        if(GDGameHtmlLoadResourcesProcessorFactory.isTouch())
                        
                                    {
                                    
    var stringArrayFactory: StringArrayFactory = GDGameHtmlLoadResourcesProcessorFactory.getInstance()!!

this.list.add(GameHtmlLoadResourcesProcessor(this.list, stringArrayFactory))
this.logUtil!!.putF(this.commonStrings!!.ADD +"GameHtmlLoadResourcesProcessor" +this.list.size(), this, this.commonStrings!!.PROCESS)

    var gameHtmlHasLoadedResourcesProcessor: Processor = GameHtmlHasLoadedResourcesProcessor(this.list, stringArrayFactory)

this.list.add(gameHtmlHasLoadedResourcesProcessor)
this.logUtil!!.putF(this.commonStrings!!.ADD +"GameHtmlHasLoadedResourcesProcessor" +this.list.size(), this, this.commonStrings!!.PROCESS)

                                    }
                                
this.list.add(MidletStartupProcessor(this.list))
this.logUtil!!.putF(this.commonStrings!!.ADD +"MidletStartupProcessor" +this.list.size(), this, this.commonStrings!!.PROCESS)
GDGameHtmlLoadResourcesProcessorFactory.loading()
}


    open fun setDevice()
        //nullable = true from not(false or (false and true)) = true

                //native - START
                {
                    
                }



                //native - END
                

}
                
            

