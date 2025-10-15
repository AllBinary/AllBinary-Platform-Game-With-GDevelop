package org.allbinary.graphics.threed.min3d;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer
    ;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.lcdui.Graphics;

import min3d.core.TextureManager;
import min3d.vos.Camera;
import min3d.vos.OffsetTargetXCamera;
import min3d.vos.OffsetTargetXCameraFactory;
import min3d.vos.light.Light;

import org.allbinary.AndroidUtil;
import org.allbinary.device.OpenGLESGraphics;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.game.canvas.GDGameThreedLevelBuilder;
import org.allbinary.game.gd.level.GDPlatformUtil;
import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.game.layer.CameraLayer;
import org.allbinary.game.layer.GDGameLayerManager;
import org.allbinary.game.layer.SimpleUserFollowCameraLayer;
import org.allbinary.game.resource.GDThreedEarlyResourceInitializationFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLCapabilities;
import org.allbinary.graphics.threed.min3d.renderer.AllBinaryToMin3dRendererFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.os.OperatingSystemInterface;
import org.allbinary.view.ViewPosition;
 
public class GDGameSceneController 
extends AllBinaryGameSceneController
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final String TAG = "GDGameSceneController";

    private final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();

    private final GDGameThreedLevelBuilderFactory gameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance();

    private final GDCameraInputProcessor cameraInputProcessor = new GDCameraInputProcessor() 
    {
        public void process(GDGameCameraSetup gdGameCameraSetup) {
//            if (gdGameCameraSetup.type == GDGameCameraSetup.FOLLOW) {
//                CheatGameInputProcessor.inputProcessor = new CameraLayerCompositeInputProcessor(cameraLayer);
//            } else if (gdGameCameraSetup.type == GDGameCameraSetup.SIMPLE) {
//                CheatGameInputProcessor.inputProcessor = new CameraCompositeInputProcessor(cameraLayer.getCamera());
//            } else {
//                CheatGameInputProcessor.inputProcessor = SpecialGameInputFactory.NO_SPECIAL_GAME_INPUT;
//            }
//                CheatGameInputProcessor.inputProcessor = new CameraPositionCompositeInputProcessor(scene.getCamera());
//                CheatGameInputProcessor.inputProcessor = new CameraTargetCompositeInputProcessor(scene.getCamera());
//                CheatGameInputProcessor.inputProcessor = new CameraControlCompositeInputProcessor(scene.getCamera());

        }
    };
    
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
        try
        {
            PreLogUtil.put(commonStrings.START, this, this.sceneStrings.INIT_SCENE);

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
            //Default values if not set by configuration
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

            PreLogUtil.put(commonStrings.END, this, this.sceneStrings.INIT_SCENE);                
        }
        catch (Exception e)
        {
            logUtil.put(commonStrings.EXCEPTION, this, this.sceneStrings.INIT_SCENE, e);
        }
    }

    private CameraLayer cameraLayer;
    public void buildScene(final AllBinaryGameLayerManager layerManager) throws Exception
    {
        try
        {
            PreLogUtil.put(commonStrings.START, this, this.sceneStrings.BUILD_SCENE);

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
                    //new CameraLayer(
                    //new CompleteViewOfTargetCameraLayer(scene.getCamera(), rectangle, viewPosition, distanceX, distanceY, distanceZ);
                    new SimpleUserFollowCameraLayer(
                    //new SimpleVehicleFollowCameraLayer(
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

            gdGameCameraSetup.processTarget(cameraLayer, camera);

            gdGameCameraSetup.process(camera, stringMaker);
            
            camera.cameraSetup = gdGameCameraSetup;
            
            final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
            final float ratio = (float) displayInfoSingleton.getLastWidth() / (float) displayInfoSingleton.getLastHeight();
            camera.updateFrustrum(ratio);

            if (gdGameCameraSetup.type == GDGameCameraSetup.FOLLOW) {
                cameraLayer.processTick(layerManager);
                layerManager.append(cameraLayer);
            }
            
            //Test grid for JOGL to help with camera
//            layerManager.append(new AllBinaryGameLayer(RectangleFactory.SINGLETON, ViewPosition.NULL_VIEW_POSITION) {
//
//                private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
//
//                private FloatBuffer mVertexBuffer;
//                private int mNumVertices;
//
//                @Override
//                public void set(final GL gl) throws Exception {
//
//                    final int WIDTH_DIV_10 = displayInfoSingleton.getLastWidth() / 10;
//                    final int HEIGHT_DIV_10 = displayInfoSingleton.getLastHeight() / 10;
//                    final int divisions = 10;
//                        mNumVertices = (divisions + 1) * 4;
//                        float[] vertices = new float[mNumVertices * 3];
//                        int vertexIndex = 0;
//                        int step = 1;
//
//                        for (int i = -10; i <= 0; i++) {
//                            vertices[vertexIndex++] = i * WIDTH_DIV_10;
//                            vertices[vertexIndex++] = 0.0f;
//                            vertices[vertexIndex++] = -displayInfoSingleton.getLastHeight();
//
//                            vertices[vertexIndex++] = i * WIDTH_DIV_10;
//                            vertices[vertexIndex++] = 0.0f;
//                            vertices[vertexIndex++] = 0.0f;
//                        }
//
//                        for (int i = -10; i <= 0; i++) {
//                            float y = -WIDTH_DIV_10 / 2.0f + i * step;
//                            vertices[vertexIndex++] = -displayInfoSingleton.getLastWidth();
//                            vertices[vertexIndex++] = 0.0f;
//                            vertices[vertexIndex++] = i * HEIGHT_DIV_10;
//
//                            vertices[vertexIndex++] = 0.0f;
//                            vertices[vertexIndex++] = 0.0f;
//                            vertices[vertexIndex++] = i * HEIGHT_DIV_10;
//                        }
//
//                        ByteBuffer vbb = ByteBuffer.allocateDirect(vertices.length * 4);
//                        vbb.order(ByteOrder.nativeOrder());
//                        mVertexBuffer = vbb.asFloatBuffer();
//                        mVertexBuffer.put(vertices);
//                        mVertexBuffer.position(0);
//                }
//
//                @Override
//                public void paint(final Graphics graphics) {
//                }
//
//                @Override
//                public void paintThreed(final Graphics graphics) {
//                    try {
//                        //System.out.println("lollers");
//                        //final JOGL11 gl = (JOGL11) ((OpenGLESGraphics) graphics).getGl10();
//                        final GL10 gl = (GL10) ((OpenGLESGraphics) graphics).getGl10();
//
//                        gl.glPushMatrix();
//
//                        gl.glColor4f(0.0f, 1.0f, 0.0f, 1.0f);
//
//                        //gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
//                        gl.glVertexPointer(3, GL10.GL_FLOAT, 0, this.mVertexBuffer);
//                        gl.glDrawArrays(GL10.GL_LINES, 0, this.mNumVertices);
//                        //gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
//
////                        gl.glBegin(GL10.GL_LINES);
////                        for (int i = -10; i <= 10; i++) {
////                            gl.glVertex3f(i * 100, 0, -1000);
////                            gl.glVertex3f(i * 100, 0, 1000);
////                            gl.glVertex3f(-1000, 0, i * 100);
////                            gl.glVertex3f(1000, 0, i * 100);
////                        }
////                        gl.glEnd();
//
////                        gl.glBegin(GL10.GL_LINES);
//
////                        final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
////                        final int WIDTH_DIV_10 = displayInfoSingleton.getLastWidth() / 10;
////                        final int HEIGHT_DIV_10 = displayInfoSingleton.getLastHeight() / 10;
////                        for (int i = -10; i <= 0; i++) {
////                            gl.glVertex3f(i * WIDTH_DIV_10, 0, -displayInfoSingleton.getLastHeight());
////                            gl.glVertex3f(i * WIDTH_DIV_10, 0, 0);
////                            gl.glVertex3f(-displayInfoSingleton.getLastWidth(), 0, i * HEIGHT_DIV_10);
////                            gl.glVertex3f(0, 0, i * HEIGHT_DIV_10);
////                        }
////                        gl.glEnd();
//
//                        gl.glPopMatrix();
//
//                    } catch (Exception e) {
//                        logUtil.put(commonStrings.EXCEPTION, this, "paintThreed", e);
//                    }
//                }
//
//                public int SceneWindowWidth() {
//                    return gameTickDisplayInfoSingleton.getLastWidth();
//                }
//
//                public int SceneWindowHeight() {
//                    return gameTickDisplayInfoSingleton.getLastHeight();
//                }
//
//            });
            
            cameraInputProcessor.process(gdGameCameraSetup);
            
            camera.position.append(stringMaker);
            stringMaker.append('-').append('>');
            camera.target.getPosition().append(stringMaker);
            PreLogUtil.put(stringMaker.toString(), this, this.sceneStrings.BUILD_SCENE);
            
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
            logUtil.put(commonStrings.EXCEPTION, this, this.sceneStrings.BUILD_SCENE, e);
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
