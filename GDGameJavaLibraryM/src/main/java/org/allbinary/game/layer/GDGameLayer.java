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
package org.allbinary.game.layer;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayer extends CollidableDestroyableDamageableLayer
{
    public final GDObject gdObject;

    private final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    private final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    private final IndexedAnimation[] initIndexedAnimationInterface;
    private IndexedAnimation[] indexedAnimationInterface;
    //private RotationAnimation[] rotationAnimationInterface;

    private final int SIZE;
            
    public GDGameLayer(final Group[] groupInterface,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo,
            final GDObject gdObject) throws Exception {
        super(groupInterface, layerInfo, new ViewPosition());

        this.setVisible(true);

        this.gdObject = gdObject;
        
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.z);

        this.SIZE = animationInterfaceFactoryInterfaceArray.length;
        final IndexedAnimation[] initIndexedAnimationInterface = new IndexedAnimation[SIZE];
        
        LogUtil.put(LogFactory.getInstance(this.gdObject.name, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        try {
            for (int index = 0; index < SIZE; index++)
            {
                initIndexedAnimationInterface[index] = (IndexedAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance();
            }
        } catch(Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().CONSTRUCTOR, this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

        this.initIndexedAnimationInterface = initIndexedAnimationInterface;
        
        //this.setRotationAnimationInterface((RotationAnimation[])
                //his.getInitIndexedAnimationInterface());
        this.setIndexedAnimationInterface(this.initIndexedAnimationInterface);
    }

    protected IndexedAnimation[] getInitIndexedAnimationInterface()
    {
        return initIndexedAnimationInterface;
    }

    /*
    public void setRotationAnimationInterface(
            RotationAnimation[] rotationAnimationInterface)
    {
        this.rotationAnimationInterface = rotationAnimationInterface;
        this.setIndexedAnimationInterface(this.rotationAnimationInterface);
    }

    public RotationAnimation[] getRotationAnimationInterface()
    {
        return this.rotationAnimationInterface;
    }
    */

    protected void setIndexedAnimationInterface(
            IndexedAnimation[] animationInterface)
    {
        this.indexedAnimationInterface = animationInterface;
    }

    protected IndexedAnimation[] getIndexedAnimationInterface()
    {
        return indexedAnimationInterface;
    }

    private boolean isFirst = true;
    private final String PAINT = "paint";
    public void paint(Graphics graphics)
    {
        try
        {
            if(this.isFirst) {
                this.isFirst = false;
                LogUtil.put(LogFactory.getInstance(this.gdObject.name, this, PAINT));
            }
            
            int x = this.x - quarterWidth;
            int y = this.y - quarterHeight;

            for (int index = 0; index < SIZE; index++) {
                indexedAnimationInterface[index].paint(graphics, x, y);
            }
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "paint", e));
        }
    }

}
