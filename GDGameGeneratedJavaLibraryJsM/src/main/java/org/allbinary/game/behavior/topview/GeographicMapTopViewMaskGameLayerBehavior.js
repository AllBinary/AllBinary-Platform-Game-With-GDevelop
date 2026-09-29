/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2022 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
import { MultiGeographicMapBehavior } from '../../../../../org/allbinary/media/graphics/geography/map/MultiGeographicMapBehavior.js';
//not GWT import const GDCustomGameLayer
import { GravityUtil } from '../../../../../org/allbinary/game/physics/acceleration/GravityUtil.js';
//not GWT import const AllBinaryLayer
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not GWT import const GeographicMapCellType
import { SimpleGeographicMapCellPositionFactory } from '../../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const ViewPositionBase
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GeographicMapTopViewLayerBehavior } from './GeographicMapTopViewLayerBehavior.js';
//not GWT import - same folder const TopViewCharacterInterface
export class GeographicMapTopViewMaskGameLayerBehavior extends GeographicMapTopViewLayerBehavior {
    constructor() {
        super(16);
        this.logUtil = LogUtil.getInstance();
        this.gravityUtil = GravityUtil.getInstance();
        this.geographicMapBehavior = new MultiGeographicMapBehavior();
        this.unsafeGeographicMapCellPositionList = new BasicArrayListD();
        this.unsafePossibleGeographicMapCellPositionList = new BasicArrayListD();
        //For kotlin this is before the body of the constructor.
        this.autoStepBlocks = true;
    }
    constructor(maxGravityActionIndex, autoStepBlocks, offsetY) {
        super(maxGravityActionIndex);
        this.logUtil = LogUtil.getInstance();
        this.gravityUtil = GravityUtil.getInstance();
        this.geographicMapBehavior = new MultiGeographicMapBehavior();
        this.unsafeGeographicMapCellPositionList = new BasicArrayListD();
        this.unsafePossibleGeographicMapCellPositionList = new BasicArrayListD();
        //For kotlin this is before the body of the constructor.
        this.autoStepBlocks = autoStepBlocks;
    }
    //@Throws(Exception.constructor)
    gravity(velocityProperties, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition) {
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition);
            var hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            ;
            if (!hasSolidBlock) {
                this.gravityUtil.process(velocityProperties, this.gravityUtil.GAME_GRAVITY_VELOCITY);
                velocityProperties.limitXYToForwardAndReverseMaxVelocity();
                this.gravity();
            }
            else {
            }
        }
    }
    //@Throws(Exception.constructor)
    get(geographicMapInterfaceArray, geographicMapCellPositionList, layer, x, y) {
        var customGameLayer = layer;
        ;
        var frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        ;
        var maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        ;
        var maskPoint = maskRectangle.getPoint();
        ;
        var viewPosition = customGameLayer.getViewPosition();
        ;
        var viewX = viewPosition.getX();
        ;
        var viewY = viewPosition.getY();
        ;
        var xCellPosition = viewX + maskPoint.getX() + -x;
        ;
        var yCellPosition = viewY + maskPoint.getY() + -y;
        ;
        var x2CellPosition = viewX + maskPoint.getX() + -x + maskRectangle.getWidth();
        ;
        var y2CellPosition = viewY + maskPoint.getY() + -y + maskRectangle.getHeight();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return geographicMapInterfaceArray[0].getCellPositionAtNoThrow(xCellPosition, yCellPosition, x2CellPosition, y2CellPosition, geographicMapCellPositionList);
        ;
    }
    //@Throws(Exception.constructor)
    getLeftPosition(geographicMapInterfaceArray, layer) {
        var customGameLayer = layer;
        ;
        var frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        ;
        var maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        ;
        var maskPoint = maskRectangle.getPoint();
        ;
        var viewPosition = customGameLayer.getViewPosition();
        ;
        var viewX = viewPosition.getX();
        ;
        var viewY = viewPosition.getY();
        ;
        var xCellPosition = viewX + maskPoint.getX();
        ;
        var yCellPosition = viewY + maskPoint.getY() + maskRectangle.getHeight();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return geographicMapInterfaceArray[0].getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);
        ;
    }
    //@Throws(Exception.constructor)
    getRightPosition(geographicMapInterfaceArray, layer) {
        var customGameLayer = layer;
        ;
        var frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        ;
        var maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        ;
        var maskPoint = maskRectangle.getPoint();
        ;
        var viewPosition = customGameLayer.getViewPosition();
        ;
        var viewX = viewPosition.getX();
        ;
        var viewY = viewPosition.getY();
        ;
        var xCellPosition = viewX + maskPoint.getX() + maskRectangle.getWidth();
        ;
        var yCellPosition = viewY + maskPoint.getY() + maskRectangle.getHeight();
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return geographicMapInterfaceArray[0].getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);
        ;
    }
    //@Throws(Exception.constructor)
    getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y) {
        var geographicMapCellPositionList = this.unsafeGeographicMapCellPositionList;
        ;
        this.get(geographicMapInterfaceArray, geographicMapCellPositionList, layer, x, y);
        var geographicMapCellPosition = this.getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer);
        ;
        if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
        else {
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return geographicMapCellPosition;
    }
    //@Throws(Exception.constructor)
    getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer) {
        this.unsafePossibleGeographicMapCellPositionList.clear();
        if (geographicMapCellPositionList.size() > 0) {
            var size = geographicMapCellPositionList.size();
            ;
            for (var index = 0; index < size; index++) {
                var possibleStepGeographicMapCellPosition = geographicMapCellPositionList.get(index);
                ;
                var tiledLayer = geographicMapInterfaceArray[0].getAllBinaryTiledLayer();
                ;
                if (possibleStepGeographicMapCellPosition.getColumn() > 0 && possibleStepGeographicMapCellPosition.getRow() > 0 && possibleStepGeographicMapCellPosition.getColumn() < tiledLayer.getColumns() && possibleStepGeographicMapCellPosition.getRow() < tiledLayer.getRows()) {
                    this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
                    var hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
                    ;
                    var hasOffMap = this.isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray);
                    ;
                    if (hasSolidBlock || hasOffMap) {
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                    }
                    else {
                        this.unsafePossibleGeographicMapCellPositionList.add(possibleStepGeographicMapCellPosition);
                    }
                }
            }
            if (this.unsafePossibleGeographicMapCellPositionList.size() > 0) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return this.unsafePossibleGeographicMapCellPositionList.get(0);
            }
        }
        else {
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    }
    //@Throws(Exception.constructor)
    moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y) {
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            layer = layerlayer;
            layer.
                terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y);
        }
        else {
        }
    }
    //@Throws(Exception.constructor)
    move(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y) {
        var geographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y);
        ;
        this.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);
        if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return false;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
    }
    //@Throws(Exception.constructor)
    left(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer) {
        var geographicMapCellPosition = this.getLeftPosition(geographicMapInterfaceArray, layer);
        ;
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            var possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getAt(geographicMapCellPosition.getColumn(), geographicMapCellPosition.getRow() - 1);
            ;
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            var hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            ;
            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    layer = layerlayer;
                    layer.
                        leftp();
                }
                else {
                    velocityProperties.getVelocityXBasicDecimalP().setint(0);
                }
            }
            else {
                layer = layerlayer;
                layer.
                    leftp();
            }
        }
    }
    //@Throws(Exception.constructor)
    right(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer) {
        var geographicMapCellPosition = this.getRightPosition(geographicMapInterfaceArray, layer);
        ;
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            var possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getAt(geographicMapCellPosition.getColumn(), geographicMapCellPosition.getRow() - 1);
            ;
            this.geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            var hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            ;
            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    layer = layerlayer;
                    layer.
                        rightp();
                }
                else {
                    velocityProperties.getVelocityXBasicDecimalP().setint(0);
                }
            }
            else {
                layer = layerlayer;
                layer.
                    rightp();
            }
        }
    }
}
