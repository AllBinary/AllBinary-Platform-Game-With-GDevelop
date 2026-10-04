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
package org.allbinary.game.level

import java.io.ByteArrayInputStream
import java.io.InputStream

import java.util.Arrays

import javax.microedition.lcdui.Image
import javax.microedition.lcdui.game.TiledLayer

import org.allbinary.J2MEUtil
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />LayoutUtil
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals
            </xsl:if>
        </xsl:for-each>

import org.allbinary.game.canvas.GDGameGlobals
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.AllBinaryJ2METiledLayer
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.game.layer.GDCustomGameLayer
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layer.special.TempMapMovementBehavior
import org.allbinary.game.layer.special.TempNoMapMovementBehavior
import org.allbinary.game.layer.special.TempMovementBehaviorFactory
import org.allbinary.game.layout.GDObject
import org.allbinary.game.map.GDGeographicMap
import org.allbinary.game.rand.MyRandomFactory
import org.allbinary.game.gd.resource.GDResources
import org.allbinary.game.gd.resource.GDLazyResources
import org.allbinary.game.map.GDTiledLayerFactory
import org.allbinary.game.view.StaticTileLayerIntoPositionViewPosition
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.displayable.DisplayInfoSingleton
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.graphics.displayable.event.DisplayChangeEvent
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
import org.allbinary.image.ImageCache
import org.allbinary.image.ImageCacheFactory
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.layer.LayerInterfaceFactory
import org.allbinary.layer.LayerInterfaceVisitor
import org.allbinary.string.CommonSeps
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.util.event.AllBinaryEventObject

import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.system.PlatformAssetManager
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
import org.allbinary.media.graphics.geography.map.GeographicMapInterface
import org.allbinary.media.graphics.geography.map.platform.TileSetToGeographicMapUtil
import org.allbinary.util.ArrayUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.mapeditor.loader.TiledMapLoaderFromJSONFactory
import org.mapeditor.core.TileLayer
import org.mapeditor.core.TileSet
import org.mapeditor.core.TiledMap
import org.mapeditor.io.GDJSONMapReader
import org.mapeditor.io.TiledJSONUtil
import org.allbinary.util.ABHashtable

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
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
import org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor
import org.mapgenerator.TileMapGenerator
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.game.map.GDTiledLayerFactory
                </xsl:if>
                <xsl:if test="contains($tileMapGenerator, 'DungeonGenerator')" >
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
import org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor
import org.mapgenerator.dungeon.DungeonGenerator
import org.mapgenerator.dungeon.Tunneller
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.game.map.GDTiledLayerFactory
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
import org.allbinary.thread.PathFindingThreadPool
    </xsl:if>

    <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface
import org.allbinary.media.graphics.geography.map.NoGeographicMapCellPositionFactoryInitVisitor
import org.allbinary.media.graphics.geography.pathfinding.PathGenerator
//import org.allbinary.game.layer.geological.resources.GeologicalGeographicMapCellPositionFactoryInitVisitor
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorFactory
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.game.map.GDTiledLayerFactory
import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory
    </xsl:if>

open class GDGame<xsl:value-of select="$layoutName" />LevelBuilder : LayerInterfaceVisitor
{
    protected val logUtil: LogUtil = LogUtil.getInstance()

    private val commonStrings: CommonStrings = CommonStrings.getInstance()
    private val commonSeps: CommonSeps = CommonSeps.getInstance()

    private val COLORS: Array&lt;BasicColor&gt; = arrayOf(
        BasicColorFactory.getInstance().RED,
        BasicColorFactory.getInstance().GREEN,
    )

    private val gdResources: GDResources = GDResources.getInstance()
    //private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()

    private val layerManager: AllBinaryGameLayerManager

    private var generatedWidth: Int
    private var generatedHeight: Int

    <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
    //if path findingbehavior
    private val geographicMapCelPositionFactoryInitVisitorInterface: GeographicMapCellPositionFactoryInitVisitorInterface =
        NoGeographicMapCellPositionFactoryInitVisitor()
        //GeologicalGeographicMapCellPositionFactoryInitVisitor()
    </xsl:if>

    constructor(layerManager: AllBinaryGameLayerManager)

    {
        this.layerManager = layerManager

        // GPoint point = PointFactory.ZERO_ZERO
        // this.layerPlacer = ObamaStimulusLayerPlacer(this, point)

    }

        <xsl:variable name="isPlatformer" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >

    fun create<xsl:value-of select="name" />TiledMap(lastMap: TiledMap, tileSetImageHeightArray: IntArray): TiledMap {

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>

        val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()

        try {

        val platformAssetManager: PlatformAssetManager = PlatformAssetManager.getInstance()
        val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

                <xsl:variable name="stringValue" select="string" />
                //TileMap::TileMap - <xsl:value-of select="name" />

                <xsl:if test="content" >
                    //TileMap::TileMap:content - <xsl:value-of select="content/generator" />
                    <xsl:variable name="tileMapJSONWithExtension" select="content/tilemapJsonFile" />
                    <xsl:variable name="tileMapJSON" select="substring-before($tileMapJSONWithExtension, '.')" />
        var tileMapInputStream2: InputStream = null
                    <xsl:if test="content/generator = 'TileMapGenerator'" >
                    //"generator": "TileMapGenerator",
        val data: Array&lt;Byte&gt; = TileMapGenerator().process2().getBytes()
        tileMapInputStream2 = ByteArrayInputStream(data)
                    </xsl:if>
                    <xsl:if test="content/generator = 'DungeonGenerator'" >
        //"generator": "DungeonGenerator",
        if(!gameGlobals.RandomDungeon) {
            val platformerMap: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = ((globals.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />)
            val size: Int = platformerMap.placementIntArray.size
            for(index in 0 until size) {
                platformerMap.placementXIntArray[index] *= 2
                platformerMap.placementYIntArray[index] *= 2
            }

            tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>)
        } else {
            //logUtil.put("Loading Tiled Map Asset", this, commonStrings.PROCESS)
            val dungeonGenerator: DungeonGenerator = DungeonGenerator()
            val tiledJSONUtil: TiledJSONUtil = TiledJSONUtil.getInstance()
            //dungeonGenerator.setConfig(Tunneller.getConfigParameters())
            val mapData: Array&lt;IntArray&gt; = dungeonGenerator.generate()
            generatedWidth = mapData.size
            generatedHeight = mapData[0].size
            val data: Array&lt;Byte&gt; = tiledJSONUtil.generateJSONAsString(mapData, gameGlobals.tileWidth, gameGlobals.tileHeight).getBytes()
            tileMapInputStream2 = ByteArrayInputStream(data)
        }
                    </xsl:if>
                    <xsl:if test="content/generator = 'SameSizeGenerator'" >
        //"generator": "SameSizeGenerator",
        if(!gameGlobals.RandomDungeon) {
            val platformerMap: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = ((globals.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />)
            val size: Int = platformerMap.placementIntArray.size
            for(index in 0 until size) {
                platformerMap.placementXIntArray[index] *= 2
                platformerMap.placementYIntArray[index] *= 2
            }

            tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>)
        } else {
            //logUtil.put("Loading Tiled Map Asset", this, commonStrings.PROCESS)
            val tiledJSONUtil: TiledJSONUtil = TiledJSONUtil.getInstance()
            val mapData: Array&lt;IntArray&gt; = Array(generatedWidth) { IntArray(generatedHeight) }

            val tileMapPlacementVisitor: TileMapPlacementVisitor =
                //org.allbinary.game.behavior.topview.placement.AllAnimationsEverywhereTileMapPlacementVisitor()
                org.allbinary.game.behavior.topview.placement.PropsTileMapPlacementVisitor()
            tileMapPlacementVisitor.visit(lastMap, mapData)

            val data: Array&lt;Byte&gt; = tiledJSONUtil.generateJSONAsString(mapData, gameGlobals.tileWidth, gameGlobals.tileHeight).getBytes()
            tileMapInputStream2 = ByteArrayInputStream(data)
        }
                    </xsl:if>
                    <xsl:if test="not(content/generator) or string-length(content/generator) = 0" >
        tileMapInputStream2 = platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileMapJSON" /></xsl:with-param></xsl:call-template>)
                    </xsl:if>

        val tileMapInputStream: InputStream = tileMapInputStream2

        val tileSetInputStreamArray: Array&lt;InputStream&gt; = {
                    <xsl:variable name="tileSetJSONWithExtension" select="content/tilesetJsonFile" />
                    <xsl:variable name="tileSetJSON" select="substring-before($tileSetJSONWithExtension, '.')" />
                    <xsl:if test="string-length(content/tilesetJsonFile) > 1" >
            platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileSetJSON" /></xsl:with-param></xsl:call-template>),
                    </xsl:if>

                    <xsl:for-each select="content/tilesetJsonFiles" >
                       <xsl:variable name="tileSetJSON" select="substring-before(text(), '.')" />
            platformAssetManager.getResourceAsStream(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileSetJSON" /></xsl:with-param></xsl:call-template>),
                    </xsl:for-each>
                    }
                </xsl:if>

        //logUtil.put("Loaded Tiled Map Asset", this, commonStrings.PROCESS)

        //logUtil.put("Loading Tiled Map" + map, this, commonStrings.PROCESS)

        val features: Features = Features.getInstance()
        var size: Int = 0
        val sizeArray2: IntArray = IntArray(tileSetInputStreamArray.size)
        if(J2MEUtil.isHTML()) {
            //logUtil.put("tileMapInputStream.available()", this, commonStrings.PROCESS)
            size = tileMapInputStream.available()
            lateinit var tileSetInputStream: InputStream
            val size2: Int = tileSetInputStreamArray.size
            for(index in 0 until size2) {
                tileSetInputStream = tileSetInputStreamArray[index]
                //logUtil.put("tileSetInputStream: " + tileSetInputStream, this, commonStrings.PROCESS)
                if(tileSetInputStream != null) {
                    sizeArray2[index] = tileSetInputStream.available()
                }
            }
        }
        //logUtil.put("Processing Tiled Map", this, commonStrings.PROCESS)
        val map: TiledMap = TiledMapLoaderFromJSONFactory.getInstance().process(GDJSONMapReader(), tileMapInputStream, tileSetInputStreamArray, size, sizeArray2, tileSetImageHeightArray)
        if(map == null) {
            throw Exception()
        }
        map.setTileWidth(map.getTileWidth()* scale).toInt()
        map.setTileHeight(map.getTileHeight() * scale).toInt()
        map.getLayers().size()
        return map
        } catch(e: Exception) {
        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e)
        gameGlobals.RandomDungeon = false
        return this.create<xsl:value-of select="name" />TiledMap(lastMap, tileSetImageHeightArray)
        }
    }
            </xsl:if>

        </xsl:for-each>

    fun init()
    {

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>

        val layerInterfaceFactory: LayerInterfaceFactory = LayerInterfaceFactory.getInstance()

        layerInterfaceFactory.init()

        TempMovementBehaviorFactory.getInstance().movementBehavior = <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >TempMapMovementBehavior</xsl:if><xsl:if test="not(contains($hasOneOrMoreTileMaps, 'found'))" >TempNoMapMovementBehavior</xsl:if>.getInstance()

        // layerInterfaceFactory.add(RussianInfantryLayerFactory())

        val artificialIntelligenceInterfaceFactoryInterfaceFactory: ArtificialIntelligenceInterfaceFactoryInterfaceFactory =
                ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance()

        artificialIntelligenceInterfaceFactoryInterfaceFactory.clear()

        // artificialIntelligenceInterfaceFactoryInterfaceFactory.add(PacePatrolAIFactory())

        <xsl:if test="contains($hasOneOrMoreTileMaps, 'found')" >

        val MAX_TILE_ID: String = "MaxTileId: "
        val stringMaker: StringMaker = StringMaker()

        val BLACK: BasicColor = BasicColorFactory.getInstance().BLACK
        val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

        val imageCache: ImageCache = ImageCacheFactory.getInstance()
        val specialAnimationResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance()

        val geographicMapList: BasicArrayList = BasicArrayListD()

        var map: TiledMap = null

        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
        if(true) {
                //TileMap::TileMap - <xsl:value-of select="name" />

        //logUtil.put("Loading Tiled Map Asset: <xsl:value-of select="name" />", this, commonStrings.PROCESS)

        val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

        <xsl:variable name="imageWithExtension" select="content/tilemapAtlasImage" />
        <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
        val resourceIndex: Int = imageCache.getIndex(gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>)
        val tileSetImageHeightArray: Array&lt;Int&gt; = intArrayOf( GDLazyResources.getInstance().imageResourceHeightArray[resourceIndex] )

        var tileSetImage: Image = null
        if(<xsl:value-of select="name" />ImageArray != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> <xsl:value-of select="name" />ImageArray.size <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            tileSetImage = <xsl:value-of select="name" />ImageArray[0]
        }

        map = this.create<xsl:value-of select="name" />TiledMap(map, tileSetImageHeightArray)

        //logUtil.put("Loaded Tiled Map", this, commonStrings.PROCESS)

        //logUtil.put(StringMaker().append(map.getWidth()).append(commonSeps.COLON).append(map.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS)

        //logUtil.put(StringMaker().append(tileSetImage.getWidth()).append(commonSeps.COLON).append(tileSetImage.getHeight()).append(commonSeps.COLON).append(map.getTileWidth()).append(commonSeps.COLON).append(map.getTileHeight()).toString(), this, commonStrings.PROCESS)

        <xsl:for-each select=".." >
            <xsl:call-template name="globalZoomCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="globalCentreCameraActions" >
                <xsl:with-param name="tileMap" >true</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        //logUtil.put(StringMaker().append("numStaticTiles: ").append((tileSetImage.getWidth() / map.getTileWidth()) * (tileSetImage.getHeight() / map.getTileHeight())).toString(), this, commonStrings.PROCESS)
        //logUtil.put(StringMaker().append("tileset w/h: ").append(tileSetImage.getWidth()).append(',').append(tileSetImage.getHeight()).toString(), this, commonStrings.PROCESS)
        //final String string2 = StringMaker().append("w: ").append(map.getWidth()).append(" h: ").append(map.getHeight()).append("tw: ").append(map.getTileWidth()).append(" th: ").append(map.getTileHeight()).toString()
        //logUtil.put(string2, this, commonStrings.PROCESS)
        //final String string = StringMaker().append("w: ").append(map.getWidth() * tileMapScale)).append(" h: ").append((int) (map.getHeight() * tileMapScale)).append("tw: ").append((int) (map.getTileWidth() * tileMapScale)).append(" th: ").append((int) (map.getTileHeight() * tileMapScale)).toString(.toInt()
        //logUtil.put(string, this, commonStrings.PROCESS)

        stringMaker.delete(0, stringMaker.length())

        val size3: Int = map.getLayers().size()
        for(layerIndex in 0 until size3) {
            val tileSet: TileSet = map.getTileSets().get(0) as TileSet
            val tileTypeToTileIdsMap: ABHashtable = TileSetToGeographicMapUtil.getInstance().convert(tileSet)

            val maxTileId: Int = tileSet.getMaxTileId() + 1

            val geographicMapCellTypeFactory: GeographicMapCellTypeFactory =
            <xsl:if test="contains($isPlatformer, 'found')" >
            org.allbinary.media.graphics.geography.map.platform.BasicPlatormGeographicMapCellTypeFactory(tileTypeToTileIdsMap, maxTileId)
            </xsl:if>
            <xsl:if test="not(contains($isPlatformer, 'found'))" >
            org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory(tileTypeToTileIdsMap, maxTileId)
            </xsl:if>

            stringMaker.delete(0, stringMaker.length())
            logUtil.putF(stringMaker.append(MAX_TILE_ID).appendint(maxTileId).toString(), this, commonStrings.PROCESS)
            val cellTypeMapping: Array&lt;Int&gt; = IntArray(maxTileId)
            for(index in 0 until maxTileId) {
                cellTypeMapping[index] = index
            }

            val tileLayer: TileLayer = (map.getLayer(layerIndex) as TileLayer)
            val color: BasicColor = COLORS[geographicMapList.size()]

            val allBinaryTwodThreedTiledLayerFactory: AllBinaryTiledLayerFactoryInterface = GDTiledLayerFactory()

            geographicMapList.add(GDGeographicMap(allBinaryTwodThreedTiledLayerFactory, tileLayer, cellTypeMapping, map, tileSetImage, geographicMapCellTypeFactory, BLACK, BLACK, color,
                <xsl:if test="contains($foundPathFindingBehavior, 'found')" >CustomMapGeneratorFactory()</xsl:if><xsl:if test="not(contains($foundPathFindingBehavior, 'found'))" >CustomMapGeneratorBaseFactory()</xsl:if>))
        }

        }
            </xsl:if>

        </xsl:for-each>

        val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapList.toArrayType as Array&lt;BasicGeographicMap&gt;(arrayOfNulls&lt;BasicGeographicMap&gt;(geographicMapList.size()))

                <xsl:value-of select="$tileMapGenerator" />
                <xsl:if test="contains($tileMapGenerator, 'TileMapGenerator')" >

                </xsl:if>
                <xsl:if test="contains($tileMapGenerator, 'DungeonGenerator')" >
        val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
        if(gameGlobals.RandomDungeon) {
            this.setStartPoint(geographicMapInterfaceArray)
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

        val geographicMapCompositeInterface: GeographicMapCompositeInterface =
            this.layerManager as GeographicMapCompositeInterface

        //System.out.println("TWB set map")
        geographicMapCompositeInterface.setGeographicMapInterface(geographicMapInterfaceArray)

        </xsl:if>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
        //if path findingbehavior
        val geographicMap: BasicGeographicMap =
            geographicMapCompositeInterface.getGeographicMapInterface()[0]

        //Reset resources
        geographicMap.getGeographicMapCellPositionFactory().visit(
            geographicMapCelPositionFactoryInitVisitorInterface
           )

        PathGenerator.getInstance().init(geographicMap, 2)

        PathFindingInfoFactory.initMax(32768) //This should be the max map height x width for all maps in a game and/or max vertices in a path
        </xsl:if>

        <xsl:if test="contains($hasPathFindingBehaviorInOtherLayouts, 'found')" >
        PathFindingThreadPool.getInstance().clear()
        </xsl:if>


    }

        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'TileMap::TileMap'" >
                <xsl:if test="name = 'PlatformerMap'" >

    fun isAlreadyIncluded(placementCellXIntArray: Array&lt;IntArray&gt;, placementCellYIntArray: Array&lt;IntArray&gt;, placementCellTotal: IntArray, indexX: Int, indexY: Int): Boolean {

        for(index in 0 until 4) {
            val size: Int = placementCellTotal[index]
            for(index2 in 0 until size) {
                if(placementCellXIntArray[index][index2] + 4 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                placementCellYIntArray[index][index2] + 4 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> indexY) {
                    return true
                }
            }
        }

        return false
    }

    private val ADJACENT: Array&lt;IntArray&gt; = arrayOf(
        intArrayOf(0, -1),
        intArrayOf(0, 1),
        intArrayOf(1, -1),
        intArrayOf(1, 0),
        intArrayOf(1, 1),
        intArrayOf(-1, -1),
        intArrayOf(-1, 0),
        intArrayOf(-1, 1)
    )

    var result: Boolean = true
    fun isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory: org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory,
        mapArray: Array&lt;IntArray&gt;, propsMapArray: Array&lt;IntArray&gt;, indexX: Int, indexY: Int, recursionIndex: Int) {

        if(indexY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray.size <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray[0].size) {
            val size: Int = this.ADJACENT.size
            for(index in 0 until size) {
                val adjacentIndexX: Int = indexX + ADJACENT[index][1]
                val adjacentIndexY: Int = indexY + ADJACENT[index][0]

                if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[adjacentIndexY][adjacentIndexX]) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                    propsMapArray[adjacentIndexY][adjacentIndexX] != 49) {
                    if (recursionIndex <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                        this.isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, adjacentIndexX, adjacentIndexY, recursionIndex - 1)
                    }
                } else {
                    result = false
                }
            }
        } else {
            result = false
        }

    }

    fun setStartPoint(geographicMapInterfaceArray: Array&lt;GeographicMapInterface&gt;) {

    <xsl:call-template name="scale" >
        <xsl:with-param name="layoutIndex" >
            <xsl:value-of select="$layoutIndex" />
        </xsl:with-param>
        <xsl:with-param name="layoutName" >
            <xsl:value-of select="$layoutName" />
        </xsl:with-param>
    </xsl:call-template>

        val stringMaker: StringMaker = StringMaker()
        //final String F = "Finding Start Position: "

        //logUtil.put("Find Start Position", this, commonStrings.PROCESS)

        val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
        val platformerMap: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = ((globals.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />)
        var placementTotal: Int = 0
        var placementTotal1: Int = 0
        var placementTotal2: Int = 0
        var placementTotal3: Int = 0
        var placementMax: Int = 0

        if(true) {
        val layerIndex: Int = 0
        //for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //logUtil.put("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS)
            val gdGeographicMap: GDGeographicMap = geographicMapInterfaceArray[layerIndex] as GDGeographicMap
            val map: TiledMap = gdGeographicMap.getMap()
            val tileLayer: TileLayer = (map.getLayer(layerIndex) as TileLayer)
            val mapArray: Array&lt;IntArray&gt; = tileLayer.getMapArray()
            val size: Int = mapArray.size * mapArray[0].size
            if(size <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> placementMax) {
                placementMax = size
            }
        }
        val placementXIntArray: Array&lt;Int&gt; = IntArray(placementMax)
        val placementYIntArray: Array&lt;Int&gt; = IntArray(placementMax)
        val placementSizeIntArray: Array&lt;Int&gt; = IntArray(placementMax)

        var placed: Boolean = false

        lateinit var allBinaryTiledLayer: AllBinaryTiledLayer
        lateinit var basicTopViewGeographicMapCellTypeFactory: org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory
        lateinit var geographicMapCellPositionFactory: BasicGeographicMapCellPositionFactory
        lateinit var geographicMapCellPosition: GeographicMapCellPosition

        var currentY: Int = 0
        val MAX_HISTORY_Y: Int = 4

        if(true) {
        val layerIndex: Int = 0
        val propsLayerIndex: Int = 1
        //for (int layerIndex = 0; layerIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; layerIndex++) {
            //logUtil.put("Find Start Position on map layer: " + layerIndex, this, commonStrings.PROCESS)

            val gdGeographicMap: GDGeographicMap = geographicMapInterfaceArray[layerIndex] as GDGeographicMap
            val map: TiledMap = gdGeographicMap.getMap()
            val tileLayer: TileLayer = (map.getLayer(layerIndex) as TileLayer)
            val mapArray: Array&lt;IntArray&gt; = tileLayer.getMapArray()

            val propsGDGeographicMap: GDGeographicMap = geographicMapInterfaceArray[propsLayerIndex] as GDGeographicMap
            val propsMap: TiledMap = propsGDGeographicMap.getMap()
            val propsTileLayer: TileLayer = (propsMap.getLayer(0) as TileLayer)
            val propsMapArray: Array&lt;IntArray&gt; = propsTileLayer.getMapArray()

            basicTopViewGeographicMapCellTypeFactory = gdGeographicMap.getGeographicMapCellTypeFactory() as org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory
            allBinaryTiledLayer = gdGeographicMap.getAllBinaryTiledLayer()
            geographicMapCellPositionFactory = gdGeographicMap.getGeographicMapCellPositionFactory()

            val size4: Int = mapArray.size
            val size2: Int = mapArray[0].size

            val placementCellXIntArray: Array&lt;IntArray&gt; = Array(MAX_HISTORY_Y) { IntArray(size2) }
            val placementCellYIntArray: Array&lt;IntArray&gt; = Array(MAX_HISTORY_Y) { IntArray(size2) }
            val placementCellTotal: IntArray = IntArray(MAX_HISTORY_Y)

            var type: Int = 0
            for(indexY in 0 until size4) {
                placementCellTotal[currentY] = 0
                for(indexX in 0 until size2) {

                    type = mapArray[indexY][indexX]

//                    if (basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE.hasType(type) || basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(type)) {
//                    } else {
//                        stringMaker.delete(0, stringMaker.length())
//                        logUtil.putF(stringMaker.append("type: ").append(type).toString(), this, commonStrings.PROCESS)
//                    }

                    //stringMaker.delete(0, stringMaker.length())
                    //logUtil.putF(stringMaker.append(F).append(indexY).append(CommonSeps.getInstance().SPACE).append(indexX).toString(), this, commonStrings.PROCESS)
                    //logUtil.putF(basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.toString(), this, commonStrings.PROCESS)

                    if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(type)) {
                        //Exclude placement next to something that is not a floor tile
                        placed = false

                        val isFarEnoughFromLastPlacement: Boolean = !this.isAlreadyIncluded(placementCellXIntArray, placementCellYIntArray, placementCellTotal, indexX, indexY)
                        if(isFarEnoughFromLastPlacement) {
                        result = true
                        isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, indexX, indexY,  3)
                        if(result) {
                            //stringMaker.delete(0, stringMaker.length())
                            //logUtil.putF(stringMaker.append("3placement: ").append(indexX).append(CommonSeps.getInstance().SPACE).append(indexY).append(" index: ").append(placementTotal).toString(), this, commonStrings.PROCESS)

                            placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2)
                            placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2)
                            placementSizeIntArray[placementTotal] = 3
                            placementCellXIntArray[currentY][placementCellTotal[currentY]] = indexX
                            placementCellYIntArray[currentY][placementCellTotal[currentY]] = indexY
                            placementCellTotal[currentY]++
                            placementTotal++
                            placementTotal3++
                            placed = true
                        }

                        if(!placed) {
                            result = true
                            isGoodForPlacement(basicTopViewGeographicMapCellTypeFactory, mapArray, propsMapArray, indexX, indexY,  1)
                            if(result) {
                                //stringMaker.delete(0, stringMaker.length())
                                //logUtil.putF(stringMaker.append("2placement: ").append(indexX).append(CommonSeps.getInstance().SPACE).append(indexY).append(" index: ").append(placementTotal).toString(), this, commonStrings.PROCESS)

                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementSizeIntArray[placementTotal] = 2
                                placementCellXIntArray[currentY][placementCellTotal[currentY]] = indexX
                                placementCellYIntArray[currentY][placementCellTotal[currentY]] = indexY
                                placementCellTotal[currentY]++
                                placementTotal++
                                placementTotal2++
                                placed = true
                            }
                        }

<!--                        if(!placed) {
                            if(indexY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray.size <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> mapArray[0].size) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementXIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementSizeIntArray[placementTotal] = 1
                                placementTotal++
                                placementTotal1++
                            }
                        }-->
                        }

                    } else if (basicTopViewGeographicMapCellTypeFactory.STAIRS_UP_CELL_TYPE.hasType(type)) {

<!--
                        if(indexY > 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX > 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexY < mapArray.size <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> indexX < mapArray[0].size) {
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY + 1][indexX])) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY + 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY + 1][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX + 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY + 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX + 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY - 1][indexX])) {
                                placementXIntArray[placementTotal] = ((indexX) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY - 1][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY - 1][indexX + 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                            if (basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[indexY + 1][indexX - 1])) {
                                placementXIntArray[placementTotal] = ((indexX - 1) * map.getTileWidth()) + (map.getTileWidth() / 2)
                                placementYIntArray[placementTotal] = ((indexY - 1) * map.getTileHeight()) + (map.getTileHeight() / 2)
                                placementTotal++
                            }
                        }
-->

                        stringMaker.delete(0, stringMaker.length())
                        logUtil.putF(stringMaker.append("Planned Start Position c: ").appendint(allBinaryTiledLayer.getColumns()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexX * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexX).append(" r: ").appendint(allBinaryTiledLayer.getRows()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexY * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexY).toString(), this, commonStrings.PROCESS)

                        geographicMapCellPosition = geographicMapCellPositionFactory.getAt(indexX, indexY)
                        //(SceneWindowWidth() / 2) - (Player.Width() / 2)
                        this.setStartPosition(geographicMapInterfaceArray, geographicMapCellPosition, layerIndex, stringMaker)

//                        final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance()
//                        final int lastWidth = displayInfoSingleton.getLastHalfWidth()
//                        final int lastHeight = displayInfoSingleton.getLastHalfHeight()
//                        if(lastWidth != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> lastHeight != 0) {
//                            this.udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this)
//                        } else {
//                            stringMaker.delete(0, stringMaker.length())
//                            logUtil.put("Display not ready to set start position", this, commonStrings.PROCESS)
//                        }

                    } else if (basicTopViewGeographicMapCellTypeFactory.STAIRS_DOWN_CELL_TYPE.hasType(type)) {

                        stringMaker.delete(0, stringMaker.length())
                        logUtil.putF(stringMaker.append("Planned End Position c: ").appendint(allBinaryTiledLayer.getColumns()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexX * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexX).append(" r: ").appendint(allBinaryTiledLayer.getRows()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexY * allBinaryTiledLayer.getCellWidth()).append(CommonSeps.getInstance().FORWARD_SLASH).appendint(indexY).toString(), this, commonStrings.PROCESS)

                        geographicMapCellPosition = geographicMapCellPositionFactory.getAt(indexX, indexY)
                        this.setEndPosition(geographicMapInterfaceArray, geographicMapCellPosition, layerIndex, stringMaker)

                    }

                }
                currentY++
                if(currentY <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> MAX_HISTORY_Y - 1) currentY = 0
            }
        }

        val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
        val randomFactory: MyRandomFactory = MyRandomFactory.getInstance()

        platformerMap.placementXIntArray = arrayUtil.copyOfint(placementXIntArray, placementTotal)
        platformerMap.placementYIntArray = arrayUtil.copyOfint(placementYIntArray, placementTotal)
        platformerMap.placementSizeIntArray = arrayUtil.copyOfint(placementSizeIntArray, placementTotal)
        platformerMap.placementIntArray = IntArray(placementTotal)
        val size: Int = platformerMap.placementIntArray.size
        for(index in 0 until size) {
            platformerMap.placementIntArray[index] = index
        }

        randomFactory.shuffle(platformerMap.placementIntArray)

        logUtil.putF("placementTotal3: " + placementTotal3, this, commonStrings.PROCESS)
        logUtil.putF("placementTotal2: " + placementTotal2, this, commonStrings.PROCESS)
        logUtil.putF("placementTotal1: " + placementTotal1, this, commonStrings.PROCESS)
        logUtil.putF("placementTotal: " + placementTotal, this, commonStrings.PROCESS)
        globals.placementMax = placementTotal - 2
    }

//    private int lastWidthUsed = 0
//    private int lastHeightUsed = 0

//    public void udpatePositionFromWindowSize(lastWidth: Int, lastHeight: Int, stringMaker: StringMaker, reason: Object) {
//
//        stringMaker.delete(0, stringMaker.length())
//        logUtil.putF(stringMaker.append("lastWidth:  ").append(lastWidth).append(CommonSeps.getInstance().COMMA).append(lastHeight).toString(), reason, commonStrings.PROCESS)
//
//        final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
//
//        final GDCustomGameLayer <xsl:value-of select="name" />GDGameLayer = globals as GDCustomGameLayer.<xsl:value-of select="name" />GDGameLayerList.get(0)
//        final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> platformerMap = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) <xsl:value-of select="name" />GDGameLayer.gdObject
//
//        final int dx = (lastWidth - lastWidthUsed)
//        final int dy = (lastHeight - lastHeightUsed)
//
//        if(dx != 0 || dy != 0) {
//            stringMaker.delete(0, stringMaker.length())
//            logUtil.putF(stringMaker.append("lastWidth:  dx/dy: ").append(dx).append(CommonSeps.getInstance().FORWARD_SLASH).append(dy).toString(), reason, commonStrings.PROCESS)
//
//            platformerMap.setX(platformerMap.x + dx)
//            platformerMap.setY(platformerMap.y + dy)
//            lastWidthUsed = lastWidth
//            lastHeightUsed = lastHeight
//        }
//
//        <xsl:value-of select="name" />GDGameLayer.updatePosition2()
//    }

    fun setStartPosition(geographicMapInterfaceArray: Array&lt;GeographicMapInterface&gt;, geographicMapCellPosition: GeographicMapCellPosition, layerIndex: Int, stringMaker: StringMaker) {

//                            DisplayChangeEventHandler.getInstance().addListener(DisplayChangeEventListener() {
//
//                                public void onEvent(eventObject: AllBinaryEventObject) {
//
//                                }
//
//                                private final String ON_DISPLAY_CHANGE_EVENT = "onDisplayChangeEvent"
//                                public void onDisplayChangeEvent(displayChangeEvent: DisplayChangeEvent) {
//
//                                    final DisplayInfoSingleton gameTickDisplayInfoSingleton = DisplayInfoSingleton.getInstance()
//                                    final int lastWidth = gameTickDisplayInfoSingleton.getLastHalfWidth()
//                                    final int lastHeight = gameTickDisplayInfoSingleton.getLastHalfHeight()
//                                    //displayChangeEventHandler.removeListener(this)
//                                    //udpatePositionFromWindowSize(lastWidth, lastHeight, stringMaker, this)
//                                    logUtil.put(ON_DISPLAY_CHANGE_EVENT, this, commonStrings.PROCESS)
//                                }
//                            })

        val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

        val <xsl:value-of select="name" />GDGameLayer: GDCustomGameLayer = globals.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDCustomGameLayer
        val platformerMap: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />
        //final GDObject Wall = (GDObject) (globals.WallGDGameLayerList.get(0) as GDGameLayer).gdObject
        //final GDGameLayer wallGDGameLayer = globals.WallGDGameLayerList.get(0) as GDGameLayer

        val allBinaryTiledLayer: AllBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer()

        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance()
        //final GDGameLayer PlayerGDGameLayer = gameGlobals.PlayerGDGameLayerList.get(0) as GDGameLayer

        platformerMap.startX = -( ((geographicMapCellPosition.getColumn()) * allBinaryTiledLayer.getCellWidth()) )
        platformerMap.startY = -( ((geographicMapCellPosition.getRow()) * allBinaryTiledLayer.getCellHeight()) )
        //platformerMap.startX = platformerMap.startX + (displayInfoSingleton / 2)
        //platformerMap.startY = platformerMap.startY + (displayInfoSingleton / 2)
        platformerMap.startX = platformerMap.startX - (allBinaryTiledLayer.getCellWidth() / 2)
        platformerMap.startY = platformerMap.startY - (allBinaryTiledLayer.getCellHeight() / 2)

        platformerMap.mapWidth = allBinaryTiledLayer.getColumns() * allBinaryTiledLayer.getCellWidth()
        platformerMap.mapHeight = allBinaryTiledLayer.getRows() * allBinaryTiledLayer.getCellHeight()
        //logUtil.put("TWBw: " + platformerMap.mapWidth, this, commonStrings.PROCESS)
        //logUtil.put("TWBh: " + platformerMap.mapHeight, this, commonStrings.PROCESS)

<!--

        //.append(OffScreenLocationIndicator.getClass().getName())
        //logUtil.put(StringMaker().append("TWBpx: ").append((SceneWindowWidth() / 2) + ((Enemies.X() - Player.X()) * SceneWindowWidth() / PlatformerMap.mapWidth)).append(CommonSeps.getInstance().SPACE).append(Enemies.X() - Player.X()).append(CommonSeps.getInstance().SPACE).append(SceneWindowWidth()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.mapWidth).toString(), this, commonStrings.PROCESS)
        //logUtil.put(StringMaker().append("TWBpy: ").append((SceneWindowHeight() / 2) + ((Enemies.Y() - Player.Y()) * SceneWindowHeight() / PlatformerMap.mapHeight)).append(CommonSeps.getInstance().SPACE).append(Enemies.Y() - Player.Y()).append(CommonSeps.getInstance().SPACE).append(SceneWindowHeight()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.mapHeight).toString(), this, commonStrings.PROCESS)
        //logUtil.put(StringMaker().append(" TWBpx: ").append(((SceneWindowHeight.toDouble()() / 2) / (Enemies.Y() - Player.Y())) * (Enemies.X() - Player.X())).append(CommonSeps.getInstance().SPACE).append((SceneWindowHeight.toDouble()() / 2) / (Enemies.Y() - Player.Y())).append(CommonSeps.getInstance().SPACE).append(Enemies.X()).toString(), this, commonStrings.PROCESS)
        //logUtil.put(StringMaker().append(" TWBpy: ").append(((SceneWindowWidth.toDouble()() / 2) / (Enemies.X() - Player.X())) * (Enemies.Y() - Player.Y())).append(CommonSeps.getInstance().SPACE).append((SceneWindowWidth.toDouble()() / 2) / (Enemies.X() - Player.X())).append(CommonSeps.getInstance().SPACE).append(Enemies.Y()).toString(), this, commonStrings.PROCESS)
        //((100 *SceneWindowWidth() / 2) / (Enemies.X() - Player.X())) * (Enemies.Y() - Player.Y()) / 100
        val PlayerGDGameLayer: GDGameLayer = gameGlobals.PlayerGDGameLayerList.get(0) as GDGameLayer
        val Player: GDObject = PlayerGDGameLayer.gdObject
        val PlatformerMapGDGameLayer: GDGameLayer = globals.PlatformerMapGDGameLayerList.get(0) as GDGameLayer
        val PlatformerMap: GD1GDObjectsFactory.PlatformerMap = PlatformerMapGDGameLayer.gdObject as GD1GDObjectsFactory.PlatformerMap
        logUtil.put(StringMaker().append("TWBpx: ").append(PlatformerMap.X() - PlatformerMap.endX - Player.X()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.endX).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.X()).append(CommonSeps.getInstance().SPACE).append(Player.X()).toString(), this, commonStrings.PROCESS)
        logUtil.put(StringMaker().append("TWBpy: ").append(PlatformerMap.Y() - PlatformerMap.endY - Player.Y()).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.endY).append(CommonSeps.getInstance().SPACE).append(PlatformerMap.Y()).append(CommonSeps.getInstance().SPACE).append(Player.Y()).toString(), this, commonStrings.PROCESS)
-->

        //Temp hack for RPG game.
        val gdGeographicMap: GDGeographicMap = geographicMapInterfaceArray[layerIndex] as GDGeographicMap
        val basicTopViewGeographicMapCellTypeFactory: org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory =
            gdGeographicMap.getGeographicMapCellTypeFactory() as org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory
        val map: TiledMap = gdGeographicMap.getMap()
        val tileLayer: TileLayer = (map.getLayer(layerIndex) as TileLayer)
        val mapArray: Array&lt;IntArray&gt; = tileLayer.getMapArray()

        if(!basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[geographicMapCellPosition.getRow()][geographicMapCellPosition.getColumn() + 1])) {
            platformerMap.startX = platformerMap.startX + 18
        }
        if(!basicTopViewGeographicMapCellTypeFactory.FLOOR_CELL_TYPE.hasType(mapArray[geographicMapCellPosition.getRow()][geographicMapCellPosition.getColumn() - 1])) {
            platformerMap.startX = platformerMap.startX - 18
        }

        stringMaker.delete(0, stringMaker.length())
        logUtil.putF(stringMaker.append("<xsl:value-of select="name" />: ").appendint(platformerMap.startX).append(CommonSeps.getInstance().SPACE).appendint(platformerMap.startY).toString(), this, commonStrings.PROCESS)

        platformerMap.setX(platformerMap.Variable(platformerMap.startX.toInt()))
        platformerMap.setY(platformerMap.Variable(platformerMap.startY.toInt()))

        <xsl:value-of select="name" />GDGameLayer.updatePosition2()
    }

    fun setEndPosition(geographicMapInterfaceArray: Array&lt;GeographicMapInterface&gt;, geographicMapCellPosition: GeographicMapCellPosition, layerIndex: Int, stringMaker: StringMaker) {

        val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

        val <xsl:value-of select="name" />GDGameLayer: GDCustomGameLayer = globals.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDCustomGameLayer
        val platformerMap: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />
        //final GDObject Wall = (GDObject) (globals.WallGDGameLayerList.get(0) as GDGameLayer).gdObject
        //final GDGameLayer wallGDGameLayer = globals.WallGDGameLayerList.get(0) as GDGameLayer

        val allBinaryTiledLayer: AllBinaryTiledLayer = geographicMapInterfaceArray[layerIndex].getAllBinaryTiledLayer()

        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance()
        //final GDGameLayer PlayerGDGameLayer = gameGlobals.PlayerGDGameLayerList.get(0) as GDGameLayer

        platformerMap.endX = -( ((geographicMapCellPosition.getColumn()) * allBinaryTiledLayer.getCellWidth()) )
        platformerMap.endY = -( ((geographicMapCellPosition.getRow()) * allBinaryTiledLayer.getCellHeight()) )
        //platformerMap.endX = platformerMap.endX + (displayInfoSingleton / 2)
        //platformerMap.endY = platformerMap.endY + (displayInfoSingleton / 2)
        platformerMap.endX = platformerMap.endX - (allBinaryTiledLayer.getCellWidth() / 2)
        platformerMap.endY = platformerMap.endY - (allBinaryTiledLayer.getCellHeight() / 2)
        platformerMap.cellWidth = allBinaryTiledLayer.getCellWidth()
        platformerMap.cellHeight = allBinaryTiledLayer.getCellHeight()

        stringMaker.delete(0, stringMaker.length())
        logUtil.putF(stringMaker.append("PlatformerMap end: ").appendint(platformerMap.endX).append(CommonSeps.getInstance().SPACE).appendint(platformerMap.endY).toString(), this, commonStrings.PROCESS)
    }

    fun setPosition(geographicMapCompositeInterface: GeographicMapCompositeInterface)
    {
        val layer: AllBinaryLayer = StaticTileLayerIntoPositionViewPosition.layer

        if(layer != null) {

        val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()
        lateinit var tiledLayer: AllBinaryTiledLayer

        lateinit var geographicMapInterface: GDGeographicMap
        val size: Int = geographicMapInterfaceArray.size
        for(index in 0 until size) {
            geographicMapInterface = geographicMapInterfaceArray[index] as GDGeographicMap
            tiledLayer = geographicMapInterface.getAllBinaryTiledLayer()

            //final int centerCameraX = SceneWindowWidth() / 2.toInt()
            //final int centerCameraY = SceneWindowHeight() / 2.toInt()
            //final int x2 = centerCameraX - layer.getHalfWidth() - tiledLayer.getX()
            //final int y2 = centerCameraY - layer.getHalfHeight() - tiledLayer.getY()
            //final int x2 = layer.getX() - tiledLayer.getX()
            //final int y2 = layer.getY() - tiledLayer.getY()
            val mapX: Int = ((tiledLayer.getRows() * tiledLayer.getCellHeight()) / 2)
            val mapY: Int = ((tiledLayer.getColumns() * tiledLayer.getCellWidth()) / 2)
            //final int x2 = mapX + tiledLayer.getX()
            //final int y2 = mapY + tiledLayer.getY()

            val x2: Int = mapX - layer.getHalfWidth() - 78
            val y2: Int = mapY + layer.getHeight() + layer.getHalfHeight()

//        final CommonStrings commonStrings = CommonStrings.getInstance()
//        logUtil.put(StringMaker().append("camera x: ").append(centerCameraX).append("y: ").append(centerCameraY).toString(), this, commonStrings.PROCESS)
//        logUtil.put(StringMaker().append("x: ").append(layer.getX()).append("y: ").append(layer.getY()).toString(), this, commonStrings.PROCESS)
//        logUtil.put(StringMaker().append("tile x: ").append(tiledLayer.getX()).append("y: ").append(tiledLayer.getY()).toString(), this, commonStrings.PROCESS)
//        logUtil.put(StringMaker().append("map x: ").append(mapX).append("y: ").append(mapY).toString(), this, commonStrings.PROCESS)
//        logUtil.put(StringMaker().append("2 x: ").append(x2).append("y: ").append(y2).toString(), this, commonStrings.PROCESS)
            layer.setPosition(x2, y2, layer.getZP())
        }

        }
    }
                </xsl:if>
            </xsl:if>
        </xsl:for-each>

    //private BasicGameResources[] playerResourceArray = arrayOfNulls&lt;BasicGameResources&gt;(1)
    //private ABHashtable hashtable = ABHashtable()
    //private ArtificialIntelligenceInterfaceFactoryInterface artificialIntelligenceInterfaceFactoryInterface =
      //  BoundBounceAIFactory()

    fun build()
    {
        this.init()
    }

    fun visit(layerInterface: AllBinaryLayer)
    {
        layerInterface.setVisible(true)
        this.layerManager.append(layerInterface)
    }

<!--    fun SceneWindowWidth(): Int {
        return gameTickDisplayInfoSingleton.getLastWidth()
    }

    fun SceneWindowHeight(): Int {
        return gameTickDisplayInfoSingleton.getLastHeight()
    }-->

}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
