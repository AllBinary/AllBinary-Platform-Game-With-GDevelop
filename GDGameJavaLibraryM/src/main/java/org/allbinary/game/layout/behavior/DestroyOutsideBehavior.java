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

/**
 *
 * @author User
 */
public class DestroyOutsideBehavior extends GDBehavior {

    private final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();

    public void process(final GDGameLayer gameLayer, final GDObject gdObject, final Graphics graphics) {

        if(gdObject == null) {
            return;
        }

        if(gdObject.x > SceneWindowWidth() + gdObject.Width(graphics)) {
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
        }

        if(gdObject.y > SceneWindowHeight() + gdObject.Width(graphics)) {
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
        }

        if(gdObject.y < -gdObject.Width(graphics)) {
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
        }

        if(gdObject.x < -gdObject.Height(graphics)) {
            gameLayer.getCombatBaseBehavior().getDestroyableBaseBehavior().setDestroyed(true);
        }
    }

    public int SceneWindowWidth() {
        return this.displayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return this.displayInfoSingleton.getLastHeight();
    }

}
