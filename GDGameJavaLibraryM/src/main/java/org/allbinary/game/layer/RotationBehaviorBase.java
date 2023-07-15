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

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.layout.GDObject;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class RotationBehaviorBase {

    private static final RotationBehaviorBase instance = new RotationBehaviorBase();

    /**
     * @return the instance
     */
    public static RotationBehaviorBase getInstance() {
        return instance;
    }
    
    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {
        final int size = animationInterfaceFactoryInterfaceArray.length;
        final IndexedAnimation[] initIndexedAnimationInterfaceArray = new IndexedAnimation[size];

        try {
            for (int index = 0; index < size; index++)
            {
                initIndexedAnimationInterfaceArray[index] = (IndexedAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance();
            }
        } catch(Exception e) {
            //final StringMaker stringMaker = new StringMaker();
            //super.toString(stringMaker);
            //stringMaker.toString()
            LogUtil.put(LogFactory.getInstance(gdObject.toString(), this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }
        
        return initIndexedAnimationInterfaceArray;
    }

    public void setRotationAnimationInterfaceArray(final IndexedAnimation[] rotationAnimationInterfaceArray)
    {
        
    }
    
    public void set(final GDObject gdObject) throws Exception {
        
    }
    
    public void setRotation(final GDGameLayer gameLayer, final short angleAdjustment) {
        
    }
    
    public void toString(final GDObject gdObject, final StringMaker stringBuffer) {
        
    }
}
