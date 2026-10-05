
        /*
                *  
                *  Copyright 2010 The PlayN Authors 
                *  
                *  Licensed under the Apache License, Version 2.0 (the "License"); you may not 
                *  use this file except in compliance with the License. You may obtain a copy of 
                *  the License at 
                *  
                *  http://www.apache.org/licenses/LICENSE-2.0 
                *  
                *  Unless required by applicable law or agreed to in writing, software 
                *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
                *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
                *  License for the specific language governing permissions and limitations under  the License.  
        */
        
        /* Generated Code Do Not Modify */
        package playn.core




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.thread.DisplayThreadPool
import org.allbinary.thread.SecondaryThreadPool
import org.allbinary.thread.EmuThreadPool
import org.allbinary.graphics.opengles.CurrentDisplayableFactory
import org.allbinary.thread.ThreadPool
import org.microemu.device.DeviceFactory
import org.microemu.device.playn.PlaynDevice
import playn.core.PlayN
import playn.core.util.Callback
//null.nullMethod()
open public class SoundTestGame
            : Object
        
                , Game
                , Keyboard.Listener {
        
companion object {
            
    private val NUM_STARS: Int = 10

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var gameLayer: SurfaceLayer

    private var touchVectorX: Float= 0.0f
private var touchVectorY: Float= 0.0f

    private var sound: Sound

    override fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var graphics: Graphics = PlayN.graphics()!!

graphics.setSize(800, 600)
this.gameLayer= graphics.createSurfaceLayer(graphics.width(), graphics.height())
graphics.rootLayer()!!.add(this.gameLayer)
PlayN.keyboard()!!.setListener(this)
PlayN.pointer()!!.setListener(object: Pointer.Listener()
                                {
                                
    override fun onPointerEnd(event: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
touchVectorX= touchVectorY= 0
}

    override fun onPointerDrag(event: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
touchMove(event.x(), event.y())
}

    override fun onPointerStart(event: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
touchMove(event.x(), event.y())
}

                                }
                            )
DeviceFactory.setDevice(PlaynDevice())
}


    override fun onKeyTyped(event: Keyboard.TypedEvent)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
PlayN.log()!!.debug("key typed")
}


    override fun onKeyDown(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
PlayN.log()!!.debug("key down")
}


    override fun onKeyUp(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
PlayN.log()!!.debug("key up")

        try {
            
    
                        if(this.sound == 
                                    null
                                )
                        
                                    {
                                    this.sound= PlayN.assetManager()!!.getSound("/wav/select")

                                    }
                                
} catch(e: Exception)
            {
PlayN.log()!!.error(CommonStrings.getInstance()!!.EXCEPTION, e)
}


    
                        if(!this.sound.isPlaying())
                        
                                    {
                                    PlayN.log()!!.debug("play sound")
this.sound.play()

                                    }
                                
}


    private val currentDisplayableFactory: CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance()!!

    private val primaryThreadPool: EmuThreadPool = DisplayThreadPool.getInstance()!!

    private val secondaryThreadPool: ThreadPool = SecondaryThreadPool.getInstance()!!

    private var isCrashed: Boolean = false

    override fun update(delta: Float)
        //nullable = true from not(false or (false and false)) = true
{
var delta = delta

        try {
            } catch(e: Exception)
            {
this.isCrashed= true
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, CommonStrings.getInstance()!!.UPDATE, e)
}

}


    override fun paint(alpha: Float)
        //nullable = true from not(false or (false and false)) = true
{
var alpha = alpha

    var surface: Surface = this.gameLayer!!.surface()!!

surface.clear()
}


    open fun touchMove(x: Float, y: Float)
        //nullable = true from not(false or (false and false)) = true
{
var x = x
var y = y

    var cx: Float = PlayN.graphics()!!.screenWidth() /2


    var cy: Float = PlayN.graphics()!!.screenHeight() /2

this.touchVectorX= (x -cx) *1.0f /cx
this.touchVectorY= (y -cy) *1.0f /cy
}


    open fun post(payload: String)
        //nullable = true from not(false or (false and false)) = true
{
var payload = payload
PlayN.net()!!.post("/rpc", payload, object: Callback<String>()
                                {
                                
    override fun onSuccess(response: String)
        //nullable = true from not(false or (false and false)) = true
{
var response = response
}

    override fun onFailure(error: Throwable)
        //nullable = true from not(false or (false and false)) = true
{
var error = error
}

                                }
                            )
}


    override fun updateRate()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 42
}


}
                
            

