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
package org.allbinary.game.layer.behavior;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class DestroyOutsideBehavior extends GDBehavior {

    private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();

    public boolean process(final BasicArrayList gameLayerList, final int index, final Graphics graphics) {

        final GDGameLayer gameLayer = (GDGameLayer) gameLayerList.get(index);
        final GDObject gdObject = gameLayer.gdObject;

        if(gdObject == null) {
            return false;
        }

        if(gdObject.x > SceneWindowWidth() + gdObject.Width(graphics)) {
            return true;
        }

        if(gdObject.y > SceneWindowHeight() + gdObject.Width(graphics)) {
            return true;
        }

        if(gdObject.y < -gdObject.Width(graphics)) {
            return true;
        }

        if(gdObject.x < -gdObject.Height(graphics)) {
            return true;
        }
        
        return false;
    }

    public int SceneWindowWidth() {
        return this.gameTickDisplayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return this.gameTickDisplayInfoSingleton.getLastHeight();
    }

}
