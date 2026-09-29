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
//not GWT import const Graphics
import { AndroidUtil } from '../../../../org/allbinary/AndroidUtil.js';
//not GWT import const AndroidUtil
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const GDBehavior
import { GDBehaviorUtil } from '../../../../org/allbinary/game/layer/behavior/GDBehaviorUtil.js';
//not GWT import const GPoint
import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const BasicColor
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
        this.x = 0;
        this.y = 0;
        this.zOrder = 0;
        this.rotationP = 0.0;
        this.rotationZP = 0.0;
        this.angle = 0;
        this.movement_angle = 0;
        this.scaleX = 1.0;
        this.scaleY = 1.0;
        this.initScaleX = 1.0;
        this.initScaleY = 1.0;
        this.customScale = 1.0;
        this.animation = 0;
        this.timeScale = 1.0;
        this.opacity = 255;
        this.widthAtInitialScale = 0;
        this.heightAtInitialScale = 0;
        this.width = 0;
        this.height = 0;
        this.halfWidth = 0;
        this.halfHeight = 0;
        this.updateSinceSetAngle = false;
        this.forceAngle = 0;
        this.offsetX = AndroidUtil.isAndroid()
            ?
            //Otherwise - thenExpr - DoubleLiteralExpr
            :
        ;
        this.offsetY = 1.00;
        this.name = name;
        this.type = type;
        this.updateSize(width, height);
        var features = Features.getInstance();
        ;
        var openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        ;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            this.offsetBehavior = BaseOffsetBehavior.getInstance();
        }
        else {
            this.offsetBehavior = OffsetBehavior.getInstance();
        }
    }
    set(unknown, x, y, zOrder) {
        this.x = x;
        this.y = y;
        this.zOrder = zOrder;
    }
    updateScale(scaleX, scaleY) {
        this.initScaleX = scaleX;
        this.initScaleY = scaleY;
        this.updateSize(Math.round((this.width * scaleX)), Math.round((this.height * scaleY)));
    }
    updateSize(width, height) {
        this.width = width;
        this.height = height;
        this.halfWidth = width / 2;
        this.halfHeight = height / 2;
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
    Width(graphics) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.width;
    }
    Height(graphics) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.height;
    }
    setX(x) {
        this.setX(Math.round(x));
    }
    setX(x) {
        this.x = x;
    }
    setY(y) {
        this.setY(Math.round(y));
    }
    setY(y) {
        this.y = y;
    }
    X() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.x;
    }
    Y() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.y;
    }
    X2() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.x + this.width;
    }
    Y2() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.y + this.height;
    }
    ;
    PointX(point) {
        var adjustedAngle = this.angle;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        var x = Math.round((this.noDecimalTrigTable.cos(adjustedAngle) * (point.getX() - this.halfWidth - (this.halfWidth / 2)))) / this.noDecimalTrigTable.SCALE;
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.round((this.x + (x * this.offsetX) + this.offsetBehavior.PointX(this.halfWidth)));
    }
    PointY(point) {
        var adjustedAngle = this.angle;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        if (point.getX() > this.halfWidth) {
            var y = Math.round((this.noDecimalTrigTable.sin(adjustedAngle) * (point.getY() - (this.halfHeight / 2)))) / this.noDecimalTrigTable.SCALE;
            ;
            //if statement needs to be on the same line and ternary does not work the same way.
            return Math.round((this.y + (y * this.offsetY) + this.offsetBehavior.PointY(this.halfHeight)));
        }
        else {
            var y = Math.round((this.noDecimalTrigTable.sin(adjustedAngle) * -(point.getY() - (this.halfHeight / 2)))) / this.noDecimalTrigTable.SCALE;
            ;
            //if statement needs to be on the same line and ternary does not work the same way.
            return Math.round((this.y + (y * this.offsetY) + this.offsetBehavior.PointY(this.halfHeight)));
        }
    }
    setAngle(angle) {
        this.angle = angle;
    }
    setAngle(angle, gameLayer) {
        this.updateSinceSetAngle = false;
        var adjustedAngle = angle;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        this.angle = adjustedAngle;
        gameLayer.setRotation(adjustedAngle);
    }
    Angle(gameLayer) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.angle;
    }
    Angle() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.angle;
    }
    Variable(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    Variable(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    VariableChildCount(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    VariableChildCount(array) {
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
        var commonSeps = CommonSeps.getInstance();
        ;
        var gdObjectStrings = GDObjectStrings.getInstance();
        ;
        var positionStrings = PositionStrings.getInstance();
        ;
        var commonLabels = CommonLabels.getInstance();
        ;
        var stringBuilder = new StringMaker();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON).append(this.name).append(commonSeps.SPACE).append(positionStrings.X_LABEL).appendint(this.x).append(positionStrings.Y_LABEL).appendint(this.y).append(commonLabels.WIDTH_LABEL).appendint(this.width).append(commonLabels.HEIGHT_LABEL).appendint(this.height).toString();
        ;
    }
    toString() {
        var commonSeps = CommonSeps.getInstance();
        ;
        var graphicsStrings = GraphicsStrings.getInstance();
        ;
        var positionStrings = PositionStrings.getInstance();
        ;
        var commonLabels = CommonLabels.getInstance();
        ;
        var gdObjectStrings = GDObjectStrings.getInstance();
        ;
        var stringBuilder = new StringMaker();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON).append(this.name).appendint(this.hashCode()).append(commonSeps.SPACE).append(positionStrings.X_LABEL).appendint(this.x).append(positionStrings.Y_LABEL).appendint(this.y).append(commonSeps.SPACE).append(positionStrings.Z_LABEL).appendint(this.zOrder).append(commonSeps.SPACE).append(commonLabels.WIDTH_LABEL).appendint(this.width).append(commonSeps.SPACE).append(commonLabels.HEIGHT_LABEL).appendint(this.height).append(commonSeps.SPACE).append(commonLabels.WIDTH_LABEL).appendint(this.halfWidth).append(commonSeps.SPACE).append(commonLabels.HEIGHT_LABEL).appendint(this.halfHeight).append(commonSeps.SPACE).append(graphicsStrings.ANIMATION).appendint(this.animation).append(commonSeps.SPACE).append(graphicsStrings.ANGLE).append(commonSeps.COLON).appendint(this.angle).append(commonSeps.SPACE).append(graphicsStrings.MOVEMENT_ANGLE).append(commonSeps.COLON).appendint(this.movement_angle).append(commonSeps.SPACE).append(graphicsStrings.ROTATION).append(commonSeps.COLON).appendfloat(this.rotationP).append(commonSeps.SPACE).append(graphicsStrings.OPACITY).append(commonSeps.COLON).appendfloat(this.opacity).toString();
        ;
    }
}
