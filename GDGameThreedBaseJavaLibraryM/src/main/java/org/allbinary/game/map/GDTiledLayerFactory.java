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

import org.allbinary.animation.Animation;
import org.allbinary.game.layer.AllBinaryThreedVisibleTiledLayer;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo;
import org.allbinary.media.graphics.geography.map.racetrack.threed.RaceTrackThreedData;
import org.allbinary.media.graphics.geography.map.racetrack.threed.ThreedTiledLayerResourcesFactory;

/**
 *
 * @author User
 */
public class GDTiledLayerFactory implements AllBinaryTiledLayerFactoryInterface {

    private AllBinaryTiledLayer useAsMiniAllBinaryTiledLayer;

    public GDTiledLayerFactory() {
    }

    public AllBinaryTiledLayer getInstance(final RaceTrackInfo raceTrackInfo, final RaceTrackData raceTrackData)
        throws Exception {

        final RaceTrackThreedData raceTrackThreedData =
            ThreedTiledLayerResourcesFactory.getInstance().getInstance(raceTrackInfo.getId());

        final Animation[] animationInterfaceArray = raceTrackThreedData.getAnimationArray();

        final int columns = raceTrackData.getMapArray()[0].length;
        final int rows = raceTrackData.getMapArray().length;

        final int width = columns * raceTrackData.getCellWidth();
        final int height = rows * raceTrackData.getCellHeight();

        useAsMiniAllBinaryTiledLayer = new AllBinaryThreedVisibleTiledLayer(
            raceTrackData.getId(), raceTrackData.getMapArray(),
            animationInterfaceArray, columns, rows, width, height,
            raceTrackData.getCellWidth(), raceTrackData.getCellHeight(),
            9);

        return useAsMiniAllBinaryTiledLayer;
    }

    //Needs a mini3d tile layer
    public AllBinaryTiledLayer getMiniInstance(final RaceTrackData raceTrackData) throws Exception {
        return useAsMiniAllBinaryTiledLayer;
    }

}
