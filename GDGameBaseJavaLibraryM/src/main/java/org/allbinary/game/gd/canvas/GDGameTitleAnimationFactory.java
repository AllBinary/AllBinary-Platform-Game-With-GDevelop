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
package org.allbinary.game.gd.canvas;

import org.allbinary.animation.ColorLessVectorAnimation;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.VectorExplosionGenerator;
import org.allbinary.animation.special.TitleAnimation;
import org.allbinary.game.gd.canvas.TitleVectorData;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

public class GDGameTitleAnimationFactory
{
    public static final TitleAnimation getInstance() throws Exception
    {
        final IndexedAnimation[] animationInterfaceArray = new IndexedAnimation[2];
        
        final BasicColor[] basicColorArray = new BasicColor[2];
        basicColorArray[0] = BasicColorFactory.getInstance().YELLOW;
        basicColorArray[1] = BasicColorFactory.getInstance().YELLOW;
        
        final int[] deltaXArray = new int[2];
        deltaXArray[0] = 0;
        deltaXArray[1] = 52;

        final int[] deltaYArray = new int[2];
        deltaYArray[0] = 0;
        deltaYArray[1] = 30;

        final TitleVectorData titleVectorData = new TitleVectorData();

        final VectorExplosionGenerator vectorExplosionGenerator = 
                VectorExplosionGenerator.getInstance();
        
        int[][][] points = vectorExplosionGenerator.getInstance(
                titleVectorData.testPoints, 6, 
                vectorExplosionGenerator.RANDOM);

        animationInterfaceArray[0] = new ColorLessVectorAnimation(points);

        points = vectorExplosionGenerator.getInstance(
                titleVectorData.gamePoints, 6, 
                vectorExplosionGenerator.RANDOM);

        animationInterfaceArray[1] = new ColorLessVectorAnimation(points);
        
        return new TitleAnimation(animationInterfaceArray, 
                basicColorArray, deltaXArray, deltaYArray, 15, 120);
    }
}
