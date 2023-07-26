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
package org.allbinary.game.level;

import javax.microedition.lcdui.Image;
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.map.GDGeographicMap;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactory;
import org.allbinary.layer.LayerInterfaceVisitor;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TiledMap;

public class GDGameLevelBuilder implements LayerInterfaceVisitor
{
    private final AllBinaryGameLayerManager layerManager;

    public GDGameLevelBuilder(final AllBinaryGameLayerManager layerManager)
    		throws Exception
    {
    	this.layerManager = layerManager;

        // GPoint point = PointFactory.ZERO_ZERO;
        // this.layerPlacer = new ObamaStimulusLayerPlacer(this, point);
    }

    public void init() throws Exception
    {
        LayerInterfaceFactory layerInterfaceFactory = LayerInterfaceFactory.getInstance();

        layerInterfaceFactory.init();

        // layerInterfaceFactory.add(new RussianInfantryLayerFactory());

        ArtificialIntelligenceInterfaceFactoryInterfaceFactory artificialIntelligenceInterfaceFactoryInterfaceFactory = ArtificialIntelligenceInterfaceFactoryInterfaceFactory
                .getInstance();

        artificialIntelligenceInterfaceFactoryInterfaceFactory.clear();

        // artificialIntelligenceInterfaceFactoryInterfaceFactory.add(new
        // PacePatrolAIFactory());
        
        final BasicColor BLACK = BasicColorFactory.getInstance().BLACK;
        final TiledMap map = null;
        final Image tileSetImage = null;

        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.layerManager;
        
        geographicMapCompositeInterface.setGeographicMapInterface(
                new GDGeographicMap(((TileLayer) map.getLayer(0)).getId(), map, tileSetImage, BLACK, BLACK)
                );
    }

    //private BasicGameResources[] playerResourceArray = new BasicGameResources[1];
    //private Hashtable hashtable = new Hashtable();
    //private ArtificialIntelligenceInterfaceFactoryInterface artificialIntelligenceInterfaceFactoryInterface =
      //  new BoundBounceAIFactory();

    public void build() throws Exception
    {
    }

    public void visit(AllBinaryLayer layerInterface) throws Exception
    {
        layerInterface.setVisible(true);
        this.layerManager.append(layerInterface);
    }
}