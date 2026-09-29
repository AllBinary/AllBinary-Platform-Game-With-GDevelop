/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2025 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const Image
import { TiledLayer } from '../../../../javax/microedition/lcdui/game/TiledLayer.js';
//not GWT import const AllBinaryTiledLayer
import { PlacementAllBinaryJ2METiledLayer } from '../../../../org/allbinary/game/layer/PlacementAllBinaryJ2METiledLayer.js';
//not GWT import const BasicColor
import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const TiledMap
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDTiledLayerFactory extends Object {
    constructor(tileLayer, cellTypeIdToGeographicMapCellType, map, tileSetImage, debugColor) {
        super();
        this.tileLayer = tileLayer;
        this.map = map;
        this.tileSetImage = tileSetImage;
        this.debugColor = debugColor;
    }
    //@Throws(Exception.constructor)
    getInstance(raceTrackInfo, raceTrackData) {
        this.useAsMiniAllBinaryTiledLayer = new PlacementAllBinaryJ2METiledLayer(SmallIntegerSingletonFactory.getInstance().getAt(-1), new TiledLayer(this.map.getWidth(), this.map.getHeight(), this.tileSetImage, Math.round((this.map.getTileWidth())), Math.round((this.map.getTileHeight()))), this.tileLayer.getMapArray(), this.debugColor.intValue());
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.useAsMiniAllBinaryTiledLayer;
    }
    //@Throws(Exception.constructor)
    getMiniInstance(raceTrackData) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.useAsMiniAllBinaryTiledLayer;
    }
}
