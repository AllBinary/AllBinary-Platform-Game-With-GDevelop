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
//not GWT import const Graphics
import { J2MEUtil } from '../../../../org/allbinary/J2MEUtil.js';
//not GWT import const J2MEUtil
import { GDGameStaticInitializerFactory } from '../../../../org/allbinary/game/init/GDGameStaticInitializerFactory.js';
//not GWT import const GDGameStaticInitializerFactory
import { GDGameTitleLevelBuilder } from '../../../../org/allbinary/game/level/GDGameTitleLevelBuilder.js';
//not GWT import const GDGameTitleLevelBuilder
import { AccelerometerSensorFactory } from '../../../../org/allbinary/input/accelerometer/AccelerometerSensorFactory.js';
//not GWT import const AllBinaryOrientationSensor
import { GyroSensorFactory } from '../../../../org/allbinary/input/gyro/GyroSensorFactory.js';
//not GWT import const GyroSensorFactory
import { GDGameSoundsFactory } from '../../../../org/allbinary/media/audio/GDGameSoundsFactory.js';
//not GWT import const GDGameSoundsFactory
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer } from '../../../../org/allbinary/ai/OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer.js';
//not GWT import const OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer
import { SpecialAnimation } from '../../../../org/allbinary/animation/special/SpecialAnimation.js';
//not GWT import const GameInfo
import { GameTypeFactory } from '../../../../org/allbinary/game/GameTypeFactory.js';
//not GWT import const GameTypeFactory
import { IntermissionFactory } from '../../../../org/allbinary/game/IntermissionFactory.js';
//not GWT import const FullScreenUtil
import { DebugFactory } from '../../../../org/allbinary/debug/DebugFactory.js';
//not GWT import const DebugFactory
import { NoDebug } from '../../../../org/allbinary/debug/NoDebug.js';
//not GWT import const NoDebug
import { GDGameCommandFactory } from '../../../../org/allbinary/game/GDGameCommandFactory.js';
//not GWT import const OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer
import { GameSpeed } from '../../../../org/allbinary/game/configuration/GameSpeed.js';
//not GWT import const GameSpeed
import { ChangedGameFeatureListener } from '../../../../org/allbinary/game/configuration/event/ChangedGameFeatureListener.js';
//not GWT import const ChangedGameFeatureListener
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const GameFeature
import { GameFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const AllBinaryGameCanvas
import { CombatGameCanvas } from '../../../../org/allbinary/game/combat/canvas/CombatGameCanvas.js';
//not GWT import const CombatGameCanvas
import { GameCommandsFactory } from '../../../../org/allbinary/game/commands/GameCommandsFactory.js';
//not GWT import const GameCommandsFactory
import { BaseMenuBehavior } from '../../../../org/allbinary/game/displayable/canvas/BaseMenuBehavior.js';
//not GWT import const BaseMenuBehavior
import { GamePerformanceInitUpdatePaintable } from '../../../../org/allbinary/game/displayable/canvas/GamePerformanceInitUpdatePaintable.js';
//not GWT import const PlayerGameInput
import { DownKeyEventHandler } from '../../../../org/allbinary/game/input/event/DownKeyEventHandler.js';
//not GWT import const DownKeyEventHandler
import { UpKeyEventHandler } from '../../../../org/allbinary/game/input/event/UpKeyEventHandler.js';
//not GWT import const UpKeyEventHandler
import { OptimizedGameInputLayerProcessorForCollidableLayer } from '../../../../org/allbinary/game/input/OptimizedGameInputLayerProcessorForCollidableLayer.js';
//not GWT import const PlayerGameInputGameLayer
import { GroupLayerManagerListener } from '../../../../org/allbinary/game/layer/identification/GroupLayerManagerListener.js';
//not GWT import const BaseGDNodeStats
import { GDNodeStatsFactory } from '../../../../org/allbinary/game/layout/GDNodeStatsFactory.js';
//not GWT import const GDGeographicMap
import { GDResources } from '../../../../org/allbinary/game/gd/resource/GDResources.js';
//not GWT import const BasicHighScoresFactory
import { NoHighScoresFactory } from '../../../../org/allbinary/game/score/NoHighScoresFactory.js';
//not GWT import const GameState
import { OptimizedTickableLayerProcessor } from '../../../../org/allbinary/game/tick/OptimizedTickableLayerProcessor.js';
//not GWT import const ProgressCanvas
import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const BasicColorFactory
import { SmallBasicColorCacheFactory } from '../../../../org/allbinary/graphics/color/SmallBasicColorCacheFactory.js';
//not GWT import const SmallBasicColorCacheFactory
import { BasicColorUtil } from '../../../../org/allbinary/graphics/color/BasicColorUtil.js';
//not GWT import const GameTickDisplayInfoSingleton
import { MyCommandsFactory } from '../../../../org/allbinary/graphics/displayable/command/MyCommandsFactory.js';
//not GWT import const MyCommandsFactory
import { MusicManagerFactory } from '../../../../org/allbinary/media/audio/music/MusicManagerFactory.js';
//not GWT import const MusicManagerFactory
import { GameNotificationEventHandler } from '../../../../org/allbinary/game/layer/hud/event/GameNotificationEventHandler.js';
//not GWT import const GameNotificationEventHandler
import { CurrentDisplayableFactory } from '../../../../org/allbinary/graphics/opengles/CurrentDisplayableFactory.js';
//not GWT import const CurrentDisplayableFactory
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory
import { NullPaintable } from '../../../../org/allbinary/graphics/paint/NullPaintable.js';
//not GWT import const InitUpdatePaintable
import { NullInitUpdatePaintable } from '../../../../org/allbinary/graphics/paint/NullInitUpdatePaintable.js';
//not GWT import const NullPaintable
import { Paintable } from '../../../../org/allbinary/graphics/paint/Paintable.js';
//not GWT import const ImageCache
import { ImageCacheFactory } from '../../../../org/allbinary/image/ImageCacheFactory.js';
//not GWT import const ImageCacheFactory
import { LayerManagerEventHandler } from '../../../../org/allbinary/layer/event/LayerManagerEventHandler.js';
//not GWT import const LayerManagerEventHandler
import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory
import { AllBinaryVibration } from '../../../../org/allbinary/media/AllBinaryVibration.js';
//not GWT import const AllBinaryVibration
import { AllBinaryMediaManager } from '../../../../org/allbinary/media/audio/AllBinaryMediaManager.js';
//not GWT import const AllBinaryMediaManager
import { GameProcessor } from '../../../../org/allbinary/game/displayable/canvas/GameProcessor.js';
//not GWT import const GameProcessor
import { InitGameProcessor } from '../../../../org/allbinary/game/displayable/canvas/InitGameProcessor.js';
//not GWT import const GD1LayoutUtil
import { GD1GameMusicFactory } from '../../../../org/allbinary/media/audio/GD1GameMusicFactory.js';
//not GWT import const PlayerQueue
import { PrimaryPlayerQueueFactory } from '../../../../org/allbinary/media/audio/PrimaryPlayerQueueFactory.js';
//not GWT import const PrimaryPlayerQueueFactory
import { SecondaryPlayerQueueFactory } from '../../../../org/allbinary/media/audio/SecondaryPlayerQueueFactory.js';
//not GWT import const GeographicMapCompositeInterface
import { TimeDelayHelper } from '../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not GWT import const AbeClientInformationInterface
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameInputProcessor } from './GDGameInputProcessor.js';
//not GWT import - same folder const GDGameInputProcessor
import { GD1SpecialAnimation } from './GD1SpecialAnimation.js';
//not GWT import - same folder const GD1SpecialAnimation
import { GDGameGlobals } from './GDGameGlobals.js';
//not GWT import - same folder const GDGameGlobals
export class GDGameTitleCanvas extends CombatGameCanvas {
    constructor(abeClientInformation, commandListener, allBinaryGameLayerManager) {
        super(commandListener, allBinaryGameLayerManager, NoHighScoresFactory.getInstance(), new GDGameStaticInitializerFactory(), false);
        this.basicColorUtil = BasicColorUtil.getInstance();
        this.smallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance();
        this.imageCache = ImageCacheFactory.getInstance();
        this.GD_LAYOUT_COLOR = "GDLayout2Color";
        this.WAIT = GameSpeed.getInstance().getDelay();
        this.portion = 4;
        this.gdResources = GDResources.getInstance();
        this.gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
        this.stringBuilder = new StringMaker();
        this.specialAnimation = SpecialAnimation.getInstance();
        this.tileLayerPaintable = NullPaintable.getInstance();
        this.gameInputProcessor = new GDGameInputProcessor();
        this.downKeyEventHandler = DownKeyEventHandler.getInstance();
        this.upKeyEventHandler = UpKeyEventHandler.getInstance();
        this.smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        this.initGameProcessor = new InitGameProcessor(this);
        this.gamePerformanceInitUpdatePaintable = new GamePerformanceInitUpdatePaintable();
        this.gyroOrientationSensor = GyroSensorFactory.getInstance();
        this.accelerometerOrientationSensor = AccelerometerSensorFactory.getInstance();
        this.playerTimeDelayHelper = new TimeDelayHelper(2000);
        this.primaryPlayerQueue = PrimaryPlayerQueueFactory.getInstance();
        this.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance();
        this.features = Features.getInstance();
        this.soundGameFeature = GameFeatureFactory.getInstance().SOUND;
        //For kotlin this is before the body of the constructor.
        this.imageCache.initProgress();
        this.gdResources.currentLayoutRequiredTotal = this.gdResources.resourceStringArray.length;
        this.abeClientInformation = abeClientInformation;
        musicManager = MusicManagerFactory.createMusicManager(GD1GameMusicFactory.getInstance().soundList);
        this.cleanupGame();
        LayerManagerEventHandler.getInstance().addListener(GroupLayerManagerListener.getInstance());
        var backgroundBasicColor = smallBasicColorCacheFactory.getAndOrCreate(basicColorUtil.getARGB(255, 209, 209, 209));
        ;
        var foregroundBasicColor = smallBasicColorCacheFactory.getAndOrCreate(basicColorUtil.getARGB(255, 255 - backgroundBasicColor.red, 255 - backgroundBasicColor.green, 255 - backgroundBasicColor.blue));
        ;
        this.gameLayerManager.setBackgroundBasicColor(backgroundBasicColor);
        this.gameLayerManager.setForegroundBasicColor(foregroundBasicColor);
    }
    getInGameMenuBehavior() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return BaseMenuBehavior.getInstance();
        ;
    }
    setProcessGameProcessorInit() {
        if (ProgressCanvasFactory.getInstance().isInGame()) {
            this.setProcessGameProcessor(new GameProcessor(this));
            if (this.getMainStateProcessor() == initGameProcessor) {
                if (this.getGameState() == this.gameStateFactory.PLAYING_GAME_STATE) {
                    this.setMainStateProcessor(this.getProcessGameProcessor());
                }
            }
        }
        else {
            this.setProcessGameProcessor(initGameProcessor);
        }
    }
    setPlayingGameState() {
        this.setWait(WAIT);
        this.setGameSpecificPaintableP(new class extends Paintable {
            constructor() {
                super(...arguments);
                this.specialAnimation = GD1SpecialAnimation.getInstance();
            }
            paint(graphics) {
                specialAnimation.paintXY(graphics, 0, 0);
            }
            paintThreed(graphics) {
                specialAnimation.paintThreedXYZ(graphics, 0, 0, 0);
            }
        });
    }
    open() {
        super.open();
        this.specialAnimation.open();
    }
    close() {
        super.close();
        this.specialAnimation.close();
    }
    initSpecialPaint() {
        super.initSpecialPaint();
        GameNotificationEventHandler.getInstance().enabled = false;
        this.setStartIntermissionPaintable(NullInitUpdatePaintable.getInstance());
    }
    //@Throws(Exception.constructor)
    mediaInit() {
        logUtil.putF(commonStrings.START, this, "mediaInit");
        AllBinaryMediaManager.init(GDGameSoundsFactory.getInstance());
    }
    //@Throws(Exception.constructor)
    updateTouch() {
        var gameInfo = this.gameLayerManager.getGameInfo();
        ;
    }
    //@Throws(Exception.constructor)
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    initConfigurable(abeClientInformation) {
        try {
            var progressCanvas = ProgressCanvasFactory.getInstance();
            ;
            if (ChangedGameFeatureListener.getInstance().isChanged()) {
                super.initConfigurable(abeClientInformation);
                AllBinaryVibration.init();
                super.initConfigurablePortion(portion);
                ChangedGameFeatureListener.getInstance().setChanged(false);
                if (!this.isRunning()) {
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return;
                }
            }
            else {
                progressCanvas.addNormalPortion(4, "Skipping Configurable");
            }
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, "initConfigurable", e);
        }
    }
    //@Throws(Exception.constructor)
    threadInit() {
        try {
            var portion = 60;
            ;
            super.initApp(this.abeClientInformation);
            if (!this.isRunning()) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
            if (!this.isInitialized()) {
                if (!this.isRunning()) {
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return;
                }
                var progressCanvas = ProgressCanvasFactory.getInstance();
                ;
                progressCanvas.addNormalPortion(portion, "Main Processors");
                this.setWait(WAIT);
                this.loadState();
                var list = new BasicArrayListD();
                ;
                var features = Features.getInstance();
                ;
                var gameFeatureFactory = GameFeatureFactory.getInstance();
                ;
                if (features.isFeature(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR)) {
                    list.add(new OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer());
                }
                if (features.isFeature(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR)) {
                    list.add(new OptimizedGameInputLayerProcessorForCollidableLayer());
                }
                if (features.isFeature(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR)) {
                    list.add(new OptimizedTickableLayerProcessor());
                }
                gameLayerManager.setLayerProcessorList(list);
                progressCanvas.addNormalPortion(portion, "Initializing Game");
            }
            this.addPlayerGameInput(this.gameInputProcessor.getPlayerGameInput());
            this.buildGame(false);
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, "_init", e);
        }
    }
    //@Throws(Exception.constructor)
    buildGame(isProgress) {
        this.specialAnimation = GD1SpecialAnimation.getInstance(this, gameLayerManager);
        this.setPlayingGameState();
        this.loadResources(gameLayerManager.getGameInfo().getCurrentLevel());
        var progressCanvas = ProgressCanvasFactory.getInstance();
        ;
        var portion = 30;
        ;
        if (isProgress && this.isMainCanvas()) {
            progressCanvas.start();
            this.getCustomCommandListener().commandAction(MyCommandsFactory.getInstance().SET_DISPLAYABLE, progressCanvas);
            portion = 4;
        }
        PrimaryPlayerQueueFactory.getInstance().clear();
        SecondaryPlayerQueueFactory.getInstance().clear();
        if (!this.isRunning()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        progressCanvas.addNormalPortion(portion, "Building Game Level");
        var layerManager = this.getLayerManager();
        ;
        new GDGameTitleLevelBuilder(layerManager).build();
        progressCanvas.addNormalPortion(portion, "Set Background");
        if (!this.isRunning()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        progressCanvas.addNormalPortion(portion, "Ending Custom Build");
        if (gameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT) {
        }
        super.buildGame(portion);
        this.getStartIntermissionInterface().setEnabled(true);
        this.getEndLevelIntermissionInterface().setEnabled(false);
        this.setGameState(this.gameStateFactory.PLAYING_GAME_STATE);
    }
    //@Throws(Exception.constructor)
    setGameState(gameState) {
        super.setGameState(gameState);
        var intermissionFactory = IntermissionFactory.getInstance();
        ;
        if (this.getGameState() == this.gameStateFactory.PLAYING_GAME_STATE) {
            this.setMainStateProcessor(this.getProcessGameProcessor());
        }
        else if (this.getGameState() == intermissionFactory.WAIT_LEVEL_INTERMISSION_GAME_STATE || this.getGameState() == intermissionFactory.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE || this.getGameState() == intermissionFactory.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE) {
        }
        else {
            this.setMainStateProcessor(this.getProcessGameProcessor());
        }
    }
    draw(graphics) {
        this.clear(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, gameLayerManager.getForegroundBasicColor());
        this.tileLayerPaintable.paint(graphics);
        gameLayerManager.paint(graphics, 0, 0);
        nonBotPaintable.paint(graphics);
        gameSpecificPaintable.paint(graphics);
        touchPaintable.paint(graphics);
        screenCapture.saveFrame();
        this.getTouchPaintableP().paint(graphics);
    }
    //@Throws(Exception.constructor)
    processGame() {
        if (playerTimeDelayHelper.isTimeTNT()) {
            if (this.features.isFeature(soundGameFeature)) {
            }
        }
        super.processGame();
        this.gamePerformanceInitUpdatePaintable.update();
    }
    //@Throws(Exception.constructor)
    processPlayingGame() {
        gdNodeStatsFactory.reset();
        musicManager.process();
        this.gameInputProcessor.process(this.gameLayerManager, this.specialAnimation);
        super.processPlayingGame();
        this.specialAnimation.process();
        gdNodeStatsFactory.log(stringBuilder, this);
    }
    nextSong(nextSongSound, leftVolume, rightVolume) {
        musicManager.nextSong(nextSongSound, leftVolume, rightVolume);
    }
    //@Throws(Exception.constructor)
    endGameThread() {
        super.endGameThread();
        musicManager.stop();
    }
    addCommands() {
        var gdGameCommandFactory = GDGameCommandFactory.getInstance();
        ;
        var gameCommandsFactory = GameCommandsFactory.getInstance();
        ;
        var myCommandsFactory = MyCommandsFactory.getInstance();
        ;
        if (DebugFactory.getInstance() != NoDebug.getInstance()) {
            this.addCommand(gameCommandsFactory.START_TRACE);
        }
        this.addCommand(gameCommandsFactory.RESTART_COMMAND);
        this.addCommand(myCommandsFactory.PAUSE_COMMAND);
        this.addCommand(gameCommandsFactory.QUIT_COMMAND);
    }
    //@Throws(Exception.constructor)
    handleRawKey(keyCode, deviceId, repeated) {
    }
    addKeyInputListener(playerGameInput) {
        super.addKeyInputListener(playerGameInput);
        this.downKeyEventHandler.getInstanceForPlayer(playerGameInput.getPlayerInputId()).addListenerSingleThreaded(playerGameInput);
        this.upKeyEventHandler.getInstanceForPlayer(playerGameInput.getPlayerInputId()).addListenerSingleThreaded(playerGameInput);
    }
    removeKeyInputListener(playerGameInput) {
        super.removeKeyInputListener(playerGameInput);
        this.downKeyEventHandler.removeListener(playerGameInput);
        this.upKeyEventHandler.removeListener(playerGameInput);
    }
    setRunning(running) {
        super.setRunning(running);
        try {
            var features = Features.getInstance();
            ;
            if ((features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL) || J2MEUtil.isHTML()) && !running) {
                var currentDisplayableFactory = CurrentDisplayableFactory.getInstance();
                ;
                currentDisplayableFactory.clearRunnable();
                this.end();
            }
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, SET_RUNNING, e);
        }
    }
    end2() {
    }
    end() {
        try {
            super.end();
            musicManager.stop();
            this.cleanupManager();
            this.specialAnimation.reset();
            GDGameGlobals.getInstance().reset();
            logUtil.putF(this.commonStrings.END, this, this.commonStrings.END);
            //: 
        }
        catch (e) {
            logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.END, e);
        }
    }
}
