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

import org.allbinary.game.GameInfo;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapEventHandler;

public class GDGameLayerManager extends AllBinaryGameLayerManager
    implements GeographicMapCompositeInterface {

    protected final LogUtil logUtil = LogUtil.getInstance();

    private BasicGeographicMap[] geographicMapInterfaceArray = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY;
    private GeographicMapCellType[] geographicMapCellTypeArray = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY;
    //private PlayerLayer playerLayer;

    public static int MAX_LEVEL = 7; //Integer.MAX_VALUE;

    public int layout = 0;

    public GDGameLayerManager(final BasicColor backgroundBasicColor,
        final BasicColor foregroundBasicColor, final GameInfo gameInfo) {
        super(backgroundBasicColor, foregroundBasicColor, gameInfo);
    }

    @Override
    public void remove(final AllBinaryLayer layerInterface)
        throws Exception {
        if (layerInterface == null) {
            logUtil.put("Remove: null", this, "remove");
            return;
        }

        super.remove(layerInterface);
    }

    @Override
    public BasicGeographicMap[] getGeographicMapInterface() {
        return geographicMapInterfaceArray;
    }

    @Override
    public void setGeographicMapInterface(final BasicGeographicMap[] geographicMapInterfaceArray) {
        final CommonStrings commonStrings = CommonStrings.getInstance();
        logUtil.put(commonStrings.START + this, this, commonStrings.PROCESS);

        this.geographicMapInterfaceArray = geographicMapInterfaceArray;
        this.geographicMapCellTypeArray = new GeographicMapCellType[this.geographicMapInterfaceArray.length];

        final GeographicMapEventHandler geographicMapEventHandler = GeographicMapEventHandler.getInstance();
        geographicMapEventHandler.fireEvent();
        geographicMapEventHandler.removeAllListeners();
    }

    @Override
    public GeographicMapCellType[] geographicMapCellTypeArray() {
        return this.geographicMapCellTypeArray;
    }

    /*
   public PlayerLayer getPlayerLayer() {
      return playerLayer;
   }
     */

 /*
   public void setPlayerLayer(PlayerLayer playerLayer) {
      this.playerLayer = playerLayer;
   }
     */
}
