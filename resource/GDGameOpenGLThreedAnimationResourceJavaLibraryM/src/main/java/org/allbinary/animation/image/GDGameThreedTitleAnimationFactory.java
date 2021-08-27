package org.allbinary.animation.image;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.special.TitleAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

public class GDGameThreedTitleAnimationFactory
{
    private static final GDGameThreedTitleAnimationFactory instance = new GDGameThreedTitleAnimationFactory();
    
    public static GDGameThreedTitleAnimationFactory getIntance()
    {
        return instance;
    }
    
    public final TitleAnimation getInstance(
            IndexedAnimation[] animationInterfaceArray)
    throws Exception
    {
        final BasicColorFactory basicColorFactory = BasicColorFactory.getInstance();
        
        BasicColor[] basicColorArray = new BasicColor[3];
        basicColorArray[0] = basicColorFactory.CLEAR_COLOR;
        basicColorArray[1] = basicColorFactory.CLEAR_COLOR;
        basicColorArray[2] = basicColorFactory.CLEAR_COLOR;

        int[] deltaXArray = new int[3];
        deltaXArray[0] = 0;
        deltaXArray[1] = 52;
        deltaXArray[2] = 0;

        int[] deltaYArray = new int[3];
        deltaYArray[0] = 0;
        deltaYArray[1] = 30;
        deltaYArray[2] = 37;

        return new GDGameThreedTitleAnimation(animationInterfaceArray, 
                basicColorArray, deltaXArray, deltaYArray, 15, 120);
    }
}
