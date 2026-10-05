
        /* Generated Code Do Not Modify */
        package org.allbinary.graphics.threed.min3d




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.khronos.opengles.GL10
import min3d.core.TextureManager
import min3d.vos.Camera
import min3d.vos.OffsetTargetXCamera
import min3d.vos.OffsetTargetXCameraFactory
import min3d.vos.light.Light
import org.allbinary.AndroidUtil
import org.allbinary.game.GameTypeFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.communication.log.PreLogUtil
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.game.canvas.GDGameThreedLevelBuilder
import org.allbinary.game.layer.CameraLayer
import org.allbinary.game.layer.GDGameLayerManager
import org.allbinary.game.layer.SimpleUserFollowCameraLayer
import org.allbinary.game.resource.GDThreedEarlyResourceInitializationFactory
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.graphics.RectangleFactory
import org.allbinary.graphics.opengles.OpenGLCapabilities
import org.allbinary.graphics.threed.min3d.renderer.AllBinaryToMin3dRendererFactory
import org.allbinary.logic.math.MathData
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.system.os.OperatingSystemFactory
import org.allbinary.logic.system.os.OperatingSystemInterface
import org.allbinary.string.CommonSeps
import org.allbinary.view.ViewPosition

open public class GDGameSceneController : AllBinaryGameSceneController {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val TAG: String = "GDGameSceneController"

    private val openGLCapabilities: OpenGLCapabilities = OpenGLCapabilities.getInstance()!!

    private val gameThreedLevelBuilderFactory: GDGameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance()!!

    private val cameraInputProcessor: GDCameraInputProcessor = object: GDCameraInputProcessor()
                                {
                                
    override fun process(gdGameCameraSetup: GDGameCameraSetup)
        //nullable = true from not(false or (false and false)) = true
{
var gdGameCameraSetup = gdGameCameraSetup
}

                                }
                            
public constructor ()                        

                            : super(AllBinaryToMin3dRendererFactory(), OffsetTargetXCameraFactory(), AllBinarySceneFactory(), true, true){


                            //For kotlin this is before the body of the constructor.
                    
PreLogUtil.put(this.commonStrings!!.START, this.TAG, this.commonStrings!!.CONSTRUCTOR)
}


    private var initialized: Boolean= false

    val portion: Int = 100

    val loadingString: String = this.toString() +" Loading: "

    var index: Int= 0

    override fun initScene(gl: GL10)
        //nullable = true from not(false or (false and false)) = true
{
    //var gl = gl

        try {
            PreLogUtil.put(this.commonStrings!!.START, this, this.sceneStrings!!.INIT_SCENE)
this.index= 1

    var glInstanceVersion: String = this.openGLCapabilities!!.glInstanceVersion


    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!!

progressCanvas!!.addEarlyPortion(this.portion, this.loadingString, this.index++)

    
                        if(!this.initialized)
                        
                                    {
                                    
    var resourceInitialization: ResourceInitialization = (GDThreedEarlyResourceInitializationFactory.getInstance()!!.list.get(0) as ResourceInitialization)

resourceInitialization!!.init()
progressCanvas!!.addEarlyPortion(this.portion, this.loadingString, this.index++)
this.processLighting()

    var camera: Camera = this.scene.getCamera()!!

camera.frustum.horizontalCenter(0.5f)
camera.frustum.verticalCenter(0.5f)
this.initialized= true

                                    }
                                
                        else {
                            TextureManager.getInstance()!!.reset(gl)

                        }
                            
progressCanvas!!.addEarlyPortion(this.portion, this.loadingString, this.index++)

    var gdGameThreedLevelBuilder: GDGameThreedLevelBuilder


    var size: Int = this.gameThreedLevelBuilderFactory!!.list.size()!!





                        for (index in 0 until size)

        {
gdGameThreedLevelBuilder= (this.gameThreedLevelBuilderFactory!!.list.get(index) as GDGameThreedLevelBuilder)
gdGameThreedLevelBuilder!!.build(gl, glInstanceVersion)
}

progressCanvas!!.addEarlyPortion(this.portion, this.loadingString, this.index++)
PreLogUtil.put(this.commonStrings!!.END, this, this.sceneStrings!!.INIT_SCENE)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, this.sceneStrings!!.INIT_SCENE, e)
}

}


    private var cameraLayer: CameraLayer

                @Throws(Exception::class)
            
    override fun buildScene(layerManager: AllBinaryGameLayerManager)
        //nullable = true from not(false or (false and false)) = true
{
    //var layerManager = layerManager

        try {
            PreLogUtil.put(this.commonStrings!!.START, this, this.sceneStrings!!.BUILD_SCENE)

    var gdLayerManager: GDGameLayerManager = layerManager as GDGameLayerManager


    var gdGameCameraSetup: GDGameCameraSetup = (this.gameThreedLevelBuilderFactory!!.cameraList!!.get(gdLayerManager!!.layout) as GDGameCameraSetup)


    var camera: Camera = this.scene.getCamera()!!


    
                        if(gdGameCameraSetup!!.type == GDGameCameraSetup.FOLLOW)
                        
                                    {
                                    this.scene.reset()

    var vehicleCamera: OffsetTargetXCamera = this.scene.getCamera() as OffsetTargetXCamera


    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!!.getOperatingSystemInstance()!!


    var distance: Int = if(operatingSystem!!.isOverScan()) {
                            
                            (if(AndroidUtil.isAndroid()) {
                            
                            550
                        
                            } else {
                            650
                            }
    )
                        
                            } else {
                            
                                        //Otherwise - expression - elseExpr - EnclosedExpr

                            }
    

this.cameraLayer= SimpleUserFollowCameraLayer(vehicleCamera, RectangleFactory.SINGLETON, ViewPosition.getInstanceD(), distance, distance, distance)

    
                        if(layerManager!!.getGameInfo()!!.getGameType() != GameTypeFactory.getInstance()!!.BOT)
                        
                                    {
                                    vehicleCamera!!.setOffsetY(10f)

                                    }
                                
                        else {
                            vehicleCamera!!.setOffsetY(8f)

                        }
                            
this.cameraLayer!!.updateCamera()

                                    }
                                

    var stringMaker: StringMaker = StringMaker()

gdGameCameraSetup!!.processTarget(this.cameraLayer, camera)
gdGameCameraSetup!!.process(camera, stringMaker)
camera.cameraSetup= gdGameCameraSetup
camera.updateFrustrum()

    
                        if(gdGameCameraSetup!!.type == GDGameCameraSetup.FOLLOW)
                        
                                    {
                                    this.cameraLayer!!.processTick(layerManager)
layerManager!!.append(this.cameraLayer)

                                    }
                                
this.cameraInputProcessor!!.process(gdGameCameraSetup)
camera.position.append(stringMaker)
stringMaker!!.append(CommonSeps.getInstance()!!.DASH)!!.append(MathData.getInstance()!!.GREATER_THAN)
camera.target.getPosition()!!.append(stringMaker)
PreLogUtil.put(stringMaker!!.toString(), this, this.sceneStrings!!.BUILD_SCENE)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, this.sceneStrings!!.BUILD_SCENE, e)
}

}


    open fun processLighting()
        //nullable = true from not(false or (false and true)) = true
{

    var light: Light = Light()


    
                        if(this.scene.getLights()!!.size() > 0)
                        
                                    {
                                    this.scene.getLights()!!.reset()

                                    }
                                
this.scene.getLights()!!.add(light)
}


    open fun processEarlyGameAction()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun processStartGameAction()
        //nullable = true from not(false or (false and true)) = true
{
}


    private val NAME: String = "GDGame Scene"

    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.NAME
}


}
                
            

