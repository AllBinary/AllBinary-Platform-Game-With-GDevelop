/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary.game.layout;

import org.allbinary.AndroidUtil;
import org.allbinary.J2MEUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;

/**
 *
 * @author User
 */
public class GDConfig {

    private static final GDConfig instance = new GDConfig();

    /**
     * @return the instance
     */
    public static GDConfig getInstance() {
        return GDConfig.instance;
    }

    public float getScale() {
        if (AndroidUtil.isAndroid()) {
            return 0.75f;
        } else {
            return 1.0f;
        }
    }

    public float getScale2() {
        if (AndroidUtil.isAndroid()) {
            return 0.75f;
        } else {
            return 2.0f;
        }
    }

    public float getInverseScale() {
        if (AndroidUtil.isAndroid()) {
            return 1.0f;
        } else {
            return 0.75f;
        }
    }
    
    public int getScaleHack() {
        if (SWTUtil.isSWT || AndroidUtil.isAndroid()) {
            return 2;
        } else {
            return 3;
        }
    }

    public float getFontScale(float fontSize) {
        if (AndroidUtil.isAndroid()) {
            return fontSize;
        } else {
            return fontSize / 2;
        }
    }

    public float getGameScale(float androidScale, float htmlScale, float j2seScale) {
        if (AndroidUtil.isAndroid()) {
            return androidScale;
        } else {
            if (J2MEUtil.isHTML()) {
                return htmlScale;
            } else {
                return j2seScale;
            }
        }
    }

    public float getScaleThreed(float layoutScale) {

        final Features features = Features.getInstance();
        final OpenGLFeatureFactory openGLFeatureFactory = OpenGLFeatureFactory.getInstance();

        boolean isThreed = false;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            isThreed = true;
        }

        if(AndroidUtil.isAndroid() && isThreed) {
            return layoutScale;
        } else {
            return 1.0f;
        }
    }
}
