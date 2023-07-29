/*
 *Copyright (c) 2006 All Binary
 *All Rights Reserved.
 *Don't Duplicate or Distributed.
 *Trade Secret Information
 *For Internal Use Only
 *Confidential
 *Unpublished
 *
 *Created By: Travis Berthelot
 *Date: August 6, 2006
 *
 *
 *Modified By         When       ?
 *
 */
package org.allbinary.game.map;

import java.util.List;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.TiledLayer;
import org.allbinary.game.layer.AllBinaryJ2METiledLayer;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.util.BasicArrayList;
import org.mapeditor.core.Animation;
import org.mapeditor.core.Tile;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TileSet;
import org.mapeditor.core.TiledMap;

public class GDGeographicMap extends BasicGeographicMap {

    private static int[] cellTypeMapping = {0, 1};

    private final TiledMap map;
    
    private final int[] animationTileIndexArray = new int[5];
    private final int[] currentFrameArray = new int[5];
    private final BasicArrayList animationList = new BasicArrayList();
    
    public GDGeographicMap(final int id, final TiledMap map, final Image tileSetImage, final BasicColor foregroundColor, final BasicColor backGroundColor) throws Exception {
        super(SmallIntegerSingletonFactory.getInstance().getInstance(id),
                SmallIntegerSingletonFactory.getInstance().getInstance(id).toString(),
                cellTypeMapping,
                new AllBinaryJ2METiledLayer(
                        SmallIntegerSingletonFactory.getInstance().getInstance(-1),
                        new TiledLayer(
                                map.getWidth(),
                                map.getHeight(),
                                tileSetImage,
                                map.getTileWidth(),
                                map.getTileHeight()),
                        ((TileLayer) map.getLayer(0)).getMapArray()),
                foregroundColor, backGroundColor,
                new SimpleGeographicMapCellPositionFactory(),
                new GeographicMapCellPositionBaseFactory());

        this.map = map;
        
        final TiledLayer tiledLayer = ((AllBinaryJ2METiledLayer) this.getAllBinaryTiledLayer()).getTiledLayer();
        final List<TileSet> tileSetList = map.getTileSets();
        final int size = tileSetList.size();
        TileSet tileSet;
        Tile tile;
        Animation animation;
        int animationTileIndex;
        int tileCount;
        for(int index = 0; index < size; index++) {
            tileSet = tileSetList.get(index);
            tileCount = tileSet.getTilecount();
            for(int index2 = 0; index2 < tileCount; index2++) {
                tile = tileSet.getTile(index2);
                animation = tile.getAnimation();
                if(animation != null) {
                    animationTileIndex = tiledLayer.createAnimatedTile(tile.getId());
                    this.animationTileIndexArray[this.animationList.size()] = animationTileIndex;
                    this.animationList.add(animation);
                }
            }
        }

    }

    public void update() {
        tiledLayer.setAnimatedTile(animationTileIndex, animation.getFrame());
    }

    public void reset() {
        AllBinaryTiledLayer allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        int y = -DisplayInfoSingleton.getInstance().getLastHeight() + allBinaryTiledLayer.getHeight();
        allBinaryTiledLayer.setPosition(0, -y, allBinaryTiledLayer.getZ());
    }

}
