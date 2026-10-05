
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
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.graphics.color.BasicColorFactory
import java.io.InputStream
import org.allbinary.media.image.ImageModifierUtil
import org.microemu.device.Device
import org.microemu.device.DeviceFactory
import org.microemu.device.playn.PlaynDevice
import org.microemu.device.playn.PlaynSurfaceDisplayGraphics
import playn.core.PlayN.graphics
import playn.core.PlayN.keyboard
import playn.core.PlayN.net
import playn.core.PlayN.pointer
import playn.core.util.Callback
//http://localhost:8080/minispacewarvector-html-1.0-SNAPSHOT/
open public class GraphicsTestGame
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
        
    private var gameLayer: SurfaceLayer

    private var touchVectorX: Float= 0.0f
private var touchVectorY: Float= 0.0f

    private var device: Device

    private var graphics: javax.microedition.lcdui.Graphics

    private var originalImage: javax.microedition.lcdui.Image

    private var imageArray: Array<javax.microedition.lcdui.Image?> = arrayOfNulls(1)

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
this.device= DeviceFactory.getDevice()
this.graphics= PlaynSurfaceDisplayGraphics(this.gameLayer!!.surface())
this.graphics.setColor(BasicColorFactory.getInstance()!!.WHITE.toInt())

        try {
            
    var inputStream: InputStream = ResourceUtil.getInstance()!!.getResourceAsStream("/locked_demo_game_feature_64_by_64.png")!!


    var image: javax.microedition.lcdui.Image = javax.microedition.lcdui.Image.createImage(inputStream)!!

this.originalImage= this.imageArray[0]= image
ImageModifierUtil.getInstanceOrCreate()!!.handleImage(this.imageArray, 0, image)
} catch(e: Exception)
            {
PlayN.log()!!.error(CommonStrings.getInstance()!!.EXCEPTION, e)
}

}


    override fun onKeyTyped(event: Keyboard.TypedEvent)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
}


    override fun onKeyDown(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
}


    override fun onKeyUp(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
var event = event
}


    override fun update(delta: Float)
        //nullable = true from not(false or (false and false)) = true
{
var delta = delta
}


    private val aChar: Char = 'Z'

    private val charArray: CharArray = charArrayOf('A','l','l','B','i','n','a','r','y')

    private val string: String = "AllBinary"

    var falling: Boolean = true

    var alpha: Float = 1

    override fun paint(alpha: Float)
        //nullable = true from not(false or (false and false)) = true
{
var alpha = alpha

    var surface: Surface = this.gameLayer!!.surface()!!

surface.clear()
this.graphics.drawLine(0, 0, 100, 100)
this.graphics.drawLine(100, 0, 0, 100)
this.graphics.drawRect(200, 200, 233, 50)
this.graphics.fillRect(300, 300, 233, 50)
this.graphics.drawArc(100, 100, 40, 40, 0, 360)
this.graphics.fillArc(150, 150, 30, 30, 0, 360)
this.graphics.drawImage(this.imageArray[0]!!, 20, 50, 0)

    
                        if(this.falling)
                        
                                    {
                                    alpha -= .01

                                    }
                                
                        else {
                            alpha += .01

                        }
                            

    
                        if(alpha <= 0)
                        
                                    {
                                    this.falling= false

                                    }
                                
                             else 
    
                        if(alpha >= 1)
                        
                                    {
                                    this.falling= true

                                    }
                                
ImageModifierUtil.getInstanceOrCreate()!!.setAlpha(this.originalImage, this.imageArray[0]!!, 0, (alpha *255).toInt())
}


    open fun touchMove(x: Float, y: Float)
        //nullable = true from not(false or (false and false)) = true
{
var x = x
var y = y

    var cx: Float = PlayN.graphics()!!.screenWidth() /2


    var cy: Float = PlayN.graphics()!!.screenHeight() /2

touchVectorX= (x -cx) *1.0f /cx
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
                        return 33
}


}
                
            

