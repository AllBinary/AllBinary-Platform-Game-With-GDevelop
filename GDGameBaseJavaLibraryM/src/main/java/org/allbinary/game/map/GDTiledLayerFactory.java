/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.game.map;

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.TiledLayer;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.PlacementAllBinaryJ2METiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TiledMap;

/**
 *
 * @author User
 */
public class GDTiledLayerFactory implements AllBinaryTiledLayerFactoryInterface {

    private final TileLayer tileLayer;
    private final TiledMap map;
    private final Image tileSetImage;
    private final BasicColor debugColor;
        
    private AllBinaryTiledLayer useAsMiniAllBinaryTiledLayer;
    
    public GDTiledLayerFactory(final TileLayer tileLayer, final int[] cellTypeIdToGeographicMapCellType, final TiledMap map, final Image tileSetImage, final BasicColor debugColor) {
        this.tileLayer = tileLayer;
        this.map = map;
        this.tileSetImage = tileSetImage;
        this.debugColor = debugColor;
    }
    
    public AllBinaryTiledLayer getInstance(final RaceTrackInfo raceTrackInfo, final RaceTrackData raceTrackData)
        throws Exception {

        useAsMiniAllBinaryTiledLayer = new PlacementAllBinaryJ2METiledLayer(
            SmallIntegerSingletonFactory.getInstance().getInstance(-1),
            new TiledLayer(
                map.getWidth(),
                map.getHeight(),
                tileSetImage,
                (int) (map.getTileWidth()),
                (int) (map.getTileHeight())),
            tileLayer.getMapArray(),
            debugColor.intValue());

        return useAsMiniAllBinaryTiledLayer;
    }

    public AllBinaryTiledLayer getMiniInstance(final RaceTrackData raceTrackData) throws Exception {
        return useAsMiniAllBinaryTiledLayer;
    }

}
