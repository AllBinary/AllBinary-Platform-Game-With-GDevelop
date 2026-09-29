/*
        *
        * Copyright (c) 2006 All Binary
        * All Rights Reserved.
        * Don't Duplicate or Distributed.
        * Trade Secret Information
        * For Internal Use Only
        * Confidential
        * Unpublished
        *
        * Created By: Travis Berthelot
        * Date: August 6, 2006
        *
        *
        * Modified By         When       ?
*/
//not GWT import const TiledLayer
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const BasicColor
import { GameTickDisplayInfoSingleton } from '../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const GeographicMapCellPosition
import { GeographicMapCellPositionBaseFactory } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPositionBaseFactory.js';
//not GWT import const GeographicMapCellTypeFactory
import { SimpleGeographicMapCellPositionFactory } from '../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const CustomMapGeneratorBaseFactory
import { RaceTrackData } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackData.js';
//not GWT import const RaceTrackData
import { RaceTrackFrictionProperties } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackFrictionProperties.js';
//not GWT import const RaceTrackFrictionProperties
import { RaceTrackGeographicMap } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackGeographicMap.js';
//not GWT import const RaceTrackGeographicMap
import { RaceTrackInfo } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackInfo.js';
//not GWT import const RaceTrackInfo
import { GameTickTimeDelayHelperFactory } from '../../../../org/allbinary/time/GameTickTimeDelayHelperFactory.js';
//not GWT import const GameTickTimeDelayHelperFactory
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
import { Animation } from '../../../../org/mapeditor/core/Animation.js';
//not GWT import const TiledMap
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGeographicMap extends RaceTrackGeographicMap {
    constructor(tiledLayerFactoryInterface, tileLayer, cellTypeIdToGeographicMapCellType, map, tileSetImage, geographicMapCellTypeFactory, foregroundColor, backgroundColor, debugColor, customMapGeneratorBaseFactory) {
        super(new RaceTrackInfo(SmallIntegerSingletonFactory.getInstance().getAt(tileLayer.getId()), SmallIntegerSingletonFactory.getInstance().getAt(tileLayer.getId()).toString(), new RaceTrackFrictionProperties(0, 0), foregroundColor, backgroundColor, 0, 0, 0), new RaceTrackData(SmallIntegerSingletonFactory.getInstance().getAt(0), map.getTileWidth(), map.getTileHeight(), map.getTileWidth() / 4, map.getTileHeight() / 4, cellTypeIdToGeographicMapCellType, tileLayer.getMapArray()), tiledLayerFactoryInterface, new SimpleGeographicMapCellPositionFactory(), new GeographicMapCellPositionBaseFactory(), geographicMapCellTypeFactory, customMapGeneratorBaseFactory);
        this.logUtil = LogUtil.getInstance();
        this.commonStrings = CommonStrings.getInstance();
        //For kotlin this is before the body of the constructor.
        this.map = map;
        var tileList = new BasicArrayListD();
        ;
        this.createAnimationTiles(tileList);
        var size = tileList.size();
        ;
        this.animationTileIndexArray = new Array(size);
        this.startTimeFrameArray = new Array(size);
        this.currentFrameArray = new Array(size);
        this.animationArray = new Array(size);
        this.setAnimations(tileList);
    }
    getMap() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.map;
    }
    createAnimationTiles(tileList) {
        var tileSetList = this.map.getTileSets();
        ;
        var size = tileSetList.size();
        ;
        if (size > 0) {
            var tileSet;
            ;
            var tile;
            ;
            var animation;
            ;
            var tileCount = 0;
            ;
            for (var index = 0; index < size; index++) {
                tileSet = tileSetList.get(index);
                tileCount = tileSet.getTilecount();
                for (var index2 = 0; index2 < tileCount; index2++) {
                    tile = tileSet.getTile(index2);
                    animation = tile.getAnimation();
                    if (animation != Animation.NULL_ANIMATION) {
                        tileList.add(tile);
                    }
                }
            }
        }
    }
    setAnimations(tileList) {
        var features = Features.getInstance();
        ;
        var openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        ;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var size = tileList.size();
        ;
        var animationTileIndex = 0;
        ;
        var CREATING_ANIMATION_TILE = "Creating AnimationTile: ";
        ;
        var tile;
        ;
        var animation;
        ;
        var allBinaryJ2METiledLayer = this.getAllBinaryTiledLayer();
        ;
        var tiledLayer = allBinaryJ2METiledLayer.getTiledLayer();
        ;
        for (var index = 0; index < size; index++) {
            tile = tileList.get(index);
            animationTileIndex = tiledLayer.createAnimatedTile(tile.getId());
            this.logUtil.putF(CREATING_ANIMATION_TILE + animationTileIndex, this, this.commonStrings.PROCESS);
            this.animationArray[index] = animation = tile.getAnimation();
            this.animationTileIndexArray[index] = animationTileIndex;
            allBinaryJ2METiledLayer.updateCells(getLayer.getMapArray(), get.getTileid(), animationTileIndex);
        }
    }
    update() {
        var features = Features.getInstance();
        ;
        var openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        ;
        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var startTime = GameTickTimeDelayHelperFactory.getInstance().startTime;
        ;
        var size = this.animationArray.length;
        ;
        //Otherwise - statement - EmptyStmt
        var animation;
        ;
        var frame;
        ;
        var tiledLayer = getAllBinaryTiledLayer.getTiledLayer();
        ;
        for (var index = 0; index < size; index++) {
            animation = this.animationArray[index];
            frame = animation.getFrame().get(this.currentFrameArray[index]);
            if (startTime - this.startTimeFrameArray[index] > frame.getDuration()) {
                this.startTimeFrameArray[index] = startTime;
                tiledLayer.setAnimatedTile(this.animationTileIndexArray[index], frame.getTileid());
                if (this.currentFrameArray[index] + 1 < animation.getFrame().size()) {
                    this.currentFrameArray[index]++;
                }
                else {
                    this.currentFrameArray[index] = 0;
                }
            }
        }
    }
    reset() {
        var allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        ;
        var lastHeight = GameTickDisplayInfoSingleton.getInstance().getLastHeight();
        ;
        var y = -lastHeight + allBinaryTiledLayer.getHeight();
        ;
        allBinaryTiledLayer.setPosition(0, -y, allBinaryTiledLayer.getZP());
    }
    //@Throws(Exception.constructor)
    getCellPositionAtXY(x, y) {
        var allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return super.getCellPositionAtXY(x + allBinaryTiledLayer.getXP(), y + allBinaryTiledLayer.getYP());
        ;
    }
    getCellPositionAtXYNoThrow(x, y) {
        var allBinaryTiledLayer = this.getAllBinaryTiledLayer();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return super.getCellPositionAtXYNoThrow(x + allBinaryTiledLayer.getXP(), y + allBinaryTiledLayer.getYP());
        ;
    }
}
