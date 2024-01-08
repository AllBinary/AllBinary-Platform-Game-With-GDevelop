<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionCentreCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        
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

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import java.util.Arrays;
import java.util.Hashtable;

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.TiledLayer;

import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory;
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory;
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources;
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals;
            </xsl:if>
        </xsl:for-each>

import org.allbinary.game.canvas.GDGameGlobals;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.HTMLFeatureFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryJ2METiledLayer;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.GDCustomGameLayer;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layer.special.TempMapMovementBehavior;
import org.allbinary.game.layer.special.TempNoMapMovementBehavior;
import org.allbinary.game.layer.special.TempMovementBehaviorFactory;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.map.GDGeographicMap;
import org.allbinary.game.map.GDTiledMapProperties;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.game.resource.GDResources;
import org.allbinary.graphics.DisplayUtil;
import org.allbinary.game.view.StaticTileLayerIntoPositionViewPosition;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactory;
import org.allbinary.layer.LayerInterfaceVisitor;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.PlatformAssetManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapInterface;
import org.allbinary.media.graphics.geography.map.platform.TileSetToGeographicMapUtil;
import org.allbinary.util.ArrayUtil;
import org.allbinary.util.BasicArrayList;
import org.mapeditor.loader.TiledMapLoaderFromJSONFactory;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TileSet;
import org.mapeditor.core.TiledMap;
import org.mapeditor.io.GDJSONMapReader;

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="content" >
                    //TileMap::TileMap:content - <xsl:value-of select="content/generator" />
                    <xsl:if test="content/generator = 'TileMapGenerator'" >
import org.mapgenerator.TileMapGenerator;
                    </xsl:if>
                    <xsl:if test="content/generator = 'DungeonGenerator'" >
import org.mapgenerator.dungeon.DungeonGenerator;
                    </xsl:if>

                </xsl:if>
            </xsl:if>
        </xsl:for-each>
                
public class GDGame<GDLayout>LevelBuilder implements LayerInterfaceVisitor
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
    </xsl:call-template>
        
    private final AllBinaryGameLayerManager layerManager;
    
    public GDGame<GDLayout>LevelBuilder(final AllBinaryGameLayerManager layerManager)
    		throws Exception
    {
    	this.layerManager = layerManager;

        // GPoint point = PointFactory.ZERO_ZERO;
        // this.layerPlacer = new ObamaStimulusLayerPlacer(this, point);
    }

        <xsl:variable name="isPlatformer" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
        
    public TiledMap createMap(final Image tileSetImage, final boolean forcePreGeneratedMap) {

        final CommonStrings commonStrings = CommonStrings.getInstance();

        try {
        
        final GDResources gdResources = GDResources.getInstance();
        final PlatformAssetManager platformAssetManager = PlatformAssetManager.getInstance();
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

                <xsl:variable name="stringValue" select="string" />
                //TileMap::TileMap - <xsl:value-of select="name" />

                <xsl:if test="content" >
                    //TileMap::TileMap:content - <xsl:value-of select="content/generator" />
                    <xsl:variable name="tileMapJSONWithExtension" select="content/tilemapJsonFile" />
                    <xsl:variable name="tileMapJSON" select="substring-before($tileMapJSONWithExtension, '.')" />
        InputStream tileMapInputStream2 = null;
                    <xsl:if test="content/generator = 'TileMapGenerator'" >
                    //"generator": "TileMapGenerator",
        final byte[] data = new TileMapGenerator().process2().getBytes();
        tileMapInputStream2 = new ByteArrayInputStream(data);
                    </xsl:if>
                    <xsl:if test="content/generator = 'DungeonGenerator'" >
        //"generator": "DungeonGenerator",

        final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        if(forcePreGeneratedMap) {
            gameGlobals.RandomDungeon = false;
            tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>);
        } else {
            gameGlobals.RandomDungeon = true;
            if(gameGlobals.RandomDungeon) {
                LogUtil.put(LogFactory.getInstance("Loading Tiled Map Asset", this, commonStrings.PROCESS));
                final DungeonGenerator dungeonGenerator = new DungeonGenerator();
                final int[][] mapData = dungeonGenerator.generate();
                final byte[] data = dungeonGenerator.generateJSONAsString(mapData, gameGlobals.tileWidth, gameGlobals.tileHeight).getBytes();
                tileMapInputStream2 = new ByteArrayInputStream(data);
            } else {
                tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>);
            }
        }
                    </xsl:if>
                    <xsl:if test="not(content/generator) or string-length(content/generator) = 0" >
        tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>);
                    </xsl:if>

        final InputStream tileMapInputStream = tileMapInputStream2;

        final InputStream[] tileSetInputStreamArray = {
                    <xsl:variable name="tileSetJSONWithExtension" select="content/tilesetJsonFile" />
                    <xsl:variable name="tileSetJSON" select="substring-before($tileSetJSONWithExtension, '.')" />
                    <xsl:if test="string-length(content/tilesetJsonFile) > 1" >
            platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileSetJSON" /></xsl:with-param></xsl:call-template>),
                    </xsl:if>

                    <xsl:for-each select="content/tilesetJsonFiles" >
                       <xsl:variable name="tileSetJSON" select="substring-before(text(), '.')" />
            platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileSetJSON" /></xsl:with-param></xsl:call-template>),
                    </xsl:for-each>
                    };
                </xsl:if>

        //LogUtil.put(LogFactory.getInstance("Loaded Tiled Map Asset", this, commonStrings.PROCESS));

        //LogUtil.put(LogFactory.getInstance("Loading Tiled Map", this, commonStrings.PROCESS));
        
        final Features features = Features.getInstance();
        final boolean isHTML = features.isDefault(HTMLFeatureFactory.getInstance().HTML);
        int size = 0;
        final int[] sizeArray2 = new int[tileSetInputStreamArray.length];
        if(isHTML) {
            //LogUtil.put(LogFactory.getInstance("tileMapInputStream.available()", this, commonStrings.PROCESS));
            size = tileMapInputStream.available();
            InputStream tileSetInputStream;
            final int size2 = tileSetInputStreamArray.length;
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index++) {
                tileSetInputStream = tileSetInputStreamArray[index];
                //LogUtil.put(LogFactory.getInstance("tileSetInputStream: " + tileSetInputStream, this, commonStrings.PROCESS));
                if(tileSetInputStream != null) {
                    sizeArray2[index] = tileSetInputStream.available();
                }
            }
        }
        //LogUtil.put(LogFactory.getInstance("Processing Tiled Map", this, commonStrings.PROCESS));
        final TiledMap map = TiledMapLoaderFromJSONFactory.getInstance().process(new GDJSONMapReader(), tileMapInputStream, tileSetInputStreamArray, size, sizeArray2, new Image[] {tileSetImage});
        map.setTileWidth(map.getTileWidth() * scale);
        map.setTileHeight(map.getTileHeight() * scale);
        map.getLayers().size();
        return map;
        } catch(Exception e) {
        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
        return this.createMap(tileSetImage, false);
        }
    }
            </xsl:if>

        </xsl:for-each>

    public void init() throws Exception
    {    
        final LayerInterfaceFactory layerInterfaceFactory = LayerInterfaceFactory.getInstance();

        layerInterfaceFactory.init();

        <xsl:variable name="hasTileMap" >
            <xsl:for-each select="objects" >
                <xsl:if test="type = 'TileMap::TileMap'" >found</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        TempMovementBehaviorFactory.getInstance().movementBehavior = <xsl:if test="contains($hasTileMap, 'found')" >TempMapMovementBehavior</xsl:if><xsl:if test="not(contains($hasTileMap, 'found'))" >TempNoMapMovementBehavior</xsl:if>.getInstance();

        // layerInterfaceFactory.add(new RussianInfantryLayerFactory());

        final ArtificialIntelligenceInterfaceFactoryInterfaceFactory artificialIntelligenceInterfaceFactoryInterfaceFactory = 
                ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance();

        artificialIntelligenceInterfaceFactoryInterfaceFactory.clear();

        // artificialIntelligenceInterfaceFactoryInterfaceFactory.add(new PacePatrolAIFactory());
        
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                //TileMap::TileMap - <xsl:value-of select="name" />
                
        final CommonStrings commonStrings = CommonStrings.getInstance();
        //LogUtil.put(LogFactory.getInstance("Loading Tiled Map Asset", this, commonStrings.PROCESS));

        final BasicColor BLACK = BasicColorFactory.getInstance().BLACK;
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

        final ImageCache imageCache = ImageCacheFactory.getInstance();
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources specialAnimationResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();
        final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtable().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);
        final Image tileSetImage = <xsl:value-of select="name" />ImageArray[0];
        
        final TiledMap map = this.createMap(tileSetImage, false);
        
        //LogUtil.put(LogFactory.getInstance("Loaded Tiled Map", this, commonStrings.PROCESS));
        
        final GDTiledMapProperties tiledMapProperties = new GDTiledMapProperties();
        
        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.layerManager;
        
        //final CommonSeps commonSeps = CommonSeps.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(map.getWidth()).append(commonSeps.COLON).append(map.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS));

        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(tileSetImage.getWidth()).append(commonSeps.COLON).append(tileSetImage.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS));

        <xsl:for-each select=".." >
            <xsl:call-template name="globalZoomCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="globalCentreCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("numStaticTiles: ").append((tileSetImage.getWidth() / map.getTileWidth()) * (tileSetImage.getHeight() / map.getTileHeight())).toString(), this, commonStrings.PROCESS));
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("tileset w/h: ").append(tileSetImage.getWidth()).append(',').append(tileSetImage.getHeight()).toString(), this, commonStrings.PROCESS));
        //final String string2 = new StringMaker().append("w: ").append(map.getWidth()).append(" h: ").append(map.getHeight()).append("tw: ").append(map.getTileWidth()).append(" th: ").append(map.getTileHeight()).toString();
        //LogUtil.put(LogFactory.getInstance(string2, this, commonStrings.PROCESS));
        //final String string = new StringMaker().append("w: ").append((int) (map.getWidth() * tileMapScale)).append(" h: ").append((int) (map.getHeight() * tileMapScale)).append("tw: ").append((int) (map.getTileWidth() * tileMapScale)).append(" th: ").append((int) (map.getTileHeight() * tileMapScale)).toString();
        //LogUtil.put(LogFactory.getInstance(string, this, commonStrings.PROCESS));

        final BasicGeographicMap[] geographicMapInterfaceArray = new BasicGeographicMap[map.getLayers().size()];

        final String MAX_TILE_ID = "MaxTileId: ";
        final StringMaker stringMaker = new StringMaker();

        final int size3 = geographicMapInterfaceArray.length;
        for(int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            final TileSet tileSet = (TileSet) map.getTileSets().get(0);
            final Hashtable tileTypeToTileIdsMap = TileSetToGeographicMapUtil.getInstance().convert(tileSet);
            <xsl:if test="contains($isPlatformer, 'found')" >
            org.allbinary.media.graphics.geography.map.platform.BasicPlatormGeographicMapCellTypeFactory.getInstance().init(tileTypeToTileIdsMap);
            </xsl:if>
            <xsl:if test="not(contains($isPlatformer, 'found'))" >
            org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory.getInstance().init(tileTypeToTileIdsMap);
            </xsl:if>
            final int maxTileId = tileSet.getMaxTileId() + 1;
            stringMaker.delete(0, stringMaker.length());
            LogUtil.put(LogFactory.getInstance(stringMaker.append(MAX_TILE_ID).append(maxTileId).toString(), this, commonStrings.PROCESS));
            final int[] cellTypeMapping = new int[maxTileId];
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> maxTileId; index++) {
                cellTypeMapping[index] = index;
            }

            geographicMapInterfaceArray[layerIndex] = new GDGeographicMap(((TileLayer) map.getLayer(layerIndex)), cellTypeMapping, map, tileSetImage, tiledMapProperties, BLACK, BLACK);
        }

        geographicMapCompositeInterface.setGeographicMapInterface(geographicMapInterfaceArray);

                <xsl:if test="content" >
                    <xsl:if test="content/generator = 'TileMapGenerator'" >
                    </xsl:if>
                    <xsl:if test="content/generator = 'DungeonGenerator'" >
        final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        if(gameGlobals.RandomDungeon) {
            this.setStartPoint(map, geographicMapInterfaceArray);
        }
                    </xsl:if>
                </xsl:if>

        <xsl:for-each select=".." >
            <xsl:call-template name="globalUpdateCentreCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="globalUpdateCentreCameraActions2" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

            </xsl:if>

        </xsl:for-each>

    }


        <xsl:for-each select="objects" >
                
            <xsl:if test="type = 'TileMap::TileMap'" >

    public void setStartPoint(final TiledMap map, final GeographicMapInterface[] geographicMapInterfaceArray) throws Exception {

        final StringMaker stringMaker = new StringMaker();
        //final String F = "Finding Start Position: ";
        
        //LogUtil.put(LogFactory.getInstance("Find Start Position", this, commonStrings.PROCESS));

        final int size3 = geographicMapInterfaceArray.length;
        
        final org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory basicTopViewGeographicMapCellTypeFactory
                = org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory.getInstance();

        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap platformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap) globals.PlatformerMapGDObjectList.get(0);
        int placementTotal = 0;
        int placementMax = 0;
        for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //LogUtil.put(LogFactory.getInstance("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS));
            final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
            final int[][] mapArray = tileLayer.getMapArray();
            final int size = mapArray.length * mapArray[0].length;
            if(size <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> placementMax) {
                placementMax = size;
            }
        }        
        final int[] placementXIntArray = new int[placementMax];
        final int[] placementYIntArray = new int[placementMax];

        BasicGeographicMapCellPositionFactory geographicMapCellPositionFactory;
        GeographicMapCellPosition geographicMapCellPosition;
        for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //LogUtil.put(LogFactory.getInstance("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS));
            geographicMapCellPositionFactory = geographicMapInterfaceArray[layerIndex].getGeographicMapCellPositionFactory();
            final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
            final int[][] mapArray = tileLayer.getMapArray();
            final int size4 = mapArray.length;
            final int size2 = mapArray[0].length;
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size4; index++) {
                for (int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                
                    //stringMaker.delete(0, stringMaker.length());
                    //LogUtil.put(LogFactory.getInstance(stringMaker.append(F).append(index).append(CommonSeps.getInstance().SPACE).append(index2).toString(), this, commonStrings.PROCESS));
                    //LogUtil.put(LogFactory.getInstance(basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.toString(), this, commonStrings.PROCESS));
                    
                    if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[index][index2])) {
                        placementXIntArray[placementTotal] = (index2) * map.getTileWidth();
                        placementYIntArray[placementTotal] = (index) * map.getTileHeight();
                        placementTotal++;
                    }

                    if (basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.isType(mapArray[index][index2])) {
                    
                        final AllBinaryTiledLayer allBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer();
                        stringMaker.delete(0, stringMaker.length());
                        LogUtil.put(LogFactory.getInstance(stringMaker.append("Planned Start Position c: ").append(allBinaryTiledLayer.getColumns()).append(CommonSeps.getInstance().FORWARD_SLASH).append(index2).append(" r: ").append(allBinaryTiledLayer.getRows()).append(CommonSeps.getInstance().FORWARD_SLASH).append(index).toString(), this, commonStrings.PROCESS));

                        geographicMapCellPosition = geographicMapCellPositionFactory.getInstance(index2, index);
                        
//                            DisplayChangeEventHandler.getInstance().addListener(new DisplayChangeEventListener() {
//                                
//                                public void onEvent(final AllBinaryEventObject eventObject) {
//                                    
//                                }
//
//                                public void onDisplayChangeEvent(final DisplayChangeEvent displayChangeEvent) {
//
//                                    final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
//                                    final int lastWidth = displayInfoSingleton.getLastHalfWidth();
//                                    final int lastHeight = displayInfoSingleton.getLastHalfHeight();
//                                    //DisplayChangeEventHandler.getInstance().removeListener(this);
//                                    udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this);
//
//                                }
//                            });
                                                
                        //(SceneWindowWidth() / 2) - (Player.Width() / 2)
                        this.setStartPosition(geographicMapInterfaceArray, geographicMapCellPosition, layerIndex, stringMaker);

//                        final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
//                        final int lastWidth = displayInfoSingleton.getLastHalfWidth();
//                        final int lastHeight = displayInfoSingleton.getLastHalfHeight();
//                        if(lastWidth != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> lastHeight != 0) {
//                            this.udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this);
//                        } else {
//                            stringMaker.delete(0, stringMaker.length());
//                            LogUtil.put(LogFactory.getInstance("Display not ready to set start position", this, commonStrings.PROCESS));
//                        }

                    }
                }
            }
        }
        
        final ArrayUtil arrayUtil = ArrayUtil.getInstance();
        platformerMap.placementXIntArray = arrayUtil.copyOf(placementXIntArray, placementTotal);
        platformerMap.placementYIntArray = arrayUtil.copyOf(placementYIntArray, placementTotal);
        platformerMap.placementIntArray = new int[placementTotal];
        final int size = platformerMap.placementIntArray.length;
        final MyRandomFactory randomFactory = MyRandomFactory.getInstance();
        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            platformerMap.placementIntArray[index] = randomFactory.getAbsoluteNextInt(placementTotal);
        }
        LogUtil.put(LogFactory.getInstance("placementTotal: " + placementTotal, this, commonStrings.PROCESS));
    }

//    private int lastWidthUsed = 0;
//    private int lastHeightUsed = 0;
        
//    public void udpatePositionFromWindowSize(final int lastWidth, final int lastHeight, final StringMaker stringMaker, final Object reason) {
//    
//        stringMaker.delete(0, stringMaker.length());
//        LogUtil.put(LogFactory.getInstance(stringMaker.append("DisplayInfoSingleton ").append(lastWidth).append(CommonSeps.getInstance().COMMA).append(lastHeight).toString(), reason, commonStrings.PROCESS));
//        
//        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
//
//        final GDCustomGameLayer PlatformerMapGDGameLayer = (GDCustomGameLayer) globals.PlatformerMapGDGameLayerList.get(0);
//        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap PlatformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap) PlatformerMapGDGameLayer.gdObject;
//
//        final int dx = (lastWidth - lastWidthUsed);
//        final int dy = (lastHeight - lastHeightUsed);
//        
//        if(dx != 0 || dy != 0) {
//            stringMaker.delete(0, stringMaker.length());
//            LogUtil.put(LogFactory.getInstance(stringMaker.append("DisplayInfoSingleton dx/dy: ").append(dx).append(CommonSeps.getInstance().FORWARD_SLASH).append(dy).toString(), reason, commonStrings.PROCESS));
//
//            PlatformerMap.setX(PlatformerMap.x + dx);
//            PlatformerMap.setY(PlatformerMap.y + dy);
//            lastWidthUsed = lastWidth;
//            lastHeightUsed = lastHeight;
//        }
//
//        PlatformerMapGDGameLayer.updatePosition2();
//    }

    public void setStartPosition(final GeographicMapInterface[] geographicMapInterfaceArray, final GeographicMapCellPosition geographicMapCellPosition, final int layerIndex, final StringMaker stringMaker) {
        
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

        final GDCustomGameLayer PlatformerMapGDGameLayer = (GDCustomGameLayer) globals.PlatformerMapGDGameLayerList.get(0);
        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap PlatformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.PlatformerMap) PlatformerMapGDGameLayer.gdObject;
        //final GDObject Wall = (GDObject) globals.WallGDObjectList.get(0);
        //final GDGameLayer wallGDGameLayer = (GDGameLayer) globals.WallGDGameLayerList.get(0);

        final AllBinaryTiledLayer allBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer();

        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        //final GDGameLayer PlayerGDGameLayer = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);

        PlatformerMap.startX = -( ((geographicMapCellPosition.getColumn()) * allBinaryTiledLayer.getCellWidth()) );
        PlatformerMap.startY = -( ((geographicMapCellPosition.getRow()) * allBinaryTiledLayer.getCellHeight()) );

        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(PlatformerMap.startX).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.startY).toString(), this, commonStrings.PROCESS));

        PlatformerMap.setX(PlatformerMap.Variable((int) PlatformerMap.startX));
        PlatformerMap.setY(PlatformerMap.Variable((int) PlatformerMap.startY));

        PlatformerMapGDGameLayer.updatePosition2();
    }
        
    public void setPosition(final GeographicMapCompositeInterface geographicMapCompositeInterface)
    {
        final AllBinaryLayer layer = StaticTileLayerIntoPositionViewPosition.layer;
        
        if(layer != null) {
        
        final BasicGeographicMap[] geographicMapInterfaceArray = geographicMapCompositeInterface.getGeographicMapInterface();
        TiledLayer tiledLayer;
        
        GDGeographicMap geographicMapInterface;
        final int size = geographicMapInterfaceArray.length;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            geographicMapInterface = (GDGeographicMap) geographicMapInterfaceArray[index];
            tiledLayer = ((AllBinaryJ2METiledLayer) geographicMapInterface.getAllBinaryTiledLayer()).getTiledLayer();
 
            //final int centerCameraX = (int) (SceneWindowWidth() / 2);
            //final int centerCameraY = (int) (SceneWindowHeight() / 2);
            //final int x2 = centerCameraX - layer.getHalfWidth() - tiledLayer.getX();
            //final int y2 = centerCameraY - layer.getHalfHeight() - tiledLayer.getY();
            //final int x2 = layer.getX() - tiledLayer.getX();
            //final int y2 = layer.getY() - tiledLayer.getY();
            final int mapX = ((tiledLayer.getRows() * tiledLayer.getCellHeight()) / 2);
            final int mapY = ((tiledLayer.getColumns() * tiledLayer.getCellWidth()) / 2);
            //final int x2 = mapX + tiledLayer.getX();
            //final int y2 = mapY + tiledLayer.getY();
            
            final int x2 = mapX - layer.getHalfWidth() - 78;
            final int y2 = mapY + layer.getHeight() + layer.getHalfHeight();
        
//        final CommonStrings commonStrings = CommonStrings.getInstance();
//        LogUtil.put(LogFactory.getInstance(new StringMaker().append("camera x: ").append(centerCameraX).append("y: ").append(centerCameraY).toString(), this, commonStrings.PROCESS));
//        LogUtil.put(LogFactory.getInstance(new StringMaker().append("x: ").append(layer.getX()).append("y: ").append(layer.getY()).toString(), this, commonStrings.PROCESS));
//        LogUtil.put(LogFactory.getInstance(new StringMaker().append("tile x: ").append(tiledLayer.getX()).append("y: ").append(tiledLayer.getY()).toString(), this, commonStrings.PROCESS));
//        LogUtil.put(LogFactory.getInstance(new StringMaker().append("map x: ").append(mapX).append("y: ").append(mapY).toString(), this, commonStrings.PROCESS));
//        LogUtil.put(LogFactory.getInstance(new StringMaker().append("2 x: ").append(x2).append("y: ").append(y2).toString(), this, commonStrings.PROCESS));
            layer.setPosition(x2, y2, layer.getZ());
        }

        }
    }
            </xsl:if>
        </xsl:for-each>

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
    
    public int SceneWindowWidth() {
        return displayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return displayInfoSingleton.getLastHeight();
    }
    
}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
