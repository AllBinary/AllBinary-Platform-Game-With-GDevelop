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
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

public class GDGameLayerManager extends AllBinaryGameLayerManager
        implements GeographicMapCompositeInterface
{
    private BasicGeographicMap[] geographicMapInterfaceArray;
   //private PlayerLayer playerLayer;
   
   public static int MAX_LEVEL = 1; //Integer.MAX_VALUE;
   
   public int layout = 0;
   
   public GDGameLayerManager(final BasicColor backgroundBasicColor,
            final BasicColor foregroundBasicColor, final GameInfo gameInfo)
   {
      super(backgroundBasicColor, foregroundBasicColor, gameInfo);
   }

    public void remove(final AllBinaryLayer layerInterface)
        throws Exception
    {
        if(layerInterface == null) {
            LogUtil.put(LogFactory.getInstance("Remove: null", this, "remove"));
            return;
        }
        
        super.remove(layerInterface);
    }

   public BasicGeographicMap[] getGeographicMapInterface()
   {
      return geographicMapInterfaceArray;
   }

   public void setGeographicMapInterface(final BasicGeographicMap[] geographicMapInterfaceArray)
   {
      this.geographicMapInterfaceArray = geographicMapInterfaceArray;
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
