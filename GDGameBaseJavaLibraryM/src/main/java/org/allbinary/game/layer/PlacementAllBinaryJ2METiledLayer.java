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

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.game.TiledLayer;
import org.allbinary.game.canvas.GD1GDObjectsFactory;
import org.allbinary.game.canvas.GD1SpecialAnimationGlobals;

/**
 *
 * @author User
 */
public class PlacementAllBinaryJ2METiledLayer extends AllBinaryJ2METiledLayer {
    
    public PlacementAllBinaryJ2METiledLayer(final Integer dataId, final TiledLayer tiledLayer, final int[][] i_Map2DArray, final int debugColor) {
        super(dataId, tiledLayer, i_Map2DArray, debugColor);
    }
    
    public void setPosition(final int x, final int y, final int z)
    {
        super.setPosition(x, y, z);
    }
    
    public void paint(final Graphics graphics)
    {
        super.paint(graphics);
        
        final GD1SpecialAnimationGlobals globals = GD1SpecialAnimationGlobals.getInstance();
        final GD1GDObjectsFactory.PlatformerMap platformerMap = ((GD1GDObjectsFactory.PlatformerMap) ((GDGameLayer) globals.PlatformerMapGDGameLayerList.get(0)).gdObject);
               
        this.paintDebug(graphics);

        //graphics.setColor(debugColor);
        final int x = this.tiledLayer.getX();
        final int y = this.tiledLayer.getY();

        final int size = platformerMap.placementXIntArray.length;
        for(int index = 0; index < size; index++) {
            graphics.drawRect(x + platformerMap.placementXIntArray[index], y + platformerMap.placementYIntArray[index], 2, 2);
        }
         
    }

}
