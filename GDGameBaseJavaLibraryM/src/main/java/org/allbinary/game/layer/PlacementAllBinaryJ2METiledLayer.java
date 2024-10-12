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

import org.allbinary.graphics.color.BasicColorFactory;

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
                       
        //this.paintDebug(graphics);

        this.paintPlacementDebug(graphics);
         
    }

    private final int[] colorArray = new int[] {
        BasicColorFactory.getInstance().RED.intValue(),
        BasicColorFactory.getInstance().GREEN.intValue(),
        BasicColorFactory.getInstance().YELLOW.intValue(),
        BasicColorFactory.getInstance().BLUE.intValue()
    };

    public void paintPlacementDebug(final Graphics graphics) {

//        final int x = this.tiledLayer.getX();
//        final int y = this.tiledLayer.getY();
//
//        final org.allbinary.game.canvas.GD1SpecialAnimationGlobals globals = org.allbinary.game.canvas.GD1SpecialAnimationGlobals.getInstance();
//        final org.allbinary.game.canvas.GD1GDObjectsFactory.PlatformerMap platformerMap = ((org.allbinary.game.canvas.GD1GDObjectsFactory.PlatformerMap) ((GDGameLayer) globals.PlatformerMapGDGameLayerList.get(0)).gdObject);
//        
//        final int size = platformerMap.placementXIntArray.length;
//        for(int index = 0; index < size; index++) {
//            int placementSize = platformerMap.placementSizeIntArray[index];
//            graphics.setColor(colorArray[placementSize]);
//            graphics.drawRect(x + platformerMap.placementXIntArray[index], y + platformerMap.placementYIntArray[index], placementSize, placementSize);
//        }

    }
    
}
