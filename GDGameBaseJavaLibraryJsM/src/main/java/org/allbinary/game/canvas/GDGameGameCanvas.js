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
//not GWT import const CommandListener
import { Font } from '../../../../javax/microedition/lcdui/Font.js';
//not GWT import const Graphics
import { GDGameStaticInitializerFactory } from '../../../../org/allbinary/game/init/GDGameStaticInitializerFactory.js';
//not GWT import const GameStateFactory
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
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
import { OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer } from '../../../../org/allbinary/ai/OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer.js';
//not GWT import const GameInfo
import { GameTypeFactory } from '../../../../org/allbinary/game/GameTypeFactory.js';
//not GWT import const GameTypeFactory
import { IntermissionFactory } from '../../../../org/allbinary/game/IntermissionFactory.js';
//not GWT import const IntermissionFactory
import { OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer } from '../../../../org/allbinary/game/collision/OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer.js';
//not GWT import const CombatGameCanvas
import { GameSpeed } from '../../../../org/allbinary/game/configuration/GameSpeed.js';
//not GWT import const GameSpeed
import { ChangedGameFeatureListener } from '../../../../org/allbinary/game/configuration/event/ChangedGameFeatureListener.js';
//not GWT import const ChangedGameFeatureListener
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const GameFeature
import { GameFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory
import { TouchFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/TouchFeatureFactory.js';
//not GWT import const TouchFeatureFactory
import { AllBinaryGameCanvas } from '../../../../org/allbinary/game/displayable/canvas/AllBinaryGameCanvas.js';
//not GWT import const AllBinaryGameCanvas
import { GamePerformanceInitUpdatePaintable } from '../../../../org/allbinary/game/displayable/canvas/GamePerformanceInitUpdatePaintable.js';
//not GWT import const GamePerformanceInitUpdatePaintable
import { StartIntermissionPaintable } from '../../../../org/allbinary/game/displayable/canvas/StartIntermissionPaintable.js';
//not GWT import const StartIntermissionPaintable
import { OptimizedGameInputLayerProcessorForCollidableLayer } from '../../../../org/allbinary/game/input/OptimizedGameInputLayerProcessorForCollidableLayer.js';
//not GWT import const AllBinaryGameLayerManager
import { PlayerGameInputGameLayer } from '../../../../org/allbinary/game/layer/PlayerGameInputGameLayer.js';
//not GWT import const PlayerGameInputGameLayer
import { GroupLayerManagerListener } from '../../../../org/allbinary/game/layer/identification/GroupLayerManagerListener.js';
//not GWT import const GroupLayerManagerListener
import { BasicHighScoresFactory } from '../../../../org/allbinary/game/score/BasicHighScoresFactory.js';
//not GWT import const GameState
import { OptimizedTickableLayerProcessor } from '../../../../org/allbinary/game/tick/OptimizedTickableLayerProcessor.js';
//not GWT import const ProgressCanvas
import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
import { GameTickDisplayInfoSingleton } from '../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton
import { MyCommandsFactory } from '../../../../org/allbinary/graphics/displayable/command/MyCommandsFactory.js';
//not GWT import const BaseTouchInput
import { GDGameNeededTouchButtonsBuilder } from '../../../../org/allbinary/input/motion/button/GDGameNeededTouchButtonsBuilder.js';
//not GWT import const GDGameNeededTouchButtonsBuilder
import { GDGameTouchButtonsBuilder } from '../../../../org/allbinary/input/motion/button/GDGameTouchButtonsBuilder.js';
//not GWT import const AbeClientInformationInterface
import { AllBinaryVibration } from '../../../../org/allbinary/media/AllBinaryVibration.js';
//not GWT import const AllBinaryVibration
import { AllBinaryMediaManager } from '../../../../org/allbinary/media/audio/AllBinaryMediaManager.js';
//not GWT import const PlayerQueue
import { PrimaryPlayerQueueFactory } from '../../../../org/allbinary/media/audio/PrimaryPlayerQueueFactory.js';
//not GWT import const PrimaryPlayerQueueFactory
import { SecondaryPlayerQueueFactory } from '../../../../org/allbinary/media/audio/SecondaryPlayerQueueFactory.js';
//not GWT import const SecondaryPlayerQueueFactory
import { TimeDelayHelper } from '../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameSoftwareInfo } from './GDGameSoftwareInfo.js';
//not GWT import - same folder const GDGameSoftwareInfo
export class GDGameGameCanvas extends AllBinaryGameCanvas {
    constructor(abeClientInformation, commandListener, allBinaryGameLayerManager) {
        super(commandListener, allBinaryGameLayerManager, new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()), new GDGameStaticInitializerFactory(), false);
        this.WAIT = GameSpeed.getInstance().getDelay();
        this.portion = 4;
        this.gamePerformanceInitUpdatePaintable = new GamePerformanceInitUpdatePaintable();
        this.gyroOrientationSensor = GyroSensorFactory.getInstance();
        this.accelerometerOrientationSensor = AccelerometerSensorFactory.getInstance();
        this.playerTimeDelayHelper = new TimeDelayHelper(2000);
        this.primaryPlayerQueue = PrimaryPlayerQueueFactory.getInstance();
        this.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance();
        this.features = Features.getInstance();
        this.soundGameFeature = GameFeatureFactory.getInstance().SOUND;
        //For kotlin this is before the body of the constructor.
        this.abeClientInformation = abeClientInformation;
    }
    constructor(abeClientInformation, allBinaryGameLayerManager) {
        this.WAIT = GameSpeed.getInstance().getDelay();
        this.portion = 4;
        this.gamePerformanceInitUpdatePaintable = new GamePerformanceInitUpdatePaintable();
        this.gyroOrientationSensor = GyroSensorFactory.getInstance();
        this.accelerometerOrientationSensor = AccelerometerSensorFactory.getInstance();
        this.playerTimeDelayHelper = new TimeDelayHelper(2000);
        this.primaryPlayerQueue = PrimaryPlayerQueueFactory.getInstance();
        this.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance();
        this.features = Features.getInstance();
        this.soundGameFeature = GameFeatureFactory.getInstance().SOUND;
        this(abeClientInformation, null, allBinaryGameLayerManager);
        //For kotlin this is before the body of the constructor.
    }
    initSpecialPaint() {
        super.initSpecialPaint();
        //inner=true member= isStatic=
        class GDStartIntermissionPaintable extends StartIntermissionPaintable {
            constructor(combatGameCanvas) {
                super(combatGameCanvas, [
                    StringUtil.getInstance().EMPTY_STRING
                ], BasicColorFactory.getInstance().RED, Font.getDefaultFont());
                //For kotlin this is before the body of the constructor.
                this.lineYOffsetArray = [0];
            }
        }
        //Otherwise - statement - EmptyStmt
        this.setStartIntermissionPaintable(new GDStartIntermissionPaintable(this));
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
        if (gameInfo.getGameType() != GameTypeFactory.getInstance().BOT) {
            var nextTouchInputFactory = GDGameTouchButtonsBuilder.getInstance(this.getSensorGameUpdateProcessor());
            ;
            if (Features.getInstance().isFeature(TouchFeatureFactory.getInstance().AUTO_HIDE_SHOW_SCREEN_BUTTONS)) {
                if (gameInfo.getCurrentLevel() - getStartLevel() >= 1) {
                    nextTouchInputFactory = GDGameNeededTouchButtonsBuilder.getInstance(this.getSensorGameUpdateProcessor());
                }
            }
            this.updateCurrentTouchInputFactory(nextTouchInputFactory);
        }
    }
    //@Throws(Exception.constructor)
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    initConfigurable(abeClientInformation) {
        try {
            var progressCanvas = ProgressCanvasFactory.getInstance();
            ;
            if (ChangedGameFeatureListener.getInstance().isChanged()) {
                super.initConfigurable(abeClientInformation);
                progressCanvas.addNormalPortion(portion, "Group Manager");
                GroupLayerManagerListener.getInstance().init(3);
                AllBinaryVibration.init();
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
            super.initApp(abeClientInformation);
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
                if (features.isFeature(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR)) {
                    list.add(new OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer());
                }
                if (features.isFeature(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR)) {
                    list.add(new OptimizedTickableLayerProcessor());
                }
                gameLayerManager.setLayerProcessorList(list);
                progressCanvas.addNormalPortion(portion, "Initializing Game");
            }
            this.buildGameInit(false);
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, "_init", e);
        }
    }
    //@Throws(Exception.constructor)
    buildGameInit(isProgress) {
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
        gameLayerManager.cleanup();
        if (!this.isRunning()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        progressCanvas.addNormalPortion(portion, "Building Game Level");
        progressCanvas.addNormalPortion(portion, "Set Background");
        if (!this.isRunning()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        gameLayerManager.append(new PlayerGameInputGameLayer(0));
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
        gameLayerManager.paint(graphics, 0, 0);
        nonBotPaintable.paint(graphics);
        gameSpecificPaintable.paint(graphics);
        gamePerformanceInitUpdatePaintable.paint(graphics);
        touchPaintable.paint(graphics);
        screenCapture.saveFrame();
        var halfHeight = GameTickDisplayInfoSingleton.getInstance().getLastHalfHeight();
        ;
        graphics.drawString(this.gyroOrientationSensor.toString(), 0, halfHeight + 30 + 60, 0);
        graphics.drawString(this.accelerometerOrientationSensor.toString(), 0, halfHeight + 30 + 75, 0);
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
}
