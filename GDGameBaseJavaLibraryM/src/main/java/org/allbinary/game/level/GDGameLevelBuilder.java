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

import java.io.InputStream;
import javax.microedition.lcdui.Image;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory;
import org.allbinary.game.canvas.GD0SpecialAnimationResources;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.map.GDGeographicMap;
import org.allbinary.game.resource.GDResources;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactory;
import org.allbinary.layer.LayerInterfaceVisitor;
import org.allbinary.logic.basic.string.CommonSeps;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.mapeditor.loader.TiledMapLoaderFromJSONFactory;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TiledMap;
import org.mapeditor.io.GDJSONMapReader;

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
        final LayerInterfaceFactory layerInterfaceFactory = LayerInterfaceFactory.getInstance();

        layerInterfaceFactory.init();

        // layerInterfaceFactory.add(new RussianInfantryLayerFactory());

        final ArtificialIntelligenceInterfaceFactoryInterfaceFactory artificialIntelligenceInterfaceFactoryInterfaceFactory = 
                ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance();

        artificialIntelligenceInterfaceFactoryInterfaceFactory.clear();

        // artificialIntelligenceInterfaceFactoryInterfaceFactory.add(new PacePatrolAIFactory());
        
        final BasicColor BLACK = BasicColorFactory.getInstance().BLACK;
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        final GDResources gdResources = GDResources.getInstance();
        final InputStream inputStream = resourceUtil.getResourceAsStream(gdResources.MY_PLATFORMER_MAP);

        final ImageCache imageCache = ImageCacheFactory.getInstance();
        final GD0SpecialAnimationResources specialAnimationResources = GD0SpecialAnimationResources.getInstance();
        final Image[] PlatformMapImageArray = (Image[]) imageCache.getHashtable().get(specialAnimationResources.PLATFORMERMAP_IMAGE_ARRAY_NAME);
        final Image tileSetImage = PlatformMapImageArray[0];

        final TiledMap map = TiledMapLoaderFromJSONFactory.getInstance().process(new GDJSONMapReader(), inputStream, new Image[] {tileSetImage});

        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.layerManager;
        
        final CommonStrings commonStrings = CommonStrings.getInstance();
        //final CommonSeps commonSeps = CommonSeps.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(map.getWidth()).append(commonSeps.COLON).append(map.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS));

        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(tileSetImage.getWidth()).append(commonSeps.COLON).append(tileSetImage.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS));

        LogUtil.put(LogFactory.getInstance(new StringMaker().append("numStaticTiles: ").append((tileSetImage.getWidth() / map.getTileWidth()) * (tileSetImage.getHeight() / map.getTileHeight())).toString(), this, commonStrings.PROCESS));

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
        this.init();
    }

    public void visit(final AllBinaryLayer layerInterface) throws Exception
    {
        layerInterface.setVisible(true);
        this.layerManager.append(layerInterface);
    }
}