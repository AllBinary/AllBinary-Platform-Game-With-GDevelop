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
import { GDGameSoftwareInfo } from '../../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo
import { GDGameMenuPaintable } from '../../../../org/allbinary/game/canvas/GDGameMenuPaintable.js';
//not GWT import const CommandListener
import { GDGameStaticInitializerFactory } from '../../../../org/allbinary/game/init/GDGameStaticInitializerFactory.js';
//not GWT import const GDGameStaticInitializerFactory
import { GDGameLayerManager } from '../../../../org/allbinary/game/layer/GDGameLayerManager.js';
//not GWT import const GDGameLayerManager
//not plain js import { PreLogUtil } 
const PreLogUtil = globalThis.org.allbinary.logic.communication.log.PreLogUtil;
import { GameInfo } from '../../../../org/allbinary/game/GameInfo.js';
//not GWT import const GameInfo
import { GameMode } from '../../../../org/allbinary/game/GameMode.js';
//not GWT import const GameMode
import { GameTypeFactory } from '../../../../org/allbinary/game/GameTypeFactory.js';
//not GWT import const GameTypeFactory
import { PlayerTypesFactory } from '../../../../org/allbinary/game/PlayerTypesFactory.js';
//not GWT import const PlayerTypesFactory
import { GameSpeed } from '../../../../org/allbinary/game/configuration/GameSpeed.js';
//not GWT import const GameSpeed
import { DemoCanvas } from '../../../../org/allbinary/game/displayable/canvas/DemoCanvas.js';
//not GWT import const AllBinaryGameLayerManager
import { ColorFillPaintableFactory } from '../../../../org/allbinary/game/paint/ColorFillPaintableFactory.js';
//not GWT import const ColorFillPaintableFactory
import { BasicHighScoresFactory } from '../../../../org/allbinary/game/score/BasicHighScoresFactory.js';
//not GWT import const BasicHighScoresFactory
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
import { FormPaintable } from '../../../../org/allbinary/graphics/form/FormPaintable.js';
//not GWT import const FormPaintable
import { NullInitUpdatePaintable } from '../../../../org/allbinary/graphics/paint/NullInitUpdatePaintable.js';
//not GWT import const NullInitUpdatePaintable
import { NullPaintable } from '../../../../org/allbinary/graphics/paint/NullPaintable.js';
//not GWT import const AbeClientInformationInterface
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GD0SpecialAnimation } from './GD0SpecialAnimation.js';
//not GWT import - same folder const GD0SpecialAnimation
import { GDGameGameCanvas } from './GDGameGameCanvas.js';
//not GWT import - same folder const GDGameGameCanvas
export class GDGameStartCanvas extends DemoCanvas {
    constructor(abeClientInformation, commandListener) {
        super(abeClientInformation, commandListener, new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()), NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(), new GDGameStaticInitializerFactory(), false);
        this.WAIT = ((GameSpeed.getInstance().getDelay() * 3) >> 1);
        //For kotlin this is before the body of the constructor.
        this.setWait(this.WAIT);
        GD0SpecialAnimation.getInstance(this, null);
    }
    //@Throws(Exception.constructor)
    initPostPaint() {
        this.setBasicGameDemoPaintable(new GDGameMenuPaintable(new FormPaintable(this.getMenuForm())));
        this.setSpecialAnimationInterface(GD0SpecialAnimation.getInstance());
        this.setDefaultPaintableInterface(ColorFillPaintableFactory.getInstance().getInstance(BasicColorFactory.getInstance().RED, false));
    }
    getNextRandom() {
        PreLogUtil.put("******************Demo Next Random Is Always 1", this, "getNextRandom");
        //if statement needs to be on the same line and ternary does not work the same way.
        return 1;
    }
    //@Throws(Exception.constructor)
    createGameLayerManager(randomValue) {
        var gameInfo = new GameInfo(GameTypeFactory.getInstance().BOT, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, GDGameLayerManager.MAX_LEVEL, randomValue);
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return new GDGameLayerManager(null, null, gameInfo);
    }
    //@Throws(Exception.constructor)
    createRunnable(randomValue) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return new GDGameGameCanvas(this.abeClientInformation, this.createGameLayerManager(this.getNextRandom()));
    }
}
