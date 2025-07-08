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
import org.allbinary.game.layout.GDObject;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDAnimationBehaviorBase {
    protected final LogUtil logUtil = LogUtil.getInstance();


    private static final GDAnimationBehaviorBase instance = new GDAnimationBehaviorBase();

    /**
     * @return the instance
     */
    public static GDAnimationBehaviorBase getInstance() {
        return instance;
    }
    
    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {
        final int size = animationInterfaceFactoryInterfaceArray.length;
        final IndexedAnimation[] initIndexedAnimationInterfaceArray = new IndexedAnimation[size];

            for (int index = 0; index < size; index++)
            {
        try {
                initIndexedAnimationInterfaceArray[index] = (IndexedAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance(gdObject.hashCode());
        } catch(Exception e) {
            //final StringMaker stringMaker = new StringMaker();
            //super.toString(stringMaker);
            //stringMaker.toString()
            final CommonStrings commonStrings = CommonStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index].toString()).append(" index: ").append(index).toString(), this, commonStrings.CONSTRUCTOR, e));
            LogUtil.put(LogFactory.getInstance(gdObject.toString(), this, commonStrings.CONSTRUCTOR, e));
        }
            }
        
        return initIndexedAnimationInterfaceArray;
    }

    public void setAnimationArray(final IndexedAnimation[] rotationAnimationInterfaceArray)
    {
        
    }

    public void add(final GDGameLayer gameLayer) {

    }

    public void set(final GDObject gdObject) throws Exception {
        
    }
    
    public void setRotation(final GDGameLayer gameLayer, final short angleAdjustment) {
        
    }

    public void animate(final GDObject gdObject, final IndexedAnimation[] initIndexedAnimationInterfaceArray, final long timeDelta) {
    
    }

    public void toString(final GDObject gdObject, final StringMaker stringBuffer) {
        
    }
}
