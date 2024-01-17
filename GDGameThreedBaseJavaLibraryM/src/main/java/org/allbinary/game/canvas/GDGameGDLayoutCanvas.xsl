<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
*
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
*
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
*
* Created By: Travis Berthelot
*
*/

package org.allbinary.game.canvas;

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Graphics;

import org.allbinary.game.init.GDGameStaticInitializerFactory;
import org.allbinary.game.level.GDGameLevelBuilder;
import org.allbinary.input.accelerometer.AccelerometerSensorFactory;
import org.allbinary.input.gyro.AllBinaryOrientationSensor;
import org.allbinary.input.gyro.GyroSensorFactory;
import org.allbinary.media.audio.GDGameSoundsFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.ai.OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer;
import org.allbinary.animation.special.SpecialAnimation;
import org.allbinary.game.GDGameAllBinarySceneControllerFactory;
import org.allbinary.game.GameInfo;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.IntermissionFactory;
import org.allbinary.canvas.FullScreenUtil;
import org.allbinary.game.collision.OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer;
import org.allbinary.game.configuration.GameSpeed;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeature;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.combat.canvas.CombatGameCanvas;
import org.allbinary.game.displayable.canvas.BaseMenuBehavior;
import org.allbinary.game.displayable.canvas.GamePerformanceInitUpdatePaintable;
import org.allbinary.game.displayable.canvas.StartIntermissionPaintable;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.input.OptimizedGameInputLayerProcessorForCollidableLayer;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.GDGameLayerManager;
import org.allbinary.game.layer.PaintableLayerComposite;
import org.allbinary.game.layer.identification.GroupLayerManagerListener;
import org.allbinary.game.layout.BaseGDNodeStats;
import org.allbinary.game.layout.GDNodeStatsFactory;
import org.allbinary.game.score.BasicHighScoresFactory;
import org.allbinary.game.state.GameState;
import org.allbinary.game.tick.OptimizedTickableLayerProcessor;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.game.gd.MusicManagerFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.graphics.threed.min3d.AllBinarySceneController;
import org.allbinary.layer.event.LayerManagerEventHandler;
import org.allbinary.media.AllBinaryVibration;
import org.allbinary.media.audio.AllBinaryMediaManager;
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
import org.allbinary.media.audio.GD<xsl:value-of select="position() - 1" />GameMusicFactory;
            </xsl:if>
        </xsl:for-each>
import org.allbinary.media.audio.PlayerQueue;
import org.allbinary.media.audio.PrimaryPlayerQueueFactory;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.Sound;
import org.allbinary.media.audio.music.MusicManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;    
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.time.TimeDelayHelper;

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
public class GDGame<GDLayout>Canvas extends CombatGameCanvas //MultiPlayerGameCanvas //AllBinaryGameCanvas
{
    private final String GD_LAYOUT_COLOR = "GDLayout<xsl:value-of select="position()" />Color";

    private final int WAIT = GameSpeed.getInstance().getDelay();

    private final int portion = 4;
    private final short SIZE = 50;

    private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
    private final StringMaker stringBuilder = new StringMaker();

    private SpecialAnimation specialAnimation = SpecialAnimation.getInstance();
    private PaintableInterface tileLayerPaintable = NullPaintable.getInstance();

    private final GDGameInputProcessor gameInputProcessor = new GDGameInputProcessor();
    
    private final MusicManager musicManager;
    
    public GDGame<GDLayout>Canvas(final CommandListener commandListener,
            final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception
    {
        super(commandListener, allBinaryGameLayerManager,
                new BasicHighScoresFactory(GDGameSoftwareInfo.getInstance()),
                new GDGameStaticInitializerFactory(),
           //new BasicBuildGameInitializerFactory(),
           false);

        musicManager = MusicManagerFactory.create(GD<xsl:value-of select="$layoutIndex" />GameMusicFactory.getInstance().soundList);

        this.cleanupGame();

        final String[] groupNames = new String[SIZE];
        final String GROUP_ = "Group ";
        final StringMaker stringBuilder = new StringMaker();
        for(short index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> SIZE; index++) {
            stringBuilder.delete(0, stringBuilder.length());
            groupNames[index] = stringBuilder.append(GROUP_).append(index).toString();
        }
        GroupFactory.getInstance().init(SIZE, groupNames);

        LayerManagerEventHandler.getInstance().addListener(GroupLayerManagerListener.getInstance());

        GroupLayerManagerListener.getInstance().init(SIZE);

        //this.specialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance(this, allBinaryGameLayerManager);

        //this.setPlayingGameState();
            
        <xsl:variable name="foundSceneBackground" >
            <xsl:for-each select="events" >
                   <xsl:for-each select="events" >
                       <xsl:for-each select="events" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'SceneBackground'" >found
                               </xsl:if>
                           </xsl:for-each>
                       </xsl:for-each>
                   </xsl:for-each>
               </xsl:for-each>
        </xsl:variable>
            
        <xsl:if test="contains($foundSceneBackground, 'found')" >
               <xsl:for-each select="events" >
                   <xsl:for-each select="events" >
                       <xsl:for-each select="events" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'SceneBackground'" >
        //SceneBackground - this is probably better handled as gdnode.
        final BasicColor backgroundBasicColor = new BasicColor(255,
                               <xsl:for-each select="parameters" ><xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" /></xsl:for-each>,
                               GD_LAYOUT_COLOR);
        final BasicColor foregroundBasicColor = new BasicColor(255, 255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue,
                               GD_LAYOUT_COLOR);
                               </xsl:if>
                           </xsl:for-each>
                       </xsl:for-each>
                   </xsl:for-each>
               </xsl:for-each>
        </xsl:if>

        <xsl:if test="not(contains($foundSceneBackground, 'found'))" >
        //Using Layout Color before any - //SceneBackground Action
        final BasicColor backgroundBasicColor = new BasicColor(255,
                               <xsl:value-of select="r" />, <xsl:value-of select="v" />, <xsl:value-of select="b" />,
                               GD_LAYOUT_COLOR);
        final BasicColor foregroundBasicColor = new BasicColor(255, 255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue,
                               GD_LAYOUT_COLOR);
        </xsl:if>
        
        this.gameLayerManager.setBackgroundBasicColor(backgroundBasicColor);
        this.gameLayerManager.setForegroundBasicColor(foregroundBasicColor);
        
        //force2dCollision = <xsl:value-of select="../properties/force2dCollision" />
        <xsl:if test="../properties/force2dCollision/text() = 'true'" >
        Features.getInstance().addDefault(GameFeatureFactory.getInstance().COLLISIONS_FORCED_TWO_DIMENSIONAL);
        </xsl:if>
    }

<!--
    public GDGame<GDLayout>Canvas(AllBinaryGameLayerManager allBinaryGameLayerManager)
    throws Exception
    {
        this(null, allBinaryGameLayerManager);
    }
-->

    <xsl:if test="number($layoutIndex) = 0 or position() = last()" >
    public BaseMenuBehavior getInGameMenuBehavior() {
        return BaseMenuBehavior.getInstance();
    }
    </xsl:if>

    public void setPlayingGameState()
    {
        this.setWait(WAIT);

        //super.setPlayingGameState();

        this.setGameSpecificPaintable(
                new Paintable()
        {
            final SpecialAnimation specialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance();

            public void paint(Graphics graphics)
            {
                specialAnimation.paint(graphics, 0, 0);
                
                //CameraMotionGestureInputProcessor.getInstance().paint(graphics);
            }

            public void paintThreed(Graphics graphics)
            {
                specialAnimation.paintThreed(graphics, 0, 0, 0);
            }

        }
        );

    }

    public void open()
    {
        super.open();
        this.specialAnimation.open();
    }

    public void close()
    {
        super.close();
        this.specialAnimation.close();
    }

    protected void initSpecialPaint()
    {
        super.initSpecialPaint();

        this.setStartIntermissionPaintable(new StartIntermissionPaintable(
                this, new String[] {StringUtil.getInstance().EMPTY_STRING}, new int[] {0}, BasicColorFactory.getInstance().RED));
    }

    public void mediaInit() throws Exception
    {
        LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mediaInit"));
        AllBinaryMediaManager.init(GDGameSoundsFactory.getInstance());
    }

    //Don't Auto Hide instead update the list
    protected  void updateTouch()
    throws Exception
    {
        GameInfo gameInfo = this.gameLayerManager.getGameInfo();

//        if(gameInfo.getGameType() != GameTypeFactory.getInstance().BOT)
//        {
//            BaseTouchInput nextTouchInputFactory =
//                GDGameTouchButtonsBuilder.getInstance(
//                        this.getSensorGameUpdateProcessor());
//
//            if(Features.getInstance().isFeature(
//                    TouchFeatureFactory.getInstance().AUTO_HIDE_SHOW_SCREEN_BUTTONS))
//            {
//                if(gameInfo.getCurrentLevel() - getStartLevel() >= 1)
//                {
//                    nextTouchInputFactory =
//                        GDGameNeededTouchButtonsBuilder.getInstance(
//                                this.getSensorGameUpdateProcessor());
//                }
//            }
//            this.updateCurrentTouchInputFactory(nextTouchInputFactory);
//        }
    }

    protected synchronized void initConfigurable()
    {
        try
        {

            final ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();

            if (ChangedGameFeatureListener.getInstance().isChanged())
            {
                super.initConfigurable();

                //progressCanvas.addPortion(portion, "Group Manager");
                //GroupLayerManagerListener.getInstance().init(SIZE);

                AllBinaryVibration.init();

                super.initConfigurable(portion);

                ChangedGameFeatureListener.getInstance().setChanged(false);

                if (!this.isRunning())
                {
                    return;
                }
            } else
            {
            	progressCanvas.addPortion(4, "Skipping Configurable");
            }

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "initConfigurable", e));
        }
    }

    protected void threadInit() throws Exception
    {
        try
        {
            final int portion = 60;
            super.init();

            if (!this.isRunning())
            {
                return;
            }

            if (!this.isInitialized())
            {
                if (!this.isRunning())
                {
                    return;
                }

                ProgressCanvas progressCanvas =
                    ProgressCanvasFactory.getInstance();

                progressCanvas.addPortion(portion, "Main Processors");

                this.setWait(WAIT);
                this.loadState();

                BasicArrayList list = new BasicArrayList();

                Features features = Features.getInstance();

                GameFeatureFactory gameFeatureFactory = GameFeatureFactory.getInstance();

                if (features.isFeature(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR))
                {
                    list.add(new OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer());
                }

                if (features.isFeature(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR))
                {
                    //GD key input is processed via the GDGlobals input processor array.
                    //list.add(new GDGameInputProcessor());
                    //list.add(new OptimizedGameInputLayerProcessorForCollidableLayer());
                }

                if (features.isFeature(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR))
                {
                    list.add(new OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer());
                }

                if (features.isFeature(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR))
                {
                    list.add(new OptimizedTickableLayerProcessor());
                }

                gameLayerManager.setLayerProcessorList(list);

                progressCanvas.addPortion(portion, "Initializing Game");
            }

            this.addPlayerGameInput(this.gameInputProcessor.getPlayerGameInput());

            this.buildGame(false);

            <xsl:if test="number($layoutIndex) = 0" >
            FullScreenUtil.getInstance().init(this, this.getCustomCommandListener());
            //this.close();
            </xsl:if>
        
        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "_init", e));
        }
    }

    public void buildGame(boolean isProgress) throws Exception
    {
        this.specialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance(this, gameLayerManager);
        this.setPlayingGameState();
        
        this.loadResources(gameLayerManager.getGameInfo().getCurrentLevel());

        ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();

        int portion = 30;
        if (isProgress <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.isMainCanvas())
        {
            progressCanvas.start();

            this.getCustomCommandListener().commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    progressCanvas);
            //progressCanvas.waitUntilDisplayed();
            portion = 4;
        }

        //Combat games
        //this.cleanupGame();
        PrimaryPlayerQueueFactory.getInstance().clear();
        SecondaryPlayerQueueFactory.getInstance().clear();

        if (!this.isRunning())
        {
            return;
        }

        //this.getLayerManager().append(new PlayerGameInputGameLayer());

        //DestroyedEventHandler.getInstance().removeAllListeners();

        //Some games update intermission here

        progressCanvas.addPortion(portion, "Building Game Level");

        final AllBinaryGameLayerManager layerManager = this.getLayerManager();
        final OpenGLFeatureUtil openGLFeatureUtil = OpenGLFeatureUtil.getInstance();
            
        new GDGameLevelBuilder(layerManager).build();

        if (openGLFeatureUtil.isAnyThreed())
        {
            progressCanvas.addPortion(portion, "Building 3D Game Level");

            AllBinarySceneController sceneController = GDGameAllBinarySceneControllerFactory.getInstance();

            final GDGameLayerManager gdGameLayerManager = (GDGameLayerManager) layerManager;
            gdGameLayerManager.layout = <xsl:value-of select="$layoutIndex" />;
            sceneController.buildScene(layerManager);

            progressCanvas.addPortion(portion, "Finalizing 3D Game Level");
        }
        
        progressCanvas.addPortion(portion, "Set Background");

        //Some games update backgrounds here
        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.getLayerManager();
        
        final BasicGeographicMap[] geographicMapInterfaceArray = 
            geographicMapCompositeInterface.getGeographicMapInterface();

        //layerManager.setBackgroundBasicColor(
                //geographicMapInterface.getBackgroundBasicColor());

        //layerManager.setForegroundBasicColor(
                //geographicMapInterface.getForegroundBasicColor());

        this.tileLayerPaintable = new PaintableLayerComposite(BasicGeographicMapUtil.getInstance().createAllBinaryTiledLayerArray(geographicMapInterfaceArray));

        //this.playerLayer = ((GDGameLayerManager) this.getLayerManager()).getPlayerLayer();

        //DestroyedEventHandler.getInstance().addListener((EventListenerInterface) playerLayer);

        if (!this.isRunning())
        {
            return;
        }

        //gameLayerManager.append(new PlayerGameInputGameLayer(0));

        progressCanvas.addPortion(portion, "Ending Custom Build");

        if (gameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
        {
            //PrimaryPlayerQueueFactory.getInstance().add(
                    //GameSounds.getBegin());
        }

        super.buildGame(portion);

        this.getStartIntermissionInterface().setEnabled(true);
        this.getEndLevelIntermissionInterface().setEnabled(false);

        // A canvas not in GameState.PLAYING_GAME_STATE will not appear in
        // democanvas
        this.setGameState(GameState.PLAYING_GAME_STATE);
    }

    protected void cleanupGame() throws Exception
    {
        super.cleanupGame();
        
        if (OpenGLFeatureUtil.getInstance().isAnyThreed())
        {
            AllBinarySceneController sceneController = GDGameAllBinarySceneControllerFactory.getInstance();
            sceneController.clear();
        }
        
        gameLayerManager.cleanup();
    }

    public void setGameState(GameState gameState) throws Exception
    {
        super.setGameState(gameState);

        IntermissionFactory intermissionFactory = IntermissionFactory.getInstance();

        if (this.getGameState() == GameState.PLAYING_GAME_STATE)
        {
            this.setMainStateProcessor(this.getProcessGameProcessor());
        }
        else if (this.getGameState() == intermissionFactory.WAIT_LEVEL_INTERMISSION_GAME_STATE
                || this.getGameState() == intermissionFactory.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE
                || this.getGameState() == intermissionFactory.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE)
        {
            //GameKeyEventHandler.getInstance().addListener(this.getIntermissionPlayerGameInput());

            //this.setMainStateProcessor(this.processEndIntermissionProcessor);
        }
        else
        {
            // Game plays in non intermission and after death
            this.setMainStateProcessor(this.getProcessGameProcessor());
        }
    }

//    private final Paintable paintable = 
//            new Paintable() {
//        public void paint(Graphics graphics) {
//            final int halfHeight = GameTickDisplayInfoSingleton.getInstance().getLastHalfHeight();
//            graphics.drawString(gyroOrientationSensor.toString(), 0, halfHeight + 30 + 60, 0);
//            graphics.drawString(accelerometerOrientationSensor.toString(), 0, halfHeight + 30 + 75, 0);
//        }
//    };
    
    private final InitUpdatePaintable gamePerformanceInitUpdatePaintable =
        //new InitUpdatePaintable();
        new GamePerformanceInitUpdatePaintable();

    private final AllBinaryOrientationSensor gyroOrientationSensor = GyroSensorFactory.getInstance();
    private final AllBinaryOrientationSensor accelerometerOrientationSensor = AccelerometerSensorFactory.getInstance();

    //private String soundQueue = PrimaryPlayerQueueFactory.getInstance().toString();

    //private boolean isFirst = true;
    //private final String DRAW = "draw";

    public void draw(Graphics graphics)
    {

        //if (this.isFirst)
        //{
            //this.isFirst = false;
            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, DRAW));
        //}

        this.clear(graphics);

        this.getBasicColorUtil().setBasicColor(graphics, gameLayerManager.getForegroundBasicColor());

        //final int halfHeight = GameTickDisplayInfoSingleton.getInstance().getLastHalfHeight();
        //graphics.drawString(TEXT, 0, halfHeight, 0);

        //graphics.drawString(soundQueue, 0, halfHeight + 15, 0);

        this.tileLayerPaintable.paint(graphics);

    	gameLayerManager.paint(graphics, 0, 0);

    	nonBotPaintable.paint(graphics);

        gameSpecificPaintable.paint(graphics);

    	//gamePerformanceInitUpdatePaintable.paint(graphics);
        //paintable.paint(graphics);

        touchPaintable.paint(graphics);

        screenCapture.saveFrame();

        this.getTouchPaintable().paint(graphics);
    }

    public void paintThreed(Graphics graphics)
    {
        
    }
    
    private TimeDelayHelper playerTimeDelayHelper = new TimeDelayHelper(2000);
            //890);

    private final PlayerQueue primaryPlayerQueue = PrimaryPlayerQueueFactory.getInstance();
    private final PlayerQueue secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance();

    private final Features features = Features.getInstance();

    private final GameFeature soundGameFeature = GameFeatureFactory.getInstance().SOUND;

    protected void processGame() throws Exception
    {
        if (playerTimeDelayHelper.isTime())
        {
            if(this.features.isFeature(soundGameFeature))
            {
                //this.primaryPlayerQueue.add(TestSound.getInstance());
            }
        }

        super.processGame();

        /*
        if (playerTimeDelayHelper.isTime())
        {
            if (!this.primaryPlayerQueue.process())
            {
                if (this.secondaryPlayerQueue.process())
                {
                    playerTimeDelayHelper.setStartTime();
                }
            } else
            {
                playerTimeDelayHelper.setStartTime();
            }
        }


        if (!this.primaryPlayerQueue.process())
        {
            this.secondaryPlayerQueue.process();
        }

        */

        //soundQueue = this.primaryPlayerQueue.toString();

        this.gamePerformanceInitUpdatePaintable.update();
    }

    protected void processPlayingGame() throws Exception {
    
        gdNodeStatsFactory.reset();
    
        musicManager.process();

        this.gameInputProcessor.process(this.gameLayerManager, this.specialAnimation);

        super.processPlayingGame();

        this.specialAnimation.process();
        
        gdNodeStatsFactory.log(stringBuilder, this);
    }

    @Override
    public void nextSong(final Sound nextSongSound) {
        musicManager.nextSong(nextSongSound);
    }

    @Override
    public void endGameThread() throws Exception
    {
    	super.endGameThread();
    	
    	musicManager.stop();
    }

    //Special end case for GDevelop
    public void end2() {
//        try {
//            LogUtil.put(LogFactory.getInstance(this.commonStrings.END, this, this.commonStrings.END));
//            this.cleanupGame();
//            this.specialAnimation = SpecialAnimation.getInstance();
//            this.setGameSpecificPaintable(NullPaintable.getInstance());
//        } catch (Exception e)
//        {
//            LogUtil.put(LogFactory.getInstance(this.commonStrings.EXCEPTION, this, this.commonStrings.END, e));
//        }
    }

}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
