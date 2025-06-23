package org.allbinary.graphics.threed.min3d;

import javax.microedition.khronos.opengles.GL10;

import min3d.core.Object3d;
import min3d.core.TextureManager;
import min3d.vos.Camera;
import min3d.vos.OffsetTargetXCamera;
import min3d.vos.OffsetTargetXCameraFactory;
import min3d.vos.light.Light;
import org.allbinary.AndroidUtil;
import org.allbinary.animation.threed.ThreedAnimation;

import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.canvas.GDGameGlobals;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.game.canvas.GDGameThreedLevelBuilder;
import org.allbinary.game.displayable.canvas.CheatGameInputProcessor;
import org.allbinary.game.gd.level.GDPlatformUtil;
import org.allbinary.game.input.threed.CameraCompositeInputProcessor;
import org.allbinary.game.layer.CameraLayer;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layer.GDGameLayerManager;
import org.allbinary.game.layer.SimpleVehicleFollowCameraLayer;
import org.allbinary.game.resource.GDThreedEarlyResourceInitializationFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.opengles.OpenGLCapabilities;

import org.allbinary.graphics.threed.min3d.renderer.AllBinaryToMin3dRendererFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.os.OperatingSystemInterface;
import org.allbinary.view.ViewPosition;

public class GDGameSceneController 
extends AllBinaryGameSceneController
{
    private final String TAG = "GDGameSceneController";

    private final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();

    private final GDGameThreedLevelBuilderFactory gameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance();

    public GDGameSceneController()
    {
        super(new AllBinaryToMin3dRendererFactory(), 
            //new CameraFactory(), 
            new OffsetTargetXCameraFactory(),
            new AllBinarySceneFactory(), true, true);
        
        PreLogUtil.put(commonStrings.START, TAG, commonStrings.CONSTRUCTOR);
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
            PreLogUtil.put(commonStrings.START, this, METHOD_NAME);

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

            final Camera camera = scene.getCamera();
            camera.frustum.horizontalCenter(0.5f);
            camera.frustum.verticalCenter(0.5f);
                
              //PreLogUtil.put(, this, METHOD_NAME);
              
              this.initialized = true;
            }
            else
            {
                TextureManager.getInstance().reset(gl);
            }

            progressCanvas.addEarlyPortion(portion, loadingString, index++);
            
            final int size = gameThreedLevelBuilderFactory.list.size();
            for(int index = 0; index < size; index++) {
                ((GDGameThreedLevelBuilder) gameThreedLevelBuilderFactory.list.get(index)).build(gl, glInstanceVersion);
            }

            progressCanvas.addEarlyPortion(portion, loadingString, index++);

            PreLogUtil.put(commonStrings.END, this, METHOD_NAME);                
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, METHOD_NAME, e));
        }
    }

    private CameraLayer cameraLayer;
    private final String BUILD_SCENE = "buildScene";
    public void buildScene(final AllBinaryGameLayerManager layerManager) throws Exception
    {
        try
        {
            PreLogUtil.put(commonStrings.START, this, BUILD_SCENE);

            final GDGameLayerManager gdLayerManager = (GDGameLayerManager) layerManager;
            final GDGameCameraSetup gdGameCameraSetup = ((GDGameCameraSetup) gameThreedLevelBuilderFactory.cameraList.get(gdLayerManager.layout));
                
            //camera.position
            final Camera camera = scene.getCamera();
            
            if (gdGameCameraSetup.type == GDGameCameraSetup.FOLLOW) {
                
                //Reset the scene
                scene.reset();

                final OffsetTargetXCamera vehicleCamera = (OffsetTargetXCamera) scene.getCamera();

                //final int distanceX = 5;
                //final int distanceY = 5;
                //final int distanceZ = 5;
                //final ViewPosition viewPosition = new StaticViewPosition(0, 0, 0);
                //final org.allbinary.graphics.Rectangle rectangle = new org.allbinary.graphics.Rectangle(PointFactory.getInstance().getInstance(0, 0), 0, 0);
                final OperatingSystemInterface operatingSystem =
                    OperatingSystemFactory.getInstance().getOperatingSystemInstance();
                final int distance = operatingSystem.isOverScan() ? (AndroidUtil.isAndroid() ? 550 : 650) : (AndroidUtil.isAndroid() ? 200 : 300);

                cameraLayer =
                    //new CompleteViewOfTargetCameraLayer(scene.getCamera(), rectangle, viewPosition, distanceX, distanceY, distanceZ);
                    new SimpleVehicleFollowCameraLayer(
                        ////new SimpleFollowCameraLayer(
                ////new ExampleRotateAroundTargetCameraLayer(
                ////new ExampleLockedCameraLayer(
                    vehicleCamera, RectangleFactory.SINGLETON, new ViewPosition(),
                        distance, distance, distance);

                if (layerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT) {
                    vehicleCamera.setOffsetY(10f);
                } else {
                    vehicleCamera.setOffsetY(8f);
                }

                //rear angle - may need to change as incline grade changes
                //cameraLayer.setRotationY((short) 5);
                //cameraLayer.setRotationY((short) 15);
                GDPlatformUtil.getInstance().updateCamera(cameraLayer);

                //cameraLayer.setRotationY((short) 90);
                cameraLayer.updateCamera();
                
//                if (cameraLayer == null) {
//
//                    //1130 uses 2100 additive
//                    //2176 is used since no camera sway
//                    final int distance = CameraUtil.getInstance().getDistanceBasedOnUnused(1130);
//
//                    cameraLayer = //new CameraLayer(
//                        //new SwayCameraLayer( 
//                        new SimpleVehicleFollowCameraLayer( 
//                        //new SimpleFollowCameraLayer(
//                        //new ExampleRotateAroundTargetCameraLayer(
//                        //new ExampleLockedCameraLayer(
//                        camera,
//                        RectangleFactory.SINGLETON,
//                        new ViewPosition(),
//                        distance, distance, distance);
//
//                    //cameraLayer.setRotationX(90);
//                    //cameraLayer.setRotationY((short) 90);
//                    //cameraLayer.setRotationZ(90);
//                    NullTargetFactory.getInstance().setTarget(scene);
//
//                    //this.adjustObject3dGameLayer = AdjustableObject3dOrientationGameLayer.getInstance();
//                } else {
//                    cameraLayer.getGameKeyEventList().clear();
//                    //this.adjustObject3dGameLayer.getGameKeyEventList().clear();
//                }
//
            }

            final StringMaker stringMaker = new StringMaker();

            if (gdGameCameraSetup.type == GDGameCameraSetup.FOLLOW) {
                cameraLayer.updateCamera();
                
                final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                
                if(gameGlobals.PlayerGDGameLayerList.size() > 0) {
                    final GDGameLayer playerGDGameLayer = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);

                    final ThreedAnimation threedAnimation = (ThreedAnimation) playerGDGameLayer.getIndexedAnimationInterface();

                    final Object3d object3d = threedAnimation.getObject3d();

                    camera.target = object3d;
                    
                    PreLogUtil.put("Player set as Follow Camera Target", this, BUILD_SCENE);

                } else {
                    
                    camera.target = new Object3d(0, 0);
                    
                    PreLogUtil.put("Default Object set as Follow Camera Target", this, BUILD_SCENE);
                }

            } else {

                camera.target = new Object3d(0, 0);
                
                PreLogUtil.put("Default Object set as Simple Camera Target", this, BUILD_SCENE);
            }
            
            gdGameCameraSetup.process(camera, stringMaker);

            if (gdGameCameraSetup.type == GDGameCameraSetup.FOLLOW) {
                cameraLayer.processTick(layerManager);
                layerManager.append(cameraLayer);
            }

            //CheatGameInputProcessor.inputProcessor = new CameraCompositeInputProcessor(cameraLayer);
            
            camera.position.append(stringMaker);
            stringMaker.append('-').append('>');
            camera.target.getPosition().append(stringMaker);
            PreLogUtil.put(stringMaker.toString(), this, BUILD_SCENE);
            
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
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, BUILD_SCENE, e));
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
