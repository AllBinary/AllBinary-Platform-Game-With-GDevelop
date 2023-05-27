package org.allbinary.graphics.threed.min3d;

import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import javax.microedition.khronos.opengles.GL10;
import min3d.core.Object3d;
import min3d.core.TextureManager;
import min3d.vos.CameraFactory;
import min3d.vos.light.Light;
import org.allbinary.game.canvas.GD1GameThreedLevelBuilder;
import org.allbinary.game.input.threed.CameraMotionGestureInputProcessor;
import org.allbinary.game.resource.GDThreedEarlyResourceInitializationFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLCapabilities;

import org.allbinary.graphics.threed.min3d.renderer.AllBinaryToMin3dRendererFactory;

public class GDGameSceneController 
extends AllBinaryGameSceneController
{
    private final String TAG = "GDGameSceneController";

    private final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();

    public GDGameSceneController()
    {
        super(new AllBinaryToMin3dRendererFactory(), new CameraFactory(), new AllBinarySceneFactory(), true);
        
        PreLogUtil.put(CommonStrings.getInstance().START, TAG, CommonStrings.getInstance().CONSTRUCTOR);
    }

    private boolean initialized;

    final int portion = 100;
    final String loadingString = this.toString() + " Loading: ";
    int index;
    
    //private final TextureListFactory textureListFactory = TextureListFactory.getInstance();
    //private final Min3dSceneResourcesFactory min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance();

    @Override
    public void initScene(final GL10 gl)
    {
        final String METHOD_NAME = "initScene";

        try
        {
            PreLogUtil.put(CommonStrings.getInstance().START, this, METHOD_NAME);

            index = 1;

            final String glInstanceVersion = openGLCapabilities.glInstanceVersion;
            
            final ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();
            
            progressCanvas.addEarlyPortion(portion, loadingString, index++);
            
            //When I can get resources fixed for opengl then I reload without loading models again.
            //Lights and resources don't need to be added again
            if(!this.initialized)
            {
                ((ResourceInitialization) GDThreedEarlyResourceInitializationFactory.getInstance().list.get(0)).init();
                              
                progressCanvas.addEarlyPortion(portion, loadingString, index++);

                final Light light = new Light();

                light.ambient.setAll(128, 128, 128, 128);
                light.ambient.commitToFloatBuffer();

                if (scene.getLights().size() > 0) {
                    scene.getLights().reset();
                }

                scene.getLights().add(light);

            scene.getCamera().frustum.horizontalCenter(0.5f);
            scene.getCamera().frustum.verticalCenter(0.5f);
                
              //PreLogUtil.put(, this, METHOD_NAME);
              
              this.initialized = true;
            }
            else
            {
                TextureManager.getInstance().reset(gl);
            }

            progressCanvas.addEarlyPortion(portion, loadingString, index++);
            
            new GD1GameThreedLevelBuilder().build(gl, glInstanceVersion);
            
            progressCanvas.addEarlyPortion(portion, loadingString, index++);

            PreLogUtil.put(CommonStrings.getInstance().END, this, METHOD_NAME);                
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, METHOD_NAME, e));
        }
    }

    //private CameraLayer cameraLayer;
    
    public void buildScene(final AllBinaryGameLayerManager layerManager) throws Exception
    {
        try
        {
            PreLogUtil.put(CommonStrings.getInstance().START, this, "buildScene");

            //Reset the scene
            //scene.reset();


            //scene.getCamera()
            //scene.getCamera().target = object3d;

//            if(cameraLayer == null)
//            {
//            	//1130 uses 2100 additive
//            	//2176 is used since no camera sway
//            	final int distance = CameraUtil.getInstance().getDistanceBasedOn(1130);
//            	
//                cameraLayer = new CameraLayer(
//                		//new SwayCameraLayer( 
//                        //new SimpleVehicleFollowCameraLayer( 
//                       //new SimpleFollowCameraLayer(
//                       //new ExampleRotateAroundTargetCameraLayer(
//                       //new ExampleLockedCameraLayer(
//                				scene.getCamera(), 
//                           RectangleFactory.SINGLETON, 
//                           new ViewPosition(),
//                           distance, distance, distance);
//
//                //cameraLayer.setRotationX(90);
//            	//cameraLayer.setRotationY((short) 90);
//                //cameraLayer.setRotationZ(90);
//            	
//                NullTargetFactory.getInstance().setTarget(scene);
//                
//                //this.adjustObject3dGameLayer = AdjustableObject3dOrientationGameLayer.getInstance();
//            }
//            else
//            {
//            	cameraLayer.getGameKeyEventList().clear();
//            	//this.adjustObject3dGameLayer.getGameKeyEventList().clear();
//            }
//
//            cameraLayer.updateCamera();
//            //cameraLayer.processTick(layerManager);
//            layerManager.append(cameraLayer);

            //scene.getCamera().position
            scene.getCamera().target = new Object3d(0, 0);
            final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
            
            //x is height, y is distance from game area, z is width
            //MyCanvas aLastWidth: 385 aLastHeight: 639 Display Info: fullWidth: 1440 fullHeight: 2392 lastWidth: 385 lastHeight: 639 lastHalfWidth: 192 lastHalfHeight: 319
            //319.0, 900.0, -639.0->319.0, 0.0, -629.0
            //319.0, 815.0, -779.0->319.0, -625.0, -629.0
            
//            scene.getCamera().position.x = displayInfoSingleton.getLastHalfHeight();
//            scene.getCamera().position.y = 900;
//            scene.getCamera().position.z = -displayInfoSingleton.getLastHeight();
//
//            scene.getCamera().target.getPosition().x = displayInfoSingleton.getLastHalfHeight();
//            scene.getCamera().target.getPosition().y = 0;
//            scene.getCamera().target.getPosition().z = -displayInfoSingleton.getLastHeight() + 10;

            final int totalDistance = displayInfoSingleton.getLastHeight() + 180;
            scene.getCamera().position.x = displayInfoSingleton.getLastHalfHeight();
            scene.getCamera().position.y = totalDistance;
            scene.getCamera().position.z = -displayInfoSingleton.getLastHeight() - 100;

            scene.getCamera().target.getPosition().x = displayInfoSingleton.getLastHalfHeight();
            scene.getCamera().target.getPosition().y = -totalDistance;
            scene.getCamera().target.getPosition().z = -displayInfoSingleton.getLastHeight() + 10;

            //CameraMotionGestureInputProcessor.getInstance().add(scene);

//    humanEvilKittyLayer = new HumanTestGameDemoLayer(
//            null, new VelocityProperties(0, 0),
//            BasicGroupFactory.getInstance().GOOD,
//            animationInterfaceFactoryInterfaceArray,
//            //NullThreedAnimationFactory.getFactoryInstance(),
//            //new ThreedAnimationFactory(object3dContainer),
//            //new TestChildThreedCompositeInputProcessor(cameraLayer),
//             new SelectCompositeInputProcessor(specialGameInputInterfaceArray),                    
//            RectangleFactory.SINGLETON
//            );
              
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "buildScene", e));
        }
    }

    public void processEarlyGameAction()
    {
    }

    public void processStartGameAction()
    {
    }

    private final String NAME = "GDGame Scene";

    public String toString()
    {
        return NAME;
    }
}
