/* Generated Code Do Not Modify */
import { GDGameSoftwareInfo } from '../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { GameConfigurationCentral } from '../../org/allbinary/game/configuration/GameConfigurationCentral.js';
//not GWT import const GameConfigurationCentral
import { Features } from '../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features
import { GameFeatureFactory } from '../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory
import { GraphicsFeatureFactory } from '../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory
import { InputFeatureFactory } from '../../org/allbinary/game/configuration/feature/InputFeatureFactory.js';
//not GWT import const InputFeatureFactory
import { SensorFeatureFactory } from '../../org/allbinary/game/configuration/feature/SensorFeatureFactory.js';
//not GWT import const SensorFeatureFactory
import { AllMotionRecognizer } from '../../org/allbinary/input/motion/AllMotionRecognizer.js';
//not GWT import const BasicMotionGesturesHandler
import { GameMotionGestureListener } from '../../org/allbinary/input/motion/gesture/observer/GameMotionGestureListener.js';
//not GWT import const GameMotionGestureListener
import { MotionGestureReceiveInterfaceFactory } from '../../org/allbinary/input/motion/gesture/observer/MotionGestureReceiveInterfaceFactory.js';
//not GWT import const MotionGestureReceiveInterfaceFactory
import { SmallIntegerSingletonFactory } from '../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory
import { EarlySoundsFactory } from '../../org/allbinary/media/audio/EarlySoundsFactory.js';
//not GWT import const EarlySoundsFactory
import { Sounds } from '../../org/allbinary/media/audio/Sounds.js';
//not GWT import const Sounds
import { DefaultGameInitializationListener } from '../../org/allbinary/game/init/DefaultGameInitializationListener.js';
//not GWT import const DefaultGameInitializationListener
import { RawKeyEventHandler } from '../../org/allbinary/game/input/event/RawKeyEventHandler.js';
//not GWT import const RawKeyEventHandler
import { GDGameMotionGestureListener } from '../../org/allbinary/input/motion/gesture/observer/GDGameMotionGestureListener.js';
//not GWT import const GDGameMotionGestureListener
//not plain js import { CommonLabels } 
const CommonLabels = globalThis.org.allbinary.string.CommonLabels;
import { GDGameClientInformationInterfaceFactory } from '../../org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory
import { GDGameSoundsFactory } from '../../org/allbinary/media/audio/GDGameSoundsFactory.js';
//not GWT import const GDGameSoundsFactory
//not plain js import { PlayN2InputConnector } 
const PlayN2InputConnector = globalThis.org.allbinary.playn.PlayN2InputConnector;
//not plain js import { PlayNToAllBinaryKeyInputUtil } 
const PlayNToAllBinaryKeyInputUtil = globalThis.org.allbinary.playn.input.PlayNToAllBinaryKeyInputUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
//not plain js - same folder import { GDGameMIDlet } 
const GDGameMIDlet = globalThis.playn.core.GDGameMIDlet;
//not plain js - same folder import { PlayN2InputInterface } 
const PlayN2InputInterface = globalThis.playn.core.PlayN2InputInterface;
//not plain js - same folder import { TypedEvent } 
const TypedEvent = globalThis.playn.core.TypedEvent;
//not plain js - same folder import { Keyboard } 
const Keyboard = globalThis.playn.core.Keyboard;
//not plain js - same folder import { Key } 
const Key = globalThis.playn.core.Key;
//not plain js - same folder import { KeyEvent } 
const KeyEvent = globalThis.playn.core.KeyEvent;
//not plain js - same folder import { Event } 
const Event = globalThis.playn.core.Event;
//not plain js - same folder import { Pointer } 
const Pointer = globalThis.playn.core.Pointer;
//not plain js - same folder import { ButtonEvent } 
const ButtonEvent = globalThis.playn.core.ButtonEvent;
//not plain js - same folder import { Mouse } 
const Mouse = globalThis.playn.core.Mouse;
//not plain js - same folder import { MotionEvent } 
const MotionEvent = globalThis.playn.core.MotionEvent;
//not plain js - same folder import { WheelEvent } 
const WheelEvent = globalThis.playn.core.WheelEvent;
export class GDGame extends org.allbinary.game.GDGameMIDlet {
    constructor() {
        super(GDGameClientInformationInterfaceFactory.getFactoryInstance());
        this.logUtil = LogUtil.getInstance();
        this.DEVICE_ID = 0;
        this.playNToAllBinaryKeyInputUtil = PlayNToAllBinaryKeyInputUtil.getInstance();
        this.rawKeyEventHandler = RawKeyEventHandler.getInstance();
        this.motionRecognizer = new AllMotionRecognizer();
        //For kotlin this is before the body of the constructor.
        GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION = GDGameClientInformationInterfaceFactory.getFactoryInstance().getInstance();
        var motionGesturesHandler = this.motionRecognizer.getMotionGestureRecognizer().getMotionGesturesHandler();
        ;
        motionGesturesHandler.addListenerInterface(new GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()));
        motionGesturesHandler.addListenerInterface(new GDGameMotionGestureListener());
        PlayN2InputConnector.getInstance().init(this);
        new DefaultGameInitializationListener();
    }
    init() {
        var logUtil = LogUtil.getInstance();
        ;
        var commonStrings = CommonStrings.getInstance();
        ;
        try {
            logUtil.putF(commonStrings.START, this, commonStrings.INIT);
            var features = Features.getInstance();
            ;
            var gameFeatureFactory = GameFeatureFactory.getInstance();
            ;
            var inputFeatureFactory = InputFeatureFactory.getInstance();
            ;
            var graphicsFeatureFactory = GraphicsFeatureFactory.getInstance();
            ;
            var sensorFeatureFactory = SensorFeatureFactory.getInstance();
            ;
            features.removeDefault(sensorFeatureFactory.ORIENTATION_SENSORS);
            features.addDefault(sensorFeatureFactory.NO_ORIENTATION);
            features.addDefault(graphicsFeatureFactory.IMAGE_GRAPHICS);
            features.addDefault(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS);
            features.addDefault(gameFeatureFactory.HEALTH_BARS);
            features.addDefault(gameFeatureFactory.DAMAGE_FLOATERS);
            features.addDefault(gameFeatureFactory.DROPPED_ITEMS);
            features.addDefault(gameFeatureFactory.SOUND);
            features.addDefault(inputFeatureFactory.MULTI_KEY_PRESS);
            features.addDefault(inputFeatureFactory.REMOVE_DUPLICATE_KEY_PRESSES);
            var gameConfigurationCentral = GameConfigurationCentral.getInstance();
            ;
            var smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
            ;
            gameConfigurationCentral.VIBRATION.setDefaultValue(smallIntegerSingletonFactory.getAt(0));
            gameConfigurationCentral.VIBRATION.setDefault();
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setDefaultValue(smallIntegerSingletonFactory.getAt(4));
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setDefault();
            gameConfigurationCentral.SPEED.setDefaultValue(smallIntegerSingletonFactory.getAt(9));
            gameConfigurationCentral.SPEED.setDefault();
            gameConfigurationCentral.PLAYER_INPUT_WAIT.setDefaultValue(smallIntegerSingletonFactory.getAt(0));
            gameConfigurationCentral.PLAYER_INPUT_WAIT.setDefault();
            gameConfigurationCentral.SCALE.setDefaultValue(smallIntegerSingletonFactory.getAt(3));
            gameConfigurationCentral.SCALE.setDefault();
            features.removeDefault(sensorFeatureFactory.ORIENTATION_SENSORS);
            features.addDefault(sensorFeatureFactory.NO_ORIENTATION);
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }
    stopAll() {
        try {
            new Sounds(EarlySoundsFactory.getInstance()).stopAll();
            new Sounds(GDGameSoundsFactory.getInstance()).stopAll();
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "stopAll", e);
        }
    }
    onKeyTyped(event) {
    }
    onKeyDown(event) {
        try {
            this.rawKeyEventHandler.fireEvent(event.key.ordinal(), this.DEVICE_ID, true);
            //: 
        }
        catch (e) {
            this.logUtil.put(CommonLabels.getInstance().START_LABEL + event.key.ordinal(), this, "onKeyDown", e);
        }
        var key = event.key;
        ;
        var abKey = this.playNToAllBinaryKeyInputUtil.PLAYN_KEY_ORDINAL_TO_CANVAS_KEY[key.ordinal()];
        ;
        if (abKey != -1) {
            this.getCurrentDisplayable().keyPressed(abKey);
        }
    }
    onKeyUp(event) {
        var key = event.key;
        ;
        var abKey = this.playNToAllBinaryKeyInputUtil.PLAYN_KEY_ORDINAL_TO_CANVAS_KEY[key.ordinal()];
        ;
        if (abKey != -1) {
            this.getCurrentDisplayable().keyReleased(abKey);
        }
    }
    onPointerStart(mouseEvent) {
        try {
            this.motionRecognizer.processStartMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, 0);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onPointerStart", e);
        }
    }
    onPointerEnd(mouseEvent) {
        try {
            this.motionRecognizer.processEndMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, 0);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onPointerEnd", e);
        }
    }
    onPointerDrag(mouseEvent) {
        try {
            this.motionRecognizer.processDraggedMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, 0);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onPointerDrag", e);
        }
    }
    onPointerCancel(event) {
    }
    onMouseDown(mouseEvent) {
        try {
            this.motionRecognizer.processStartMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, mouseEvent.button.ordinal());
            //: 
        }
        catch (e) {
            logUtil.put(commonStrings.EXCEPTION, this, "onMouseDown", e);
        }
    }
    onMouseUp(mouseEvent) {
        try {
            this.motionRecognizer.processEndMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, mouseEvent.button.ordinal());
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMouseUp", e);
        }
    }
    onMouseMove(mouseEvent) {
        try {
            this.motionRecognizer.processMovedMotionEvent(Math.round(mouseEvent.x()), Math.round(mouseEvent.y()), this.DEVICE_ID, 0);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMouseMove", e);
        }
    }
    onMouseWheelScroll(event) {
        try {
            this.motionRecognizer.processScrolledMotionEvent(Math.round(event.x()), Math.round(event.y()), this.DEVICE_ID, 0);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMouseWheelScroll", e);
        }
    }
}
