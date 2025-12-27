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

import org.allbinary.J2MEUtil;
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
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.game.gd.resource.GDLazyResources;
import org.allbinary.game.map.GDTiledLayerFactory;
import org.allbinary.game.view.StaticTileLayerIntoPositionViewPosition;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactory;
import org.allbinary.layer.LayerInterfaceVisitor;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

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
import org.mapeditor.io.TiledJSONUtil;

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:variable name="layoutName" select="name" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >

                <xsl:variable name="hasOneOrMoreTileMaps" >
                    <xsl:for-each select="objects" >
                        <xsl:if test="type = 'TileMap::TileMap'" >found</xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="tileMapGenerator" >
                    <xsl:for-each select="objects" >
                        <xsl:if test="type = 'TileMap::TileMap'" >
                            <xsl:if test="content" >
                                //TileMap::TileMap:content - <xsl:value-of select="content/generator" />
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:value-of select="$tileMapGenerator" />
                <xsl:if test="contains($tileMapGenerator, 'TileMapGenerator')" >
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor;
import org.mapgenerator.TileMapGenerator;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.game.map.GDTiledLayerFactory;
                </xsl:if>
                <xsl:if test="contains($tileMapGenerator, 'DungeonGenerator')" >
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor;
import org.mapgenerator.dungeon.DungeonGenerator;
import org.mapgenerator.dungeon.Tunneller;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.game.map.GDTiledLayerFactory;
                </xsl:if>

    <xsl:variable name="foundPathFindingBehavior" >
        <xsl:for-each select="//behaviorsSharedData" >
            <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >
            <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >found</xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="hasPathFindingBehaviorInOtherLayouts" >
        <xsl:for-each select="//behaviorsSharedData" >
            <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >found</xsl:if>
        </xsl:for-each>
    </xsl:variable>

    <xsl:if test="contains($hasPathFindingBehaviorInOtherLayouts, 'found')" >
import org.allbinary.thread.PathFindingThreadPool;
    </xsl:if>

    <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface;
import org.allbinary.media.graphics.geography.map.NoGeographicMapCellPositionFactoryInitVisitor;
import org.allbinary.media.graphics.geography.pathfinding.PathGenerator;
//import org.allbinary.game.layer.geological.resources.GeologicalGeographicMapCellPositionFactoryInitVisitor;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.game.map.GDTiledLayerFactory;
import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory;
    </xsl:if>

public class GDGame<GDLayout>LevelBuilder implements LayerInterfaceVisitor
{
    protected final LogUtil logUtil = LogUtil.getInstance();
    
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();

    private final BasicColor[] COLORS = {
        BasicColorFactory.getInstance().RED,
        BasicColorFactory.getInstance().GREEN,
    };

    private final GDResources gdResources = GDResources.getInstance();
    //private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
        
    private final AllBinaryGameLayerManager layerManager;

    private int generatedWidth;
    private int generatedHeight;
    
    <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
    //if path findingbehavior
    private final GeographicMapCellPositionFactoryInitVisitorInterface geographicMapCelPositionFactoryInitVisitorInterface =
        new NoGeographicMapCellPositionFactoryInitVisitor();
        //new GeologicalGeographicMapCellPositionFactoryInitVisitor();
    </xsl:if>
        
    public GDGame<GDLayout>LevelBuilder(final AllBinaryGameLayerManager layerManager)
    		throws Exception
    {
    	this.layerManager = layerManager;

        // GPoint point = PointFactory.ZERO_ZERO;
        // this.layerPlacer = new ObamaStimulusLayerPlacer(this, point);
        
    }

        <xsl:variable name="isPlatformer" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >
        
    public TiledMap create<xsl:value-of select="name" />TiledMap(final TiledMap lastMap, final int[] tileSetImageHeightArray) {

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>
    
        final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();

        try {
        
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
        if(!gameGlobals.RandomDungeon) {
            final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject);
            final int size = platformerMap.placementIntArray.length;
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                platformerMap.placementXIntArray[index] *= 2;
                platformerMap.placementYIntArray[index] *= 2;
            }

            tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>);
        } else {
            //logUtil.put("Loading Tiled Map Asset", this, commonStrings.PROCESS);
            final DungeonGenerator dungeonGenerator = new DungeonGenerator();
            final TiledJSONUtil tiledJSONUtil = TiledJSONUtil.getInstance();
            //dungeonGenerator.setConfig(Tunneller.getConfigParameters());
            final int[][] mapData = dungeonGenerator.generate();
            generatedWidth = mapData.length;
            generatedHeight = mapData[0].length;
            final byte[] data = tiledJSONUtil.generateJSONAsString(mapData, gameGlobals.tileWidth, gameGlobals.tileHeight).getBytes();
            tileMapInputStream2 = new ByteArrayInputStream(data);
        }
                    </xsl:if>
                    <xsl:if test="content/generator = 'SameSizeGenerator'" >
        //"generator": "SameSizeGenerator",
        if(!gameGlobals.RandomDungeon) {
            final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject);
            final int size = platformerMap.placementIntArray.length;
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                platformerMap.placementXIntArray[index] *= 2;
                platformerMap.placementYIntArray[index] *= 2;
            }

            tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>);
        } else {
            //logUtil.put("Loading Tiled Map Asset", this, commonStrings.PROCESS);
            final TiledJSONUtil tiledJSONUtil = TiledJSONUtil.getInstance();
            final int[][] mapData = new int[generatedWidth][generatedHeight];

            final TileMapPlacementVisitor tileMapPlacementVisitor = 
                //new org.allbinary.game.behavior.topview.placement.AllAnimationsEverywhereTileMapPlacementVisitor();
                new org.allbinary.game.behavior.topview.placement.PropsTileMapPlacementVisitor();
            tileMapPlacementVisitor.visit(lastMap, mapData);

            final byte[] data = tiledJSONUtil.generateJSONAsString(mapData, gameGlobals.tileWidth, gameGlobals.tileHeight).getBytes();
            tileMapInputStream2 = new ByteArrayInputStream(data);
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

        //logUtil.put("Loaded Tiled Map Asset", this, commonStrings.PROCESS);

        //logUtil.put("Loading Tiled Map" + map, this, commonStrings.PROCESS);
        
        final Features features = Features.getInstance();
        int size = 0;
        final int[] sizeArray2 = new int[tileSetInputStreamArray.length];
        if(J2MEUtil.isHTML()) {
            //logUtil.put("tileMapInputStream.available()", this, commonStrings.PROCESS);
            size = tileMapInputStream.available();
            InputStream tileSetInputStream;
            final int size2 = tileSetInputStreamArray.length;
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index++) {
                tileSetInputStream = tileSetInputStreamArray[index];
                //logUtil.put("tileSetInputStream: " + tileSetInputStream, this, commonStrings.PROCESS);
                if(tileSetInputStream != null) {
                    sizeArray2[index] = tileSetInputStream.available();
                }
            }
        }
        //logUtil.put("Processing Tiled Map", this, commonStrings.PROCESS);
        final TiledMap map = TiledMapLoaderFromJSONFactory.getInstance().process(new GDJSONMapReader(), tileMapInputStream, tileSetInputStreamArray, size, sizeArray2, tileSetImageHeightArray);
        if(map == null) {
            throw new Exception();
        }
        map.setTileWidth(map.getTileWidth()* scale);
        map.setTileHeight(map.getTileHeight() * scale);
        map.getLayers().size();
        return map;
        } catch(Exception e) {
        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
        gameGlobals.RandomDungeon = false;
        return this.create<xsl:value-of select="name" />TiledMap(lastMap, tileSetImageHeightArray);
        }
    }
            </xsl:if>

        </xsl:for-each>

    public void init() throws Exception
    {
    
    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>
    
        final LayerInterfaceFactory layerInterfaceFactory = LayerInterfaceFactory.getInstance();

        layerInterfaceFactory.init();

        TempMovementBehaviorFactory.getInstance().movementBehavior = <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >TempMapMovementBehavior</xsl:if><xsl:if test="not(contains($hasOneOrMoreTileMaps, 'found'))" >TempNoMapMovementBehavior</xsl:if>.getInstance();

        // layerInterfaceFactory.add(new RussianInfantryLayerFactory());

        final ArtificialIntelligenceInterfaceFactoryInterfaceFactory artificialIntelligenceInterfaceFactoryInterfaceFactory = 
                ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance();

        artificialIntelligenceInterfaceFactoryInterfaceFactory.clear();

        // artificialIntelligenceInterfaceFactoryInterfaceFactory.add(new PacePatrolAIFactory());
        
        <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >

        final String MAX_TILE_ID = "MaxTileId: ";
        final StringMaker stringMaker = new StringMaker();
            
        final BasicColor BLACK = BasicColorFactory.getInstance().BLACK;
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

        final ImageCache imageCache = ImageCacheFactory.getInstance();
        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources specialAnimationResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();

        final BasicArrayList geographicMapList = new BasicArrayList();

        TiledMap map = null;
        
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
        if(true) {
                //TileMap::TileMap - <xsl:value-of select="name" />

        //logUtil.put("Loading Tiled Map Asset: <xsl:value-of select="name" />", this, commonStrings.PROCESS);

        final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);
        
        <xsl:variable name="imageWithExtension" select="content/tilemapAtlasImage" />
        <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
        final int resourceIndex = imageCache.getIndex(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>);
        final int[] tileSetImageHeightArray = new int[] { GDLazyResources.getInstance().imageResourceHeightArray[resourceIndex] };

        Image tileSetImage = null;
        if(<xsl:value-of select="name" />ImageArray != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> <xsl:value-of select="name" />ImageArray.length <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            tileSetImage = <xsl:value-of select="name" />ImageArray[0];
        }

        map = this.create<xsl:value-of select="name" />TiledMap(map, tileSetImageHeightArray);
        
        //logUtil.put("Loaded Tiled Map", this, commonStrings.PROCESS);
        
        //logUtil.put(new StringMaker().append(map.getWidth()).append(commonSeps.COLON).append(map.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS);

        //logUtil.put(new StringMaker().append(tileSetImage.getWidth()).append(commonSeps.COLON).append(tileSetImage.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS);

        <xsl:for-each select=".." >
            <xsl:call-template name="globalZoomCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="globalCentreCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        //logUtil.put(new StringMaker().append("numStaticTiles: ").append((tileSetImage.getWidth() / map.getTileWidth()) * (tileSetImage.getHeight() / map.getTileHeight())).toString(), this, commonStrings.PROCESS);
        //logUtil.put(new StringMaker().append("tileset w/h: ").append(tileSetImage.getWidth()).append(',').append(tileSetImage.getHeight()).toString(), this, commonStrings.PROCESS);
        //final String string2 = new StringMaker().append("w: ").append(map.getWidth()).append(" h: ").append(map.getHeight()).append("tw: ").append(map.getTileWidth()).append(" th: ").append(map.getTileHeight()).toString();
        //logUtil.put(string2, this, commonStrings.PROCESS);
        //final String string = new StringMaker().append("w: ").append((int) (map.getWidth() * tileMapScale)).append(" h: ").append((int) (map.getHeight() * tileMapScale)).append("tw: ").append((int) (map.getTileWidth() * tileMapScale)).append(" th: ").append((int) (map.getTileHeight() * tileMapScale)).toString();
        //logUtil.put(string, this, commonStrings.PROCESS);

        stringMaker.delete(0, stringMaker.length());

        final int size3 = map.getLayers().size();
        for(int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            final TileSet tileSet = (TileSet) map.getTileSets().get(0);
            final Hashtable tileTypeToTileIdsMap = TileSetToGeographicMapUtil.getInstance().convert(tileSet);
            
            final int maxTileId = tileSet.getMaxTileId() + 1;
            
            final GeographicMapCellTypeFactory geographicMapCellTypeFactory = 
            <xsl:if test="contains($isPlatformer, 'found')" >
            new org.allbinary.media.graphics.geography.map.platform.BasicPlatormGeographicMapCellTypeFactory(tileTypeToTileIdsMap, maxTileId);
            </xsl:if>
            <xsl:if test="not(contains($isPlatformer, 'found'))" >
            new org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory(tileTypeToTileIdsMap, maxTileId);
            </xsl:if>

            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(MAX_TILE_ID).append(maxTileId).toString(), this, commonStrings.PROCESS);
            final int[] cellTypeMapping = new int[maxTileId];
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> maxTileId; index++) {
                cellTypeMapping[index] = index;
            }

            final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
            final BasicColor color = COLORS[geographicMapList.size()];
            
            final AllBinaryTiledLayerFactoryInterface allBinaryTwodThreedTiledLayerFactory = new GDTiledLayerFactory();

            geographicMapList.add(new GDGeographicMap(allBinaryTwodThreedTiledLayerFactory, tileLayer, cellTypeMapping, map, tileSetImage, geographicMapCellTypeFactory, BLACK, BLACK, color,
                <xsl:if test="contains($foundPathFindingBehavior, 'found')" >new CustomMapGeneratorFactory()</xsl:if><xsl:if test="not(contains($foundPathFindingBehavior, 'found'))" >new CustomMapGeneratorBaseFactory()</xsl:if>));
        }

        }
            </xsl:if>

        </xsl:for-each>

        final BasicGeographicMap[] geographicMapInterfaceArray = (BasicGeographicMap[]) geographicMapList.toArray(new BasicGeographicMap[geographicMapList.size()]);
        
                <xsl:value-of select="$tileMapGenerator" />
                <xsl:if test="contains($tileMapGenerator, 'TileMapGenerator')" >

                </xsl:if>
                <xsl:if test="contains($tileMapGenerator, 'DungeonGenerator')" >
        final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        if(gameGlobals.RandomDungeon) {
            this.setStartPoint(geographicMapInterfaceArray);
        }
                </xsl:if>

        <xsl:for-each select=".." >
            <xsl:call-template name="globalUpdateCentreCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="globalUpdateCentreCameraActions2" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        
        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.layerManager;
        
        //System.out.println("TWB set map");
        geographicMapCompositeInterface.setGeographicMapInterface(geographicMapInterfaceArray);
                
        </xsl:if>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
        //if path findingbehavior
        final BasicGeographicMap geographicMap = 
            geographicMapCompositeInterface.getGeographicMapInterface()[0];

        //Reset resources
        geographicMap.getGeographicMapCellPositionFactory().visit(
            geographicMapCelPositionFactoryInitVisitorInterface
           );

        PathGenerator.getInstance().init(geographicMap, 2);
            
        PathFindingInfoFactory.init(32768); //This should be the max map height x width for all maps in a game and/or max vertices in a path
        </xsl:if>
        
        <xsl:if test="contains($hasPathFindingBehaviorInOtherLayouts, 'found')" >
        PathFindingThreadPool.getInstance().clear();
        </xsl:if>


    }

        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >
                <xsl:if test="name = 'PlatformerMap'" >

    public boolean isAlreadyIncluded(final int[][] placementCellXIntArray, final int[][] placementCellYIntArray, final int[] placementCellTotal, final int indexX, final int indexY) {

        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 4; index++) {
            final int size = placementCellTotal[index];
            for (int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index2++) {
                if(placementCellXIntArray[index][index2] + 4 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                placementCellYIntArray[index][index2] + 4 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> indexY) {
                    return true;
                }
            }
        }
        
        return false;
    }

    private final int[][] ADJACENT = {
        {0, -1},
        {0, 1},
        {1, -1},
        {1, 0},
        {1, 1},
        {-1, -1},
        {-1, 0},
        {-1, 1}
    };

    boolean result = true;
    public void isGoodForPlacement(final org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory basicTopViewGeographicMapCellTypeFactory, 
        final int[][] mapArray, final int[][] propsMapArray, final int indexX, final int indexY, final int recursionIndex) {

        if(indexY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray.length <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray[0].length) {
            final int size = this.ADJACENT.length;
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                final int adjacentIndexX = indexX + ADJACENT[index][1];
                final int adjacentIndexY = indexY + ADJACENT[index][0];

                if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[adjacentIndexY][adjacentIndexX]) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                    propsMapArray[adjacentIndexY][adjacentIndexX] != 49) {
                    if (recursionIndex <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                        this.isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, adjacentIndexX, adjacentIndexY, recursionIndex - 1);
                    }
                } else {
                    result = false;
                }
            }
        } else {
            result = false;
        }
        
    }

    public void setStartPoint(final GeographicMapInterface[] geographicMapInterfaceArray) throws Exception {

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>

        final StringMaker stringMaker = new StringMaker();
        //final String F = "Finding Start Position: ";
        
        //logUtil.put("Find Start Position", this, commonStrings.PROCESS);

        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject);
        int placementTotal = 0;
        int placementTotal1 = 0;
        int placementTotal2 = 0;
        int placementTotal3 = 0;
        int placementMax = 0;

        if(true) {
        final int layerIndex = 0;
        //for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //logUtil.put("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS);
            final GDGeographicMap gdGeographicMap = (GDGeographicMap) geographicMapInterfaceArray[layerIndex];
            final TiledMap map = gdGeographicMap.getMap();
            final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
            final int[][] mapArray = tileLayer.getMapArray();
            final int size = mapArray.length * mapArray[0].length;
            if(size <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> placementMax) {
                placementMax = size;
            }
        }        
        final int[] placementXIntArray = new int[placementMax];
        final int[] placementYIntArray = new int[placementMax];
        final int[] placementSizeIntArray = new int[placementMax];

        boolean placed;

        AllBinaryTiledLayer allBinaryTiledLayer;
        org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory basicTopViewGeographicMapCellTypeFactory;
        BasicGeographicMapCellPositionFactory geographicMapCellPositionFactory;
        GeographicMapCellPosition geographicMapCellPosition;

        int currentY = 0;
        final int MAX_HISTORY_Y = 4;

        if(true) {
        final int layerIndex = 0;
        final int propsLayerIndex = 1;
        //for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //logUtil.put("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS);

            final GDGeographicMap gdGeographicMap = (GDGeographicMap) geographicMapInterfaceArray[layerIndex];
            final TiledMap map = gdGeographicMap.getMap();
            final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
            final int[][] mapArray = tileLayer.getMapArray();
            
            final GDGeographicMap propsGDGeographicMap = (GDGeographicMap) geographicMapInterfaceArray[propsLayerIndex];
            final TiledMap propsMap = propsGDGeographicMap.getMap();
            final TileLayer propsTileLayer = ((TileLayer) propsMap.getLayer(0));
            final int[][] propsMapArray = propsTileLayer.getMapArray();
            
            basicTopViewGeographicMapCellTypeFactory = (org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory) gdGeographicMap.getGeographicMapCellTypeFactory();
            allBinaryTiledLayer = gdGeographicMap.getAllBinaryTiledLayer();
            geographicMapCellPositionFactory = gdGeographicMap.getGeographicMapCellPositionFactory();

            final int size4 = mapArray.length;
            final int size2 = mapArray[0].length;
            
            final int[][] placementCellXIntArray = new int[MAX_HISTORY_Y][size2];
            final int[][] placementCellYIntArray = new int[MAX_HISTORY_Y][size2];
            final int[] placementCellTotal = new int[MAX_HISTORY_Y];

            int type;
            for (int indexY = 0; indexY <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size4; indexY++) {
                placementCellTotal[currentY] = 0;
                for (int indexX = 0; indexX <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; indexX++) {
                
                    type = mapArray[indexY][indexX];

//                    if (basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE.isType(type) || basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(type)) {
//                    } else {
//                        stringMaker.delete(0, stringMaker.length());
//                        logUtil.put(stringMaker.append("type: ").append(type).toString(), this, commonStrings.PROCESS);
//                    }

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append(F).append(indexY).append(CommonSeps.getInstance().SPACE).append(indexX).toString(), this, commonStrings.PROCESS);
                    //logUtil.put(basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.toString(), this, commonStrings.PROCESS);

                    if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(type)) {
                        //Exclude placement next to something that is not a floor tile
                        placed = false;
                        
                        final boolean isFarEnoughFromLastPlacement = !this.isAlreadyIncluded(placementCellXIntArray, placementCellYIntArray, placementCellTotal, indexX, indexY);
                        if(isFarEnoughFromLastPlacement) {
                        result = true;
                        isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, indexX, indexY,  3);
                        if(result) {
                            //stringMaker.delete(0, stringMaker.length());
                            //logUtil.put(stringMaker.append("3placement: ").append(indexX).append(CommonSeps.getInstance().SPACE).append(indexY).append(" index: ").append(placementTotal).toString(), this, commonStrings.PROCESS);

                            placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2);
                            placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2);
                            placementSizeIntArray[placementTotal] = 3;
                            placementCellXIntArray[currentY][placementCellTotal[currentY]] = indexX;
                            placementCellYIntArray[currentY][placementCellTotal[currentY]] = indexY;
                            placementCellTotal[currentY]++;
                            placementTotal++;
                            placementTotal3++;
                            placed = true;
                        }

                        if(!placed) {
                            result = true;
                            isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, indexX, indexY,  1);
                            if(result) {
                                //stringMaker.delete(0, stringMaker.length());
                                //logUtil.put(stringMaker.append("2placement: ").append(indexX).append(CommonSeps.getInstance().SPACE).append(indexY).append(" index: ").append(placementTotal).toString(), this, commonStrings.PROCESS);

                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementSizeIntArray[placementTotal] = 2;
                                placementCellXIntArray[currentY][placementCellTotal[currentY]] = indexX;
                                placementCellYIntArray[currentY][placementCellTotal[currentY]] = indexY;
                                placementCellTotal[currentY]++;
                                placementTotal++;
                                placementTotal2++;
                                placed = true;
                            }
                        }

<!--                        if(!placed) {
                            if(indexY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray.length <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray[0].length) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementXIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementSizeIntArray[placementTotal] = 1;
                                placementTotal++;
                                placementTotal1++;
                            }
                        }-->
                        }

                    } else if (basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.isType(type)) {

<!--
                        if(indexY > 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX > 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY < mapArray.length <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX < mapArray[0].length) {
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY + 1][indexX])) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY + 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY + 1][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX + 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY + 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX + 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY - 1][indexX])) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY - 1][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY - 1][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[indexY + 1][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2);
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2);
                                placementTotal++;
                            }
                        }
-->

                        stringMaker.delete(0, stringMaker.length());
                        logUtil.put(stringMaker.append("Planned Start Position c: ").append(allBinaryTiledLayer.getColumns()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexX * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexX).append(" r: ").append(allBinaryTiledLayer.getRows()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexY * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexY).toString(), this, commonStrings.PROCESS);
                                                
                        geographicMapCellPosition = geographicMapCellPositionFactory.getInstance(indexX, indexY);
                        //(SceneWindowWidth() / 2) - (Player.Width() / 2)
                        this.setStartPosition(geographicMapInterfaceArray, geographicMapCellPosition, layerIndex, stringMaker);

//                        final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
//                        final int lastWidth = displayInfoSingleton.getLastHalfWidth();
//                        final int lastHeight = displayInfoSingleton.getLastHalfHeight();
//                        if(lastWidth != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> lastHeight != 0) {
//                            this.udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this);
//                        } else {
//                            stringMaker.delete(0, stringMaker.length());
//                            logUtil.put("Display not ready to set start position", this, commonStrings.PROCESS);
//                        }

                    } else if (basicTopViewGeographicMapCellTypeFactory.STAIRS_DOWN_CELL_TYPE.isType(type)) {
                    
                        stringMaker.delete(0, stringMaker.length());
                        logUtil.put(stringMaker.append("Planned End Position c: ").append(allBinaryTiledLayer.getColumns()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexX * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexX).append(" r: ").append(allBinaryTiledLayer.getRows()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexY * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).append(indexY).toString(), this, commonStrings.PROCESS);
                                                
                        geographicMapCellPosition = geographicMapCellPositionFactory.getInstance(indexX, indexY);
                        this.setEndPosition(geographicMapInterfaceArray, geographicMapCellPosition, layerIndex, stringMaker);

                    }

                }
                currentY++;
                if(currentY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> MAX_HISTORY_Y - 1) currentY = 0;
            }
        }

        final ArrayUtil arrayUtil = ArrayUtil.getInstance();
        final MyRandomFactory randomFactory = MyRandomFactory.getInstance();

        platformerMap.placementXIntArray = arrayUtil.copyOf(placementXIntArray, placementTotal);
        platformerMap.placementYIntArray = arrayUtil.copyOf(placementYIntArray, placementTotal);
        platformerMap.placementSizeIntArray = arrayUtil.copyOf(placementSizeIntArray, placementTotal);
        platformerMap.placementIntArray = new int[placementTotal];
        final int size = platformerMap.placementIntArray.length;
        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            platformerMap.placementIntArray[index] = index;
        }

        randomFactory.shuffle(platformerMap.placementIntArray);
                
        logUtil.put("placementTotal3: " + placementTotal3, this, commonStrings.PROCESS);
        logUtil.put("placementTotal2: " + placementTotal2, this, commonStrings.PROCESS);
        logUtil.put("placementTotal1: " + placementTotal1, this, commonStrings.PROCESS);
        logUtil.put("placementTotal: " + placementTotal, this, commonStrings.PROCESS);
        globals.placementMax = placementTotal - 2;
    }

//    private int lastWidthUsed = 0;
//    private int lastHeightUsed = 0;
        
//    public void udpatePositionFromWindowSize(final int lastWidth, final int lastHeight, final StringMaker stringMaker, final Object reason) {
//    
//        stringMaker.delete(0, stringMaker.length());
//        logUtil.put(stringMaker.append("lastWidth:  ").append(lastWidth).append(CommonSeps.getInstance().COMMA).append(lastHeight).toString(), reason, commonStrings.PROCESS);
//        
//        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
//
//        final GDCustomGameLayer <xsl:value-of select="name" />GDGameLayer = (GDCustomGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
//        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) <xsl:value-of select="name" />GDGameLayer.gdObject;
//
//        final int dx = (lastWidth - lastWidthUsed);
//        final int dy = (lastHeight - lastHeightUsed);
//        
//        if(dx != 0 || dy != 0) {
//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("lastWidth:  dx/dy: ").append(dx).append(CommonSeps.getInstance().FORWARD_SLASH).append(dy).toString(), reason, commonStrings.PROCESS);
//
//            platformerMap.setX(platformerMap.x + dx);
//            platformerMap.setY(platformerMap.y + dy);
//            lastWidthUsed = lastWidth;
//            lastHeightUsed = lastHeight;
//        }
//
//        <xsl:value-of select="name" />GDGameLayer.updatePosition2();
//    }

    public void setStartPosition(final GeographicMapInterface[] geographicMapInterfaceArray, final GeographicMapCellPosition geographicMapCellPosition, final int layerIndex, final StringMaker stringMaker) {

//                            DisplayChangeEventHandler.getInstance().addListener(new DisplayChangeEventListener() {
//                                
//                                public void onEvent(final AllBinaryEventObject eventObject) {
//                                    
//                                }
//
//                                private final String ON_DISPLAY_CHANGE_EVENT = "onDisplayChangeEvent";
//                                public void onDisplayChangeEvent(final DisplayChangeEvent displayChangeEvent) {
//
//                                    final DisplayInfoSingleton gameTickDisplayInfoSingleton = DisplayInfoSingleton.getInstance();
//                                    final int lastWidth = gameTickDisplayInfoSingleton.getLastHalfWidth();
//                                    final int lastHeight = gameTickDisplayInfoSingleton.getLastHalfHeight();
//                                    //displayChangeEventHandler.removeListener(this);
//                                    //udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this);
//                                    logUtil.put(ON_DISPLAY_CHANGE_EVENT, this, commonStrings.PROCESS);
//                                }
//                            });

        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

        final GDCustomGameLayer <xsl:value-of select="name" />GDGameLayer = (GDCustomGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) <xsl:value-of select="name" />GDGameLayer.gdObject;
        //final GDObject Wall = (GDObject) ((GDGameLayer) globals.WallGDGameLayerList.get(0)).gdObject;
        //final GDGameLayer wallGDGameLayer = (GDGameLayer) globals.WallGDGameLayerList.get(0);

        final AllBinaryTiledLayer allBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer();

        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        //final GDGameLayer PlayerGDGameLayer = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);

        platformerMap.startX = -( ((geographicMapCellPosition.getColumn()) * allBinaryTiledLayer.getCellWidth()) );
        platformerMap.startY = -( ((geographicMapCellPosition.getRow()) * allBinaryTiledLayer.getCellHeight()) );
        //platformerMap.startX = platformerMap.startX + (displayInfoSingleton / 2);
        //platformerMap.startY = platformerMap.startY + (displayInfoSingleton / 2);
        platformerMap.startX = platformerMap.startX - (allBinaryTiledLayer.getCellWidth() / 2);
        platformerMap.startY = platformerMap.startY - (allBinaryTiledLayer.getCellHeight() / 2);

        platformerMap.mapWidth = allBinaryTiledLayer.getColumns() * allBinaryTiledLayer.getCellWidth();
        platformerMap.mapHeight = allBinaryTiledLayer.getRows() * allBinaryTiledLayer.getCellHeight();
        //logUtil.put("TWBw: " + platformerMap.mapWidth, this, commonStrings.PROCESS);
        //logUtil.put("TWBh: " + platformerMap.mapHeight, this, commonStrings.PROCESS);
        
<!--

        //.append(OffScreenLocationIndicator.getClass().getName())
        //logUtil.put(new StringMaker().append("TWBpx: ").append((SceneWindowWidth() / 2) + ((Enemies.X() - Player.X()) * SceneWindowWidth() / PlatformerMap.mapWidth)).append(CommonSeps.getInstance().SPACE).append(Enemies.X() - Player.X()).append(CommonSeps.getInstance().SPACE).append(SceneWindowWidth()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.mapWidth).toString(), this, commonStrings.PROCESS);
        //logUtil.put(new StringMaker().append("TWBpy: ").append((SceneWindowHeight() / 2) + ((Enemies.Y() - Player.Y()) * SceneWindowHeight() / PlatformerMap.mapHeight)).append(CommonSeps.getInstance().SPACE).append(Enemies.Y() - Player.Y()).append(CommonSeps.getInstance().SPACE).append(SceneWindowHeight()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.mapHeight).toString(), this, commonStrings.PROCESS);
        //logUtil.put(new StringMaker().append(" TWBpx: ").append((((double) SceneWindowHeight() / 2) / (Enemies.Y() - Player.Y())) * (Enemies.X() - Player.X())).append(CommonSeps.getInstance().SPACE).append(((double) SceneWindowHeight() / 2) / (Enemies.Y() - Player.Y())).append(CommonSeps.getInstance().SPACE).append(Enemies.X()).toString(), this, commonStrings.PROCESS);
        //logUtil.put(new StringMaker().append(" TWBpy: ").append((((double) SceneWindowWidth() / 2) / (Enemies.X() - Player.X())) * (Enemies.Y() - Player.Y())).append(CommonSeps.getInstance().SPACE).append(((double) SceneWindowWidth() / 2) / (Enemies.X() - Player.X())).append(CommonSeps.getInstance().SPACE).append(Enemies.Y()).toString(), this, commonStrings.PROCESS);
        //((100 *SceneWindowWidth() / 2) / (Enemies.X() - Player.X())) * (Enemies.Y() - Player.Y()) / 100
        final GDGameLayer PlayerGDGameLayer = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);
        final GDObject Player = PlayerGDGameLayer.gdObject;                                
        final GDGameLayer PlatformerMapGDGameLayer = (GDGameLayer) globals.PlatformerMapGDGameLayerList.get(0);
        final GD1GDObjectsFactory.PlatformerMap PlatformerMap = (GD1GDObjectsFactory.PlatformerMap) PlatformerMapGDGameLayer.gdObject;
        logUtil.put(new StringMaker().append("TWBpx: ").append(PlatformerMap.X() - PlatformerMap.endX - Player.X()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.endX).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.X()).append(CommonSeps.getInstance().SPACE).append(Player.X()).toString(), this, commonStrings.PROCESS);
        logUtil.put(new StringMaker().append("TWBpy: ").append(PlatformerMap.Y() - PlatformerMap.endY - Player.Y()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.endY).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.Y()).append(CommonSeps.getInstance().SPACE).append(Player.Y()).toString(), this, commonStrings.PROCESS);
-->
        
        //Temp hack for RPG game.
        final GDGeographicMap gdGeographicMap = (GDGeographicMap) geographicMapInterfaceArray[layerIndex];
        final org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory basicTopViewGeographicMapCellTypeFactory = 
            (org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory) gdGeographicMap.getGeographicMapCellTypeFactory();
        final TiledMap map = gdGeographicMap.getMap();
        final TileLayer tileLayer = ((TileLayer) map.getLayer(layerIndex));
        final int[][] mapArray = tileLayer.getMapArray();
        
        if(!basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[geographicMapCellPosition.getRow()][geographicMapCellPosition.getColumn() + 1])) {
            platformerMap.startX = platformerMap.startX + 18;
        }
        if(!basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.isType(mapArray[geographicMapCellPosition.getRow()][geographicMapCellPosition.getColumn() - 1])) {
            platformerMap.startX = platformerMap.startX - 18;
        }
        
        stringMaker.delete(0, stringMaker.length());
        logUtil.put(stringMaker.append("<xsl:value-of select="name" />: ").append(platformerMap.startX).append(CommonSeps.getInstance().SPACE).append(platformerMap.startY).toString(), this, commonStrings.PROCESS);

        platformerMap.setX(platformerMap.Variable((int) platformerMap.startX));
        platformerMap.setY(platformerMap.Variable((int) platformerMap.startY));

        <xsl:value-of select="name" />GDGameLayer.updatePosition2();
    }
        
    public void setEndPosition(final GeographicMapInterface[] geographicMapInterfaceArray, final GeographicMapCellPosition geographicMapCellPosition, final int layerIndex, final StringMaker stringMaker) {

        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();

        final GDCustomGameLayer <xsl:value-of select="name" />GDGameLayer = (GDCustomGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) <xsl:value-of select="name" />GDGameLayer.gdObject;
        //final GDObject Wall = (GDObject) ((GDGameLayer) globals.WallGDGameLayerList.get(0)).gdObject;
        //final GDGameLayer wallGDGameLayer = (GDGameLayer) globals.WallGDGameLayerList.get(0);

        final AllBinaryTiledLayer allBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer();

        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        //final GDGameLayer PlayerGDGameLayer = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);

        platformerMap.endX = -( ((geographicMapCellPosition.getColumn()) * allBinaryTiledLayer.getCellWidth()) );
        platformerMap.endY = -( ((geographicMapCellPosition.getRow()) * allBinaryTiledLayer.getCellHeight()) );
        //platformerMap.endX = platformerMap.endX + (displayInfoSingleton / 2);
        //platformerMap.endY = platformerMap.endY + (displayInfoSingleton / 2);
        platformerMap.endX = platformerMap.endX - (allBinaryTiledLayer.getCellWidth() / 2);
        platformerMap.endY = platformerMap.endY - (allBinaryTiledLayer.getCellHeight() / 2);
        platformerMap.cellWidth = allBinaryTiledLayer.getCellWidth();
        platformerMap.cellHeight = allBinaryTiledLayer.getCellHeight();
        
        stringMaker.delete(0, stringMaker.length());
        logUtil.put(stringMaker.append("PlatformerMap end: ").append(platformerMap.endX).append(CommonSeps.getInstance().SPACE).append(platformerMap.endY).toString(), this, commonStrings.PROCESS);
    }
                
    public void setPosition(final GeographicMapCompositeInterface geographicMapCompositeInterface)
    {
        final AllBinaryLayer layer = StaticTileLayerIntoPositionViewPosition.layer;
        
        if(layer != null) {
        
        final BasicGeographicMap[] geographicMapInterfaceArray = geographicMapCompositeInterface.getGeographicMapInterface();
        AllBinaryTiledLayer tiledLayer;
        
        GDGeographicMap geographicMapInterface;
        final int size = geographicMapInterfaceArray.length;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            geographicMapInterface = (GDGeographicMap) geographicMapInterfaceArray[index];
            tiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
 
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
//        logUtil.put(new StringMaker().append("camera x: ").append(centerCameraX).append("y: ").append(centerCameraY).toString(), this, commonStrings.PROCESS);
//        logUtil.put(new StringMaker().append("x: ").append(layer.getX()).append("y: ").append(layer.getY()).toString(), this, commonStrings.PROCESS);
//        logUtil.put(new StringMaker().append("tile x: ").append(tiledLayer.getX()).append("y: ").append(tiledLayer.getY()).toString(), this, commonStrings.PROCESS);
//        logUtil.put(new StringMaker().append("map x: ").append(mapX).append("y: ").append(mapY).toString(), this, commonStrings.PROCESS);
//        logUtil.put(new StringMaker().append("2 x: ").append(x2).append("y: ").append(y2).toString(), this, commonStrings.PROCESS);
            layer.setPosition(x2, y2, layer.getZP());
        }

        }
    }
                </xsl:if>
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
        
<!--    public int SceneWindowWidth() {
        return gameTickDisplayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return gameTickDisplayInfoSingleton.getLastHeight();
    }-->
    
}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
