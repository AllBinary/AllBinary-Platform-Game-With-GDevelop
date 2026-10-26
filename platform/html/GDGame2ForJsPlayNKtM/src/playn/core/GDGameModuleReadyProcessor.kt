
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
import org.allbinary.init.InitInterface
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.playn.AllBinaryPlayNGame
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList

open public class GDGameModuleReadyProcessor : Processor {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val initInterface: InitInterface

    private val list: BasicArrayList
public constructor (initInterface: InitInterface, list: BasicArrayList){
    //var initInterface = initInterface
    //var list = list
this.logUtil!!.putF(this.toString() +":GDGameModuleReadyProcessor", this, this.commonStrings!!.CONSTRUCTOR)
this.initInterface= initInterface
this.list= list
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{
this.logUtil!!.putF(this.commonStrings!!.START +":GDGameModuleReadyProcessor", this, this.commonStrings!!.PROCESS)

    
                        if(this.isGDGameReady() && this.isTouchButtonShieldActionResourceReady() && this.isAllBinaryMidletReady())
                        
                                    {
                                    this.logUtil!!.putF(this.commonStrings!!.END +this.list.size(), this, this.commonStrings!!.PROCESS)

    
                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!!.putF(this.commonStrings!!.EXCEPTION +":GDGameModuleReadyProcessor", this, this.commonStrings!!.PROCESS)

                                    }
                                
this.initInterface!!.init()
(this.initInterface as AllBinaryPlayNGame).setLoadGameRunnableProcessor(Processor.getInstance())

                                    }
                                
}


    open fun isGDGameReady()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isTouchButtonShieldActionResourceReady()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

    open fun isAllBinaryMidletReady()
        //nullable = true from not(false or (false and true)) = true
: Boolean
                //native - START
                {
                    
                }



                //native - END
                

}
                
            

