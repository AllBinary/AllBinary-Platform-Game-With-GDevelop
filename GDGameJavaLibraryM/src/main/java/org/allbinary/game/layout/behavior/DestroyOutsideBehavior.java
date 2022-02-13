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
package org.allbinary.game.layout.behavior;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class DestroyOutsideBehavior extends GDBehavior {

    private final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();

    public void process(final BasicArrayList gameLayerList, final BasicArrayList gdObjectList, final int index, final Graphics graphics) {

        final GDGameLayer gameLayer = (GDGameLayer) gameLayerList.get(index);
        final GDObject gdObject = (GDObject) gdObjectList.get(index);

        if(gdObject == null) {
            return;
        }

        if(gdObject.x > SceneWindowWidth() + gdObject.Width(graphics)) {
            gdObjectList.remove(index);
            gameLayerList.remove(index);
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
            return;
        }

        if(gdObject.y > SceneWindowHeight() + gdObject.Width(graphics)) {
            gdObjectList.remove(index);
            gameLayerList.remove(index);
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
            return;
        }

        if(gdObject.y < -gdObject.Width(graphics)) {
            gdObjectList.remove(index);
            gameLayerList.remove(index);
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
            return;
        }

        if(gdObject.x < -gdObject.Height(graphics)) {
            gdObjectList.remove(index);
            gameLayerList.remove(index);
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
            return;
        }
    }

    public int SceneWindowWidth() {
        return this.displayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return this.displayInfoSingleton.getLastHeight();
    }

}
