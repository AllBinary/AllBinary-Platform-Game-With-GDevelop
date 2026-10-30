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
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
//not GWT import const AndroidUtil
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const GDBehavior
import { GDBehaviorUtil } from '../../../../org/allbinary/game/layer/behavior/GDBehaviorUtil.js';
//not GWT import const GPoint
import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const BasicColor
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
import { NoDecimalTrigTable } from '../../../../org/allbinary/math/NoDecimalTrigTable.js';
//not GWT import const NoDecimalTrigTable
//not plain js import { PositionStrings } 
const PositionStrings = globalThis.org.allbinary.math.PositionStrings;
//not plain js import { CommonLabels } 
const CommonLabels = globalThis.org.allbinary.string.CommonLabels;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDInitialVariables } from './GDInitialVariables.js';
//not GWT import - same folder const GDInitialVariables
import { BaseOffsetBehavior } from './BaseOffsetBehavior.js';
//not GWT import - same folder const BaseOffsetBehavior
import { OffsetBehavior } from './OffsetBehavior.js';
//not GWT import - same folder const OffsetBehavior
import { GDConfig } from './GDConfig.js';
//not GWT import - same folder const GDConfig
import { GDObjectStrings } from './GDObjectStrings.js';
//not GWT import - same folder const GDObjectStrings
export class GDObject extends Object {
    constructor(width, height, name, type) {
        super();
        this.logUtil = LogUtil.getInstance();
        this.noDecimalTrigTable = NoDecimalTrigTable.getInstance();
        this.initialVariables = GDInitialVariables.getInstance();
        this.behaviorArray = new Array(GDBehaviorUtil.getInstance().MAX);
        this.isBehaviorEnabledArray = new Array(10);
        this.hasBehaviorArray = new Array(10);
        this.xP = 0;
        this.yP = 0;
        this.zOrder = 0;
        this.rotationP = 0.0;
        this.rotationZP = 0.0;
        this.angleP = 0;
        this.movement_angle = 0;
        this.scaleX = 1.0;
        this.scaleY = 1.0;
        this.initScaleX = 1.0;
        this.initScaleY = 1.0;
        this.customScale = 1.0;
        this.animation = 0;
        this.timeScale = 1.0;
        this.opacity = 255;
        this.basicColor = BasicColorFactory.getInstance().NULL_COLOR;
        this.widthAtInitialScale = 0;
        this.heightAtInitialScale = 0;
        this.width = 0;
        this.height = 0;
        this.halfWidth = 0;
        this.halfHeight = 0;
        this.updateSinceSetAngle = false;
        this.forceAngle = 0;
        this.offsetX = GDConfig.getInstance().getInverseScale();
        this.offsetY = 1.00;
        this.name = name;
        this.type = type;
        this.updateSize(width, height);
        let features = Features.getInstance();
        ;
        let openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        ;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            this.offsetBehavior = BaseOffsetBehavior.getInstance();
        }
        else {
            this.offsetBehavior = OffsetBehavior.getInstance();
        }
    }
    set(unknown, x, y, zOrder) {
        this.xP = x;
        this.yP = y;
        this.zOrder = zOrder;
    }
    updateScale(scaleX, scaleY) {
        this.initScaleX = scaleX;
        this.initScaleY = scaleY;
        this.updateSize(globalThis.Math.trunc((this.width * scaleX)), globalThis.Math.trunc((this.height * scaleY)));
    }
    updateSize(width, height) {
        this.width = width;
        this.height = height;
        this.halfWidth = globalThis.Math.trunc(width / 2);
        this.halfHeight = globalThis.Math.trunc(height / 2);
    }
    ForceAngle() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.forceAngle;
    }
    getAnimationFromIndex(index) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return StringUtil.getInstance().EMPTY_STRING;
    }
    getAnimation(animationName) {
        throw new RuntimeException();
    }
    setAnimation(animationName) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    Width(graphicsCanBeNull) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.width;
    }
    Height(graphicsCanBeNull) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.height;
    }
    setX(...args) {
        if (args.length === 1 && typeof args[0] === 'number')
            return this.setX$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.setX$overload2(args[0]);
        throw new TypeError('No matching overload: setX');
    }
    setX$overload1(x) {
        this.setX(globalThis.Math.trunc(x));
    }
    setX$overload2(x) {
        this.xP = x;
    }
    setY(...args) {
        if (args.length === 1 && typeof args[0] === 'number')
            return this.setY$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.setY$overload2(args[0]);
        throw new TypeError('No matching overload: setY');
    }
    setY$overload1(y) {
        this.setY(globalThis.Math.trunc(y));
    }
    setY$overload2(y) {
        this.yP = y;
    }
    X() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.xP;
    }
    Y() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.yP;
    }
    X2() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.xP + this.width;
    }
    Y2() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.yP + this.height;
    }
    PointX(point) {
        let adjustedAngle = this.angleP;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        let x = globalThis.Math.trunc((this.noDecimalTrigTable.cos(adjustedAngle) * (point.getX() - this.halfWidth - (globalThis.Math.trunc(this.halfWidth / 2))))) / this.noDecimalTrigTable.SCALE;
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return globalThis.Math.trunc((this.xP + (x * this.offsetX) + this.offsetBehavior.PointX(this.halfWidth)));
    }
    PointY(point) {
        let adjustedAngle = this.angleP;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        if (point.getX() > this.halfWidth) {
            let y = globalThis.Math.trunc((this.noDecimalTrigTable.sin(adjustedAngle) * (point.getY() - (globalThis.Math.trunc(this.halfHeight / 2))))) / this.noDecimalTrigTable.SCALE;
            ;
            //if statement needs to be on the same line and ternary does not work the same way.
            return globalThis.Math.trunc((this.yP + (y * this.offsetY) + this.offsetBehavior.PointY(this.halfHeight)));
        }
        else {
            let y = globalThis.Math.trunc((this.noDecimalTrigTable.sin(adjustedAngle) * -(point.getY() - (globalThis.Math.trunc(this.halfHeight / 2))))) / this.noDecimalTrigTable.SCALE;
            ;
            //if statement needs to be on the same line and ternary does not work the same way.
            return globalThis.Math.trunc((this.yP + (y * this.offsetY) + this.offsetBehavior.PointY(this.halfHeight)));
        }
    }
    setAngle(...args) {
        if (args.length === 1 && typeof args[0] === 'number')
            return this.setAngle$overload1(args[0]);
        if (args.length === 2 && typeof args[0] === 'number')
            return this.setAngle$overload2(args[0], args[1]);
        throw new TypeError('No matching overload: setAngle');
    }
    setAngle$overload1(angle) {
        this.angleP = angle;
    }
    setAngle$overload2(angle, gameLayer) {
        this.updateSinceSetAngle = false;
        let adjustedAngle = angle;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        this.angleP = adjustedAngle;
        gameLayer.setRotation(adjustedAngle);
    }
    Angle(...args) {
        if (args.length === 1)
            return this.Angle$overload1(args[0]);
        if (args.length === 0)
            return this.Angle$overload2();
        throw new TypeError('No matching overload: Angle');
    }
    Angle$overload1(gameLayer) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.angleP;
    }
    Angle$overload2() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.angleP;
    }
    Variable(...args) {
        if (args.length === 1 && typeof args[0] === 'number')
            return this.Variable$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.Variable$overload2(args[0]);
        throw new TypeError('No matching overload: Variable');
    }
    Variable$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    Variable$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    VariableChildCount(...args) {
        if (args.length === 1)
            return this.VariableChildCount$overload1(args[0]);
        if (args.length === 1)
            return this.VariableChildCount$overload2(args[0]);
        throw new TypeError('No matching overload: VariableChildCount');
    }
    VariableChildCount$overload1(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    VariableChildCount$overload2(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    ObjectName() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.name;
    }
    reset() {
    }
    getBehavior(index) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.behaviorArray[index];
    }
    toShortString() {
        let commonSeps = CommonSeps.getInstance();
        ;
        let gdObjectStrings = GDObjectStrings.getInstance();
        ;
        let positionStrings = PositionStrings.getInstance();
        ;
        let commonLabels = CommonLabels.getInstance();
        ;
        let stringBuilder = new StringMaker();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON).append(this.name).append(commonSeps.SPACE).append(positionStrings.X_LABEL).appendint(this.xP).append(positionStrings.Y_LABEL).appendint(this.yP).append(commonLabels.WIDTH_LABEL).appendint(this.width).append(commonLabels.HEIGHT_LABEL).appendint(this.height).toString();
        ;
    }
    toString() {
        let commonSeps = CommonSeps.getInstance();
        ;
        let graphicsStrings = GraphicsStrings.getInstance();
        ;
        let positionStrings = PositionStrings.getInstance();
        ;
        let commonLabels = CommonLabels.getInstance();
        ;
        let gdObjectStrings = GDObjectStrings.getInstance();
        ;
        let stringBuilder = new StringMaker();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON).append(this.name).appendint(this.hashCode()).append(commonSeps.SPACE).append(positionStrings.X_LABEL).appendint(this.xP).append(positionStrings.Y_LABEL).appendint(this.yP).append(commonSeps.SPACE).append(positionStrings.Z_LABEL).appendint(this.zOrder).append(commonSeps.SPACE).append(commonLabels.WIDTH_LABEL).appendint(this.width).append(commonSeps.SPACE).append(commonLabels.HEIGHT_LABEL).appendint(this.height).append(commonSeps.SPACE).append(commonLabels.WIDTH_LABEL).appendint(this.halfWidth).append(commonSeps.SPACE).append(commonLabels.HEIGHT_LABEL).appendint(this.halfHeight).append(commonSeps.SPACE).append(graphicsStrings.ANIMATION).appendint(this.animation).append(commonSeps.SPACE).append(graphicsStrings.ANGLE).append(commonSeps.COLON).appendint(this.angleP).append(commonSeps.SPACE).append(graphicsStrings.MOVEMENT_ANGLE).append(commonSeps.COLON).appendint(this.movement_angle).append(commonSeps.SPACE).append(graphicsStrings.ROTATION).append(commonSeps.COLON).appendfloat(this.rotationP).append(commonSeps.SPACE).append(graphicsStrings.OPACITY).append(commonSeps.COLON).appendfloat(this.opacity).toString();
        ;
    }
}
