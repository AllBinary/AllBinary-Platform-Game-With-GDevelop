<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />

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

package org.allbinary.game.canvas

import javax.microedition.lcdui.CommandListener
import javax.microedition.lcdui.Font
import javax.microedition.lcdui.Graphics

import org.allbinary.J2MEUtil
import org.allbinary.game.init.GDGameStaticInitializerFactory
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
import org.allbinary.game.level.GDGame<xsl:value-of select="$layoutName" />LevelBuilder
            </xsl:if>
        </xsl:for-each>
import org.allbinary.graphics.opengles.CurrentDisplayableFactory
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.graphics.opengles.OpenGLFeatureUtil
import org.allbinary.input.accelerometer.AccelerometerSensorFactory
import org.allbinary.input.gyro.AllBinaryOrientationSensor
import org.allbinary.input.gyro.GyroSensorFactory
import org.allbinary.media.audio.GDGameSoundsFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.ai.OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer
import org.allbinary.animation.special.SpecialAnimation
import org.allbinary.game.GDGameAllBinarySceneControllerFactory
import org.allbinary.game.GameInfo
import org.allbinary.game.GameTypeFactory
import org.allbinary.game.IntermissionFactory
import org.allbinary.canvas.FullScreenUtil
import org.allbinary.debug.DebugFactory
import org.allbinary.debug.NoDebug
import org.allbinary.game.GDGameCommandFactory
import org.allbinary.game.collision.OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer
import org.allbinary.game.configuration.GameSpeed
import org.allbinary.game.configuration.event.ChangedGameFeatureListener
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeature
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
import org.allbinary.game.combat.canvas.CombatGameCanvas
import org.allbinary.game.commands.GameCommandsFactory
import org.allbinary.game.displayable.canvas.BaseMenuBehavior
import org.allbinary.game.displayable.canvas.GamePerformanceInitUpdatePaintable
import org.allbinary.game.displayable.canvas.StartIntermissionPaintable
import org.allbinary.game.identification.GroupFactory
import org.allbinary.game.input.PlayerGameInput
import org.allbinary.game.input.event.DownKeyEventHandler
import org.allbinary.game.input.event.UpKeyEventHandler
import org.allbinary.game.input.OptimizedGameInputLayerProcessorForCollidableLayer
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.GDGameLayerManager
import org.allbinary.game.layer.PaintableLayerComposite
import org.allbinary.game.layer.PlayerGameInputGameLayer
import org.allbinary.game.layer.identification.GroupLayerManagerListener
import org.allbinary.game.layer.AllBinaryThreedVisibleTiledLayer
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layout.BaseGDNodeStats
import org.allbinary.game.layout.GDNodeStatsFactory
import org.allbinary.game.map.GDGeographicMap
import org.allbinary.game.score.BasicHighScoresFactory
import org.allbinary.game.score.NoHighScoresFactory
import org.allbinary.game.state.GameState
import org.allbinary.game.tick.OptimizedTickableLayerProcessor
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.SmallBasicColorCacheFactory
import org.allbinary.graphics.color.BasicColorUtil
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.graphics.displayable.command.MyCommandsFactory
import org.allbinary.media.audio.music.MusicManagerFactory
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
import org.allbinary.game.gd.resource.GDResources
import org.allbinary.graphics.opengles.CurrentDisplayableFactory
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.graphics.paint.NullPaintable
import org.allbinary.graphics.paint.InitUpdatePaintable
import org.allbinary.graphics.paint.NullPaintable
import org.allbinary.graphics.paint.NullInitUpdatePaintable
import org.allbinary.graphics.paint.Paintable
import org.allbinary.graphics.paint.PaintableInterface
import org.allbinary.graphics.threed.min3d.AllBinarySceneController
import org.allbinary.image.ImageCache
import org.allbinary.image.ImageCacheFactory
import org.allbinary.layer.Layer
import org.allbinary.layer.event.LayerManagerEventHandler
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.media.AllBinaryVibration
import org.allbinary.media.audio.AllBinaryMediaManager
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />LayoutUtil
import org.allbinary.media.audio.GD<xsl:value-of select="$layoutIndex" />GameMusicFactory
            </xsl:if>
        </xsl:for-each>
import org.allbinary.media.audio.PlayerQueue
import org.allbinary.media.audio.PrimaryPlayerQueueFactory
import org.allbinary.media.audio.SecondaryPlayerQueueFactory
import org.allbinary.media.audio.Sound
import org.allbinary.media.audio.music.MusicManager
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
import org.allbinary.time.TimeDelayHelper
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
open class GDGame<xsl:value-of select="$layoutName" />Canvas : CombatGameCanvas //MultiPlayerGameCanvas //AllBinaryGameCanvas
{
    private val basicColorUtil: BasicColorUtil = BasicColorUtil.getInstance()
    private val smallBasicColorCacheFactory: SmallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance()
    private val imageCache: ImageCache = ImageCacheFactory.getInstance()

    private val GD_LAYOUT_COLOR: String = "GDLayout<xsl:value-of select="position()" />Color"

    private val WAIT: Int = GameSpeed.getInstance().getDelay()

    private val portion: Int = 4
    private val SIZE: Short = 50

    private val gdResources: GDResources = GDResources.getInstance()
    private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()
    private val stringBuilder: StringMaker = StringMaker()

    private var specialAnimation: SpecialAnimation = SpecialAnimation.getInstance()
    private var tileLayerThreedPaintable: Paintable = NullPaintable.getInstance()
    private var tileLayerPaintable: Paintable = NullPaintable.getInstance()

    private val gameInputProcessor: GDGameInputProcessor = GDGameInputProcessor()

    private val downKeyEventHandler: DownKeyEventHandler = DownKeyEventHandler.getInstance()
    private val upKeyEventHandler: UpKeyEventHandler = UpKeyEventHandler.getInstance()
    private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()

    private val musicManager: MusicManager

    private val abeClientInformation: AbeClientInformationInterface

    constructor(abeClientInformation: AbeClientInformationInterface,
        commandListener: CommandListener, allBinaryGameLayerManager: AllBinaryGameLayerManager) : super(commandListener, allBinaryGameLayerManager, //BasicHighScoresFactory(abeClientInformation,, GDGameSoftwareInfo.getInstance()), NoHighScoresFactory.getInstance(), GDGameStaticInitializerFactory(), //BasicBuildGameInitializerFactory(), false)

    {

        <xsl:if test="number($layoutIndex) = 1" >
        this.imageCache.initProgress()
        this.gdResources.currentLayoutRequiredTotal = this.gdResources.resourceStringArray.length
        </xsl:if>
        <xsl:if test="number($layoutIndex) != 1" >
        this.gdResources.currentLayoutRequiredTotal = 0
        </xsl:if>

        this.abeClientInformation = abeClientInformation

        musicManager = MusicManagerFactory.createMusicManager(GD<xsl:value-of select="$layoutIndex" />GameMusicFactory.getInstance().soundList)

        this.cleanupGame()

        LayerManagerEventHandler.getInstance().addListener(GroupLayerManagerListener.getInstance())

        //this.specialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance(this, allBinaryGameLayerManager)

        //this.setPlayingGameState()

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
        val backgroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                               <xsl:for-each select="parameters" ><xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" /></xsl:for-each>))
                               //GD_LAYOUT_COLOR
        val foregroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                               255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue))
                               //GD_LAYOUT_COLOR
                               </xsl:if>
                           </xsl:for-each>
                       </xsl:for-each>
                   </xsl:for-each>
               </xsl:for-each>
        </xsl:if>

        <xsl:if test="not(contains($foundSceneBackground, 'found'))" >
        //Using Layout Color before any - //SceneBackground Action
        val backgroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                               <xsl:value-of select="r" />, <xsl:value-of select="v" />, <xsl:value-of select="b" />))
                               //GD_LAYOUT_COLOR
        val foregroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                               255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue))
                               //GD_LAYOUT_COLOR
        </xsl:if>

        this.gameLayerManager.setBackgroundBasicColor(backgroundBasicColor)
        this.gameLayerManager.setForegroundBasicColor(foregroundBasicColor)

        //force2dCollision = <xsl:value-of select="../properties/force2dCollision" />
        <xsl:if test="../properties/force2dCollision/text() = 'true'" >
        Features.getInstance().addDefault(GameFeatureFactory.getInstance().COLLISIONS_FORCED_TWO_DIMENSIONAL)
        </xsl:if>
    }

<!--
    constructor(AllBinaryGameLayerManager allBinaryGameLayerManager) : this(null, allBinaryGameLayerManager)

    {
    }
-->

    <xsl:variable name="name2" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
    <xsl:if test="number($layoutIndex) = 0 or position() = last() or contains($name2, 'in_game_options') or contains($name2, 'score') or contains($name2, 'over')" >
    fun getInGameMenuBehavior(): BaseMenuBehavior {
        return BaseMenuBehavior.getInstance()
    }
    </xsl:if>

    fun setPlayingGameState()
    {
        this.setWait(WAIT)

        //super.setPlayingGameState()

        this.setGameSpecificPaintableP(
                Paintable()
        {
            val specialAnimation: SpecialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance()

            override fun paint(graphics: Graphics)
            {
                specialAnimation.paintXY(graphics, 0, 0)

                //CameraMotionGestureInputProcessor.getInstance().paint(graphics)
            }

            override fun paintThreed(graphics: Graphics)
            {
                specialAnimation.paintThreedXYZ(graphics, 0, 0, 0)
            }

        }
        )

    }

    fun open()
    {
        super.open()
        this.specialAnimation.open()
    }

    fun close()
    {
        super.close()
        this.specialAnimation.close()
    }

    protected fun initSpecialPaint()
    {
        super.initSpecialPaint()

        <xsl:if test="number($layoutIndex) = 0 or position() = last() or contains($name2, 'game_options') or contains($name2, 'score') or contains($name2, 'over')" >
        GameNotificationEventHandler.getInstance().enabled = false
        this.setStartIntermissionPaintable(NullInitUpdatePaintable.getInstance())
        </xsl:if>

        <xsl:if test="not(number($layoutIndex) = 0 or position() = last() or contains($name2, 'game_options') or contains($name2, 'score') or contains($name2, 'over'))" >
        GameNotificationEventHandler.getInstance().enabled = true

        open class GDStartIntermissionPaintable : StartIntermissionPaintable {

            //Font.getDefaultFont()
            constructor(combatGameCanvas: AllBinaryGameCanvas) : super(combatGameCanvas, arrayOf(StringUtil.getInstance().EMPTY_STRING), BasicColorFactory.getInstance().RED, Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, 24)) {
                this.lineYOffsetArray = intArrayOf(0)
            }

//            @Override
//            public void updateMeasurement(graphics: Graphics) {
//                super.updateMeasurement(graphics)
//            }
        }

        this.setStartIntermissionPaintable(GDStartIntermissionPaintable(this))

        </xsl:if>
    }

    fun mediaInit()
    {
        logUtil.putF(commonStrings.START, this, "mediaInit")
        AllBinaryMediaManager.init(GDGameSoundsFactory.getInstance())
    }

    //Don't Auto Hide instead update the list
    protected fun updateTouch()

    {
        var gameInfo: GameInfo = this.gameLayerManager.getGameInfo()

//        if(gameInfo.getGameType() != GameTypeFactory.getInstance().BOT)
//        {
//            BaseTouchInput nextTouchInputFactory =
//                GDGameTouchButtonsBuilder.getInstance(
//                        this.getSensorGameUpdateProcessor())
//
//            if(Features.getInstance().isFeature(
//                    TouchFeatureFactory.getInstance().AUTO_HIDE_SHOW_SCREEN_BUTTONS))
//            {
//                if(gameInfo.getCurrentLevel() - getStartLevel() >= 1)
//                {
//                    nextTouchInputFactory =
//                        GDGameNeededTouchButtonsBuilder.getInstance(
//                                this.getSensorGameUpdateProcessor())
//                }
//            }
//            this.updateCurrentTouchInputFactory(nextTouchInputFactory)
//        }
    }

    protected @Synchronized fun initConfigurable(abeClientInformation: AbeClientInformationInterface)
    {
        try
        {

            val progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()

            if (ChangedGameFeatureListener.getInstance().isChanged())
            {
                super.initConfigurable(abeClientInformation)

                //progressCanvas.addNormalPortion(portion, "Group Manager")
                //GroupLayerManagerListener.getInstance().init(SIZE)

                AllBinaryVibration.init()

                super.initConfigurablePortion(portion)

                ChangedGameFeatureListener.getInstance().setChanged(false)

                if (!this.isRunning())
                {
                    return
                }
            } else
            {
                progressCanvas.addNormalPortion(4, "Skipping Configurable")
            }

        } catch(e: Exception)
        {
            logUtil.put(commonStrings.EXCEPTION, this, "initConfigurable", e)
        }
    }

    protected fun threadInit()
    {
        try
        {
            //logUtil.putF(commonStrings.START, this, "threadInit")

            val portion: Int = 60
            super.initApp(this.abeClientInformation)

            if (!this.isRunning())
            {
                return
            }

            if (!this.isInitialized())
            {
                if (!this.isRunning())
                {
                    return
                }

                var progressCanvas: ProgressCanvas =
                    ProgressCanvasFactory.getInstance()

                progressCanvas.addNormalPortion(portion, "Main Processors")

                this.setWait(WAIT)
                this.loadState()

                var list: BasicArrayList = BasicArrayListD()

                var features: Features = Features.getInstance()

                var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()

                if (features.isFeature(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR))
                {
                    list.add(OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer())
                }

                if (features.isFeature(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR))
                {
                    //GD key input is processed via the GDGlobals input processor array.
                    //list.add(GDGameInputProcessor())
                    //list.add(OptimizedGameInputLayerProcessorForCollidableLayer())
                }

                //if (features.isFeature(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR))
                //{
                //    list.add(OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer())
                //}

                if (features.isFeature(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR))
                {
                    list.add(OptimizedTickableLayerProcessor())
                }

                gameLayerManager.setLayerProcessorList(list)

                progressCanvas.addNormalPortion(portion, "Initializing Game")
            }

            this.addPlayerGameInput(this.gameInputProcessor.getPlayerGameInput())

            this.buildGame(false)

            <xsl:if test="number($layoutIndex) = 0" >
            FullScreenUtil.getInstance().initOnRun(this, this.getCustomCommandListener())
            //this.close()
            </xsl:if>

        } catch(e: Exception)
        {
            logUtil.put(commonStrings.EXCEPTION, this, "_init", e)
        }
    }

    fun buildGame(isProgress: Boolean)
    {
        //logUtil.putF(commonStrings.START, this, "buildGame")

        this.specialAnimation = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance(this, gameLayerManager)
        this.setPlayingGameState()

        this.loadResources(gameLayerManager.getGameInfo().getCurrentLevel())

        var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()

        var portion: Int = 30
        if (isProgress <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.isMainCanvas())
        {
            progressCanvas.start()

            this.getCustomCommandListener().commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    progressCanvas)
            //progressCanvas.waitUntilDisplayed()
            portion = 4
        }

        //Combat games
        //this.cleanupGame()
        PrimaryPlayerQueueFactory.getInstance().clear()
        SecondaryPlayerQueueFactory.getInstance().clear()

        if (!this.isRunning())
        {
            return
        }

        //this.getLayerManager().append(PlayerGameInputGameLayer())

        //DestroyedEventHandler.getInstance().removeAllListeners()

        //Some games update intermission here

        progressCanvas.addNormalPortion(portion, "Building Game Level")

        val layerManager: AllBinaryGameLayerManager = this.getLayerManager()
        val openGLFeatureUtil: OpenGLFeatureUtil = OpenGLFeatureUtil.getInstance()

        GDGame<xsl:value-of select="$layoutName" />LevelBuilder(layerManager).build()

        <!--if (openGLFeatureUtil.isAnyThreed())
        {-->
            progressCanvas.addNormalPortion(portion, "Building 3D Game Level")

            var sceneController: AllBinarySceneController = GDGameAllBinarySceneControllerFactory.getInstance()

            val gdGameLayerManager: GDGameLayerManager = layerManager as GDGameLayerManager
            gdGameLayerManager.layout = <xsl:value-of select="$layoutIndex" />
            sceneController.buildScene(layerManager)

            progressCanvas.addNormalPortion(portion, "Finalizing 3D Game Level")
        <!--}-->

        progressCanvas.addNormalPortion(portion, "Set Background")

        <xsl:variable name="hasOneOrMoreTileMaps" ><xsl:for-each select="objects" ><xsl:if test="type = 'TileMap::TileMap'" >found</xsl:if></xsl:for-each></xsl:variable>

        <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >
        //Some games update backgrounds here
        val geographicMapCompositeInterface: GeographicMapCompositeInterface =
            layerManager as GeographicMapCompositeInterface

        val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; =
            geographicMapCompositeInterface.getGeographicMapInterface()

        //layerManager.setBackgroundBasicColor(
                //geographicMapInterface.getBackgroundBasicColor())

        //layerManager.setForegroundBasicColor(
                //geographicMapInterface.getForegroundBasicColor())

            /*
            val layerArray: Array&lt;Layer&gt; = arrayOfNulls&lt;Layer&gt;(geographicMapInterfaceArray.length + 1)

            if (features.isFeature(RaceTrackGameFeature.MINI_MAP))
            {
                //if (openGLFeatureUtil.isAnyThreed())
                //{
                    //this.layerArray[0] = ImageMiniMapLayer(miniMap, StaticViewPosition(0, 20, 0))
                //}
                //else
                //{
                layerArray[0] = MiniMapLayer(miniMap, StaticViewPosition(0, 20, 0))
                //}
            }
            else
            {
                layerArray[0] = NullLayer.getInstance()
            }
            */


            <!--if (openGLFeatureUtil.isAnyThreed())
            {-->
                //layerArray[1] = NullLayer.getInstance()

                val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                val player: GDGameLayer = gameGlobals.PlayerGDGameLayerList.get(0) as GDGameLayer
                var geographicMapInterface: BasicGeographicMap = geographicMapInterfaceArray[0]
                val allbinaryTiledLayer: AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer()
                val threedVisibleTiledLayer: AllBinaryThreedVisibleTiledLayer = (allbinaryTiledLayer as AllBinaryThreedVisibleTiledLayer)
                threedVisibleTiledLayer.setTarget(player)

                val layerThreedArray: Array&lt;Layer&gt; = arrayOfNulls&lt;Layer&gt;(geographicMapInterfaceArray.length)

                val size: Int = geographicMapInterfaceArray.length
                for(index in 0 until size) {
                    layerThreedArray[index] = allbinaryTiledLayer
                }

                this.tileLayerThreedPaintable = PaintableLayerComposite(layerThreedArray)
                //this.tileLayerPaintable = PaintableLayerComposite(layerArray)
            <!--}
            else
            {
                this.tileLayerPaintable = PaintableLayerComposite(BasicGeographicMapUtil.getInstance().createAllBinaryTiledLayerArray(geographicMapInterfaceArray, layerArray, 1))
                this.tileLayerPaintable = PaintableLayerComposite(BasicGeographicMapUtil.getInstance().createAllBinaryTiledLayerArray(geographicMapInterfaceArray))
            }-->


        </xsl:if>

        //this.playerLayer = (this.getLayerManager() as GDGameLayerManager).getPlayerLayer()

        //DestroyedEventHandler.getInstance().addListener(playerLayer as EventListenerInterface)

        if (!this.isRunning())
        {
            return
        }

        //gameLayerManager.append(PlayerGameInputGameLayer(0))

        progressCanvas.addNormalPortion(portion, "Ending Custom Build")

        if (gameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
        {
            //PrimaryPlayerQueueFactory.getInstance().add(
                    //GameSounds.getBegin())
        }

        super.buildGame(portion)

        this.getStartIntermissionInterface().setEnabled(true)
        this.getEndLevelIntermissionInterface().setEnabled(false)

        // A canvas not in this.gameStateFactory.PLAYING_GAME_STATE will not appear in
        // democanvas
        this.setGameState(this.gameStateFactory.PLAYING_GAME_STATE)
    }

    fun setGameState(gameState: GameState)
    {
        super.setGameState(gameState)

        var intermissionFactory: IntermissionFactory = IntermissionFactory.getInstance()

        if (this.getGameState() == this.gameStateFactory.PLAYING_GAME_STATE)
        {
            this.setMainStateProcessor(this.getProcessGameProcessor())
        }
        else if (this.getGameState() == intermissionFactory.WAIT_LEVEL_INTERMISSION_GAME_STATE
                || this.getGameState() == intermissionFactory.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE
                || this.getGameState() == intermissionFactory.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE)
        {
            //GameKeyEventHandler.getInstance().addListener(this.getIntermissionPlayerGameInput())

            //this.setMainStateProcessor(this.processEndIntermissionProcessor)
        }
        else
        {
            // Game plays in non intermission and after death
            this.setMainStateProcessor(this.getProcessGameProcessor())
        }
    }

//    private final Paintable paintable =
//            Paintable() {
//        public void paint(Graphics graphics) {
//            final int halfHeight = GameTickDisplayInfoSingleton.getInstance().getLastHalfHeight()
//            graphics.drawString(gyroOrientationSensor.toString(), 0, halfHeight + 30 + 60, 0)
//            graphics.drawString(accelerometerOrientationSensor.toString(), 0, halfHeight + 30 + 75, 0)
//        }
//    }

    private val gamePerformanceInitUpdatePaintable: InitUpdatePaintable =
        //InitUpdatePaintable()
        GamePerformanceInitUpdatePaintable()

    private val gyroOrientationSensor: AllBinaryOrientationSensor = GyroSensorFactory.getInstance()
    private val accelerometerOrientationSensor: AllBinaryOrientationSensor = AccelerometerSensorFactory.getInstance()

    //private String soundQueue = PrimaryPlayerQueueFactory.getInstance().toString()

    //private boolean isFirst = true
    //private final String DRAW = "draw"

    fun draw(graphics: Graphics)
    {

        //if (this.isFirst)
        //{
            //this.isFirst = false
            //logUtil.putF(commonStrings.START, this, DRAW)
        //}

        this.clear(graphics)

        this.basicSetColorUtil.setBasicColorP(graphics, gameLayerManager.getForegroundBasicColor())

        //final int halfHeight = GameTickDisplayInfoSingleton.getInstance().getLastHalfHeight()
        //graphics.drawString(TEXT, 0, halfHeight, 0)

        //graphics.drawString(soundQueue, 0, halfHeight + 15, 0)

        this.tileLayerPaintable.paint(graphics)

        gameLayerManager.paint(graphics, 0, 0)

        nonBotPaintable.paint(graphics)

        gameSpecificPaintable.paint(graphics)

        //gamePerformanceInitUpdatePaintable.paint(graphics)
        //paintable.paint(graphics)

        touchPaintable.paint(graphics)

        screenCapture.saveFrame()

        this.getTouchPaintableP().paint(graphics)
    }

    fun paintThreed(graphics: Graphics)
    {
        this.tileLayerThreedPaintable.paint(graphics)
    }

    private var playerTimeDelayHelper: TimeDelayHelper = TimeDelayHelper(2000)
            //890)

    private val primaryPlayerQueue: PlayerQueue = PrimaryPlayerQueueFactory.getInstance()
    private val secondaryPlayerQueue: PlayerQueue = SecondaryPlayerQueueFactory.getInstance()

    private val features: Features = Features.getInstance()

    private val soundGameFeature: GameFeature = GameFeatureFactory.getInstance().SOUND

    protected fun processGame()
    {
        if (playerTimeDelayHelper.isTimeTNT())
        {
            if(this.features.isFeature(soundGameFeature))
            {
                //this.primaryPlayerQueue.add(TestSound.getInstance())
            }
        }

        super.processGame()

        /*
        if (playerTimeDelayHelper.isTimeTNT())
        {
            if (!this.primaryPlayerQueue.process())
            {
                if (this.secondaryPlayerQueue.process())
                {
                    playerTimeDelayHelper.setStartTime()
                }
            } else
            {
                playerTimeDelayHelper.setStartTime()
            }
        }


        if (!this.primaryPlayerQueue.process())
        {
            this.secondaryPlayerQueue.process()
        }

        */

        //soundQueue = this.primaryPlayerQueue.toString()

        this.gamePerformanceInitUpdatePaintable.update()
    }

    protected fun processPlayingGame() {

        gdNodeStatsFactory.reset()

        musicManager.process()

        this.gameInputProcessor.process(this.gameLayerManager, this.specialAnimation)

        super.processPlayingGame()

        <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >

        //Some games update backgrounds here
        val geographicMapCompositeInterface: GeographicMapCompositeInterface =
            this.getLayerManager() as GeographicMapCompositeInterface

        val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; =
            geographicMapCompositeInterface.getGeographicMapInterface()

        lateinit var geographicMapInterface: GDGeographicMap
        val size: Int = geographicMapInterfaceArray.length
        for(index in 0 until size) {
            geographicMapInterface = geographicMapInterfaceArray as GDGeographicMap[index]
            geographicMapInterface.update()
        }

        </xsl:if>

        this.specialAnimation.process()

        gdNodeStatsFactory.log(stringBuilder, this)
    }

    override fun nextSong(nextSongSound: Sound, leftVolume: Int, rightVolume: Int) {
        musicManager.nextSong(nextSongSound, leftVolume, rightVolume)
    }

    override fun endGameThread()
    {
        super.endGameThread()

        musicManager.stop()
    }

    fun addCommands()
    {
        val gdGameCommandFactory: GDGameCommandFactory = GDGameCommandFactory.getInstance()
        val gameCommandsFactory: GameCommandsFactory = GameCommandsFactory.getInstance()
        val myCommandsFactory: MyCommandsFactory = MyCommandsFactory.getInstance()

        if (DebugFactory.getInstance() != NoDebug.getInstance())
        {
            this.addCommand(gameCommandsFactory.START_TRACE)
        }

        this.addCommand(gameCommandsFactory.RESTART_COMMAND)

        this.addCommand(myCommandsFactory.PAUSE_COMMAND)

        this.addCommand(gameCommandsFactory.QUIT_COMMAND)

        <xsl:for-each select="../layouts" >
            <xsl:variable name="name2" ><xsl:value-of select="translate(name, '_', ' ')" /></xsl:variable>
            <xsl:variable name="name3" >GDGame<xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
            <xsl:variable name="name" ><xsl:value-of select="translate($name3, ' ', '')" /></xsl:variable>
            <xsl:if test="contains(name, 'in_game_options')" >
        this.addCommand(gdGameCommandFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_GD_LAYOUT)
            </xsl:if>
        </xsl:for-each>

        //boolean isOverScan = OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan()

        //final Features features = Features.getInstance()

        //if(!J2MEUtil.isHTML() and !isOverScan)
        //{
            //if (TouchScreenFactory.getInstance().isTouch() and InGameFeatures().isAny())
            //{
            //    // System.out.println("InGameOptions")
            //    this.addCommand(InGameOptionsForm.DISPLAY)
            //}

            //// this.addCommand(GameCommands.DISPLAY_SAVE_FORM)
            //this.addCommand(gameCommandsFactory.SAVE)
            //this.addCommand(gameCommandsFactory.DISPLAY_LOAD_FORM)
        //}
    }

    fun handleRawKey(keyCode: Int, deviceId: Int, repeated: Boolean) {
        //final Integer keyCodeAsInteger = smallIntegerSingletonFactory.getInstance(keyCode)
        //this.upKeyEventHandler.fireEvent(keyCodeAsInteger)
        //this.upKeyEventHandler.getInstance(deviceId).fireEvent(keyCodeAsInteger)
    }

    fun addKeyInputListener(playerGameInput: PlayerGameInput) {
        super.addKeyInputListener(playerGameInput)

        this.downKeyEventHandler.getInstanceForPlayer(playerGameInput.getPlayerInputId()).addListenerSingleThreaded(playerGameInput)
        this.upKeyEventHandler.getInstanceForPlayer(playerGameInput.getPlayerInputId()).addListenerSingleThreaded(playerGameInput)
    }

    <xsl:if test="number($layoutIndex) != 1" >
    //Do not remove on build for this layout
    protected fun removeAllGameKeyInputListenersOnBuild() {
    }
    </xsl:if>

    fun removeKeyInputListener(playerGameInput: PlayerGameInput) {
        super.removeKeyInputListener(playerGameInput)

        this.downKeyEventHandler.removeListener(playerGameInput)
        this.upKeyEventHandler.removeListener(playerGameInput)
    }

    fun setRunning(running: Boolean)
    {
        super.setRunning(running)

        try
        {
            val features: Features = Features.getInstance()

            //If game thread is not actually running
            if ((features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL) || J2MEUtil.isHTML())
                    <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> !running)
            {
                val currentDisplayableFactory: CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                currentDisplayableFactory.clearRunnable()
                this.end()
            }
        } catch(e: Exception)
        {
            logUtil.put(commonStrings.EXCEPTION, this, SET_RUNNING, e)
        }
    }

    //Special end case for GDevelop
    fun end2() {
//        try {
//            logUtil.putF(this.commonStrings.END, this, this.commonStrings.END)
//            this.cleanupGame()
//            this.specialAnimation = SpecialAnimation.getInstance()
//            this.setGameSpecificPaintableP(NullPaintable.getInstance())
//        } catch(e: Exception)
//        {
//            logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.END, e)
//        }
    }

    //Special end case for GDevelop
    fun end() {
        try {
            super.end()
            musicManager.stop()
            this.cleanupManager()
            this.specialAnimation.reset()
            //GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.getInstance().clear()
            GDGameGlobals.getInstance().reset()
            logUtil.putF(this.commonStrings.END, this, this.commonStrings.END)
        } catch(e: Exception)
        {
            logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.END, e)
        }
    }

    protected fun cleanupGame()
    {
        super.cleanupGame()

        if (OpenGLFeatureUtil.getInstance().isAnyThreed())
        {
            var sceneController: AllBinarySceneController = GDGameAllBinarySceneControllerFactory.getInstance()
            sceneController.clear()
        }

        gameLayerManager.cleanup()
    }

}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
