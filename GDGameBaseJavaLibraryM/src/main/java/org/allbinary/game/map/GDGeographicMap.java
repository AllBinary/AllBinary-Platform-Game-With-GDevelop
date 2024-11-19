/*
 *Copyright (c) 2006 All Binary
 *All Rights Reserved.
 *Don't Duplicate or Distributed.
 *Trade Secret Information
 *For Internal Use Only
 *Confidential
 *Unpublished
 *
 *Created By: Travis Berthelot
 *Date: August 6, 2006
 *
 *
 *Modified By         When       ?
 *
 */
package org.allbinary.game.map;

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.TiledLayer;

import org.allbinary.game.layer.AllBinaryJ2METiledLayer;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.PlacementAllBinaryJ2METiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackFrictionProperties;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.util.BasicArrayList;
import org.mapeditor.core.Animation;
import org.mapeditor.core.Frame;
import org.mapeditor.core.Tile;
import org.mapeditor.core.TileLayer;
import org.mapeditor.core.TileSet;
import org.mapeditor.core.TiledMap;

public class GDGeographicMap extends RaceTrackGeographicMap {

    protected final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final TiledMap map;
    
    private final int[] animationTileIndexArray;
    private final long[] startTimeFrameArray;
    private final int[] currentFrameArray;
    private final Animation[] animationArray;
    
    public GDGeographicMap(final TileLayer tileLayer, final int[] cellTypeIdToGeographicMapCellType, final TiledMap map, final Image tileSetImage, final GeographicMapCellTypeFactory geographicMapCellTypeFactory, final BasicColor foregroundColor, final BasicColor backgroundColor, final BasicColor debugColor, final CustomMapGeneratorBaseFactory customMapGeneratorBaseFactory) throws Exception {
        super(
            new RaceTrackInfo(
                SmallIntegerSingletonFactory.getInstance().getInstance(tileLayer.getId()),
                SmallIntegerSingletonFactory.getInstance().getInstance(tileLayer.getId()).toString(), 
                new RaceTrackFrictionProperties(0, 0), foregroundColor, backgroundColor, 0, 0, 0),
                new RaceTrackData(SmallIntegerSingletonFactory.getInstance().getInstance(0), map.getTileWidth(), map.getTileHeight(), map.getTileWidth() / 4, map.getTileHeight() / 4, cellTypeIdToGeographicMapCellType, tileLayer.getMapArray()),
                //cellTypeIdToGeographicMapCellType,
                //AllBinaryTiledLayerFactory
                new AllBinaryTiledLayerFactoryInterface() {
                    
                    private AllBinaryTiledLayer useAsMiniAllBinaryTiledLayer;
                    public AllBinaryTiledLayer getInstance(final RaceTrackInfo raceTrackInfo, final RaceTrackData raceTrackData) 
                        throws Exception {
                        
                        useAsMiniAllBinaryTiledLayer =  new PlacementAllBinaryJ2METiledLayer(
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
                    
                    public AllBinaryTiledLayer getMiniInstance(final RaceTrackData raceTrackData) throws Exception
                    {
                        return useAsMiniAllBinaryTiledLayer;
                    }
                                
                },
                new SimpleGeographicMapCellPositionFactory(),
                new GeographicMapCellPositionBaseFactory(),
                geographicMapCellTypeFactory,
                customMapGeneratorBaseFactory);
        
        this.map = map;

        final BasicArrayList tileList = new BasicArrayList();
        this.createAnimationTiles(tileList);

        final int size = tileList.size();
        this.animationTileIndexArray = new int[size];
        this.startTimeFrameArray = new long[size];
        this.currentFrameArray = new int[size];
        this.animationArray = new Animation[size];
        
        this.setAnimations(tileList);
    }

    public TiledMap getMap() {
        return map;
    }

    public void createAnimationTiles(final BasicArrayList tileList) {
        final BasicArrayList tileSetList = map.getTileSets();
        final int size = tileSetList.size();
        if(size > 0) {
            TileSet tileSet;
            Tile tile;
            Animation animation;
            int tileCount;
            for (int index = 0; index < size; index++) {
                tileSet = (TileSet) tileSetList.get(index);
                tileCount = tileSet.getTilecount();
                for (int index2 = 0; index2 < tileCount; index2++) {
                    tile = tileSet.getTile(index2);
                    animation = tile.getAnimation();
                    if (animation != null) {
                        tileList.add(tile);
                    }
                }
            }
        }
    }
    
    public void setAnimations(final BasicArrayList tileList) {
        final int size = tileList.size();
        int animationTileIndex;
        final String CREATING_ANIMATION_TILE = "Creating AnimationTile: ";
        Tile tile;
        Animation animation;
        final TiledLayer tiledLayer = ((AllBinaryJ2METiledLayer) this.getAllBinaryTiledLayer()).getTiledLayer();
        for(int index = 0; index < size; index++) {
            tile = (Tile) tileList.get(index);
            animationTileIndex =  tiledLayer.createAnimatedTile(tile.getId());
            LogUtil.put(LogFactory.getInstance(CREATING_ANIMATION_TILE + animationTileIndex, this, commonStrings.PROCESS));
            this.animationArray[index] = animation = tile.getAnimation();
            this.animationTileIndexArray[index] = animationTileIndex;
            this.getAllBinaryTiledLayer().updateCells(((TileLayer) map.getLayer(0)).getMapArray(), ((Frame) animation.getFrame().get(0)).getTileid(), animationTileIndex);
        }
    }
    
    public void update() {
        final long startTime = GameTickTimeDelayHelperFactory.getInstance().startTime;
        final int size = this.animationArray.length;;
        Animation animation;
        Frame frame;
        final TiledLayer tiledLayer = ((AllBinaryJ2METiledLayer) this.getAllBinaryTiledLayer()).getTiledLayer();
        for(int index = 0; index < size; index++) {
            animation = (Animation) this.animationArray[index];
            frame = (Frame) animation.getFrame().get(this.currentFrameArray[index]);

            if (startTime - this.startTimeFrameArray[index] > frame.getDuration()) {
                //LogUtil.put(LogFactory.getInstance(new StringMaker().append("AnimationTile: ").append(this.animationTileIndexArray[index]).append(":").append(frame.getTileid()).toString(), this, commonStrings.PROCESS));
                this.startTimeFrameArray[index] = startTime;
                tiledLayer.setAnimatedTile(this.animationTileIndexArray[index], frame.getTileid());

                if (this.currentFrameArray[index] + 1 < animation.getFrame().size()) {
                    this.currentFrameArray[index]++;
                } else {
                    this.currentFrameArray[index] = 0;
                }

            }
        }
    }

    public void reset() {
        final AllBinaryTiledLayer allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        final int lastHeight = GameTickDisplayInfoSingleton.getInstance().getLastHeight();
        //LogUtil.put(LogFactory.getInstance("GameTickDisplayInfoSingleton lastHeight: " + lastHeight, this, "reset"));
        final int y = -lastHeight + allBinaryTiledLayer.getHeight();
        allBinaryTiledLayer.setPosition(0, -y, allBinaryTiledLayer.getZ());
    }

    //TWB temp hack for the strange positioning I use for GD builds.
    @Override
    public GeographicMapCellPosition getCellPositionAt(final int x, final int y) throws Exception
    {
        final AllBinaryTiledLayer allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        //ForcedLogUtil.log(new StringMaker().append("getCellPositionAt").append(x + allBinaryTiledLayer.getX()).append(',').append(y + allBinaryTiledLayer.getY()).toString(), this);
        return super.getCellPositionAt(x + allBinaryTiledLayer.getX(), y + allBinaryTiledLayer.getY());
        //return super.getCellPositionAt(x, y);
    }

    @Override
    public GeographicMapCellPosition getCellPositionAtNoThrow(final int x, final int y) throws Exception
    {
        final AllBinaryTiledLayer allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        //ForcedLogUtil.log(new StringMaker().append("getCellPositionAt").append(x + allBinaryTiledLayer.getX()).append(',').append(y + allBinaryTiledLayer.getY()).toString(), this);
        return super.getCellPositionAtNoThrow(x + allBinaryTiledLayer.getX(), y + allBinaryTiledLayer.getY());
        //return super.getCellPositionAtNoThrow(x, y);
    }
    
}
