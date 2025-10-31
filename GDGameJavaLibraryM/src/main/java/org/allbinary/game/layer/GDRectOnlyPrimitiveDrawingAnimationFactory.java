/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.game.layer;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.media.ScaleProperties;

/**
 *
 * @author User
 */
public class GDRectOnlyPrimitiveDrawingAnimationFactory implements
    AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface {

    @Override
    public Animation getInstance(final int instanceId) throws Exception {
        return new GDRectOnlyPrimitiveDrawing();
    }

    @Override
    public Animation getInstance(Animation animationInterface)
        throws Exception {
        return new GDRectOnlyPrimitiveDrawing();
    }

    @Override
    public void setInitialScale(final ScaleProperties scaleProperties) {

    }

}
