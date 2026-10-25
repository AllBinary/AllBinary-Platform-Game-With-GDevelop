/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2026 AllBinary
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
import { AndroidUtil } from '../../../../org/allbinary/AndroidUtil.js';
//not GWT import const AndroidUtil
import { J2MEUtil } from '../../../../org/allbinary/J2MEUtil.js';
//not GWT import const J2MEUtil
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features
import { SWTUtil } from '../../../../org/allbinary/game/layer/SWTUtil.js';
//not GWT import const SWTUtil
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDConfig extends Object {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDConfig.instance;
    }
    getScale() {
        if (AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 0.75;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 1.0;
        }
    }
    getScale2() {
        if (AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 0.75;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 2.0;
        }
    }
    getInverseScale() {
        if (AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 1.0;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 0.75;
        }
    }
    getScaleHack() {
        if (SWTUtil.isSWT || AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 2;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 3;
        }
    }
    getFontScale(fontSize) {
        if (AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return fontSize;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return fontSize / 2;
        }
    }
    getGameScale(androidScale, htmlScale, j2seScale) {
        if (AndroidUtil.isAndroid()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return androidScale;
        }
        else {
            if (J2MEUtil.isHTML()) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return htmlScale;
            }
            else {
                //if statement needs to be on the same line and ternary does not work the same way.
                return j2seScale;
            }
        }
    }
    getScaleThreed(layoutScale) {
        var features = Features.getInstance();
        ;
        var openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        ;
        var isThreed = false;
        ;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            isThreed = true;
        }
        if (AndroidUtil.isAndroid() && isThreed) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return layoutScale;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return 1.0;
        }
    }
}
GDConfig.instance = new GDConfig();
