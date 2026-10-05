
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
        package org.allbinary.game




        import java.lang.Object        
        
        import java.lang.Runnable
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.midlet.DemoGameMidlet
import org.allbinary.game.midlet.DemoGameMidletEvent
import org.allbinary.game.midlet.DemoGameMidletEventHandler
import org.allbinary.game.midlet.DemoGameMidletStateFactory
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.graphics.displayable.command.MyCommandsFactory
import org.allbinary.string.CommonLabels
//Similar to DemoRunnable
open public class StartRunnable
            : Object
        
                , Runnable {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val demoGameMidlet: DemoGameMidlet

    private val startDemoGameMidletEvent: DemoGameMidletEvent
public constructor (demoGameMidlet: DemoGameMidlet)
            : super()
        {
var demoGameMidlet = demoGameMidlet
this.demoGameMidlet= demoGameMidlet
this.startDemoGameMidletEvent= DemoGameMidletEvent(this.demoGameMidlet, DemoGameMidletStateFactory.getInstance()!!.START_DEMO)
}


    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            this.logUtil!!.putF(CommonLabels.getInstance()!!.START_LABEL +"GameCanvasRunnableInterface", this, this.commonStrings!!.RUN)
this.demoGameMidlet!!.commandAction(MyCommandsFactory.getInstance()!!.SET_DISPLAYABLE, ProgressCanvasFactory.getInstance())
this.demoGameMidlet!!.setGameCanvasRunnableInterface(this.demoGameMidlet!!.createDemoGameCanvasRunnableInterface())
this.demoGameMidlet!!.demoSetup()
DemoGameMidletEventHandler.getInstance()!!.fireEvent(this.startDemoGameMidletEvent)
this.demoGameMidlet!!.startGameCanvasRunnableInterface()
this.demoGameMidlet!!.postDemoSetup()
this.logUtil!!.putF(this.commonStrings!!.END_RUNNABLE, this, this.commonStrings!!.RUN)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, this.commonStrings!!.RUN, e)
}

}


}
                
            

