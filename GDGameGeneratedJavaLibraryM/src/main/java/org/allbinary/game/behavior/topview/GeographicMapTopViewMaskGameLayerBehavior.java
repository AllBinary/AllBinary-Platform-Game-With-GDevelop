/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.game.behavior.topview;

import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.GDCustomGameLayer;
import org.allbinary.game.physics.acceleration.GravityUtil;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayer;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GeographicMapTopViewMaskGameLayerBehavior extends GeographicMapTopViewLayerBehavior {
    protected final LogUtil logUtil = LogUtil.getInstance();


    private final GravityUtil gravityUtil = GravityUtil.getInstance();
    
    private final MultiGeographicMapBehavior geographicMapBehavior = new MultiGeographicMapBehavior();

    public final BasicArrayList unsafeGeographicMapCellPositionList = new BasicArrayList();
    public final BasicArrayList unsafePossibleGeographicMapCellPositionList = new BasicArrayList();
    
    private final boolean autoStepBlocks;
    //private final int offsetY;
    
    //public GeographicMapCellPosition blockGeographicMapCellPosition;

    //private GeographicMapCellPosition previousGeographicMapCellPosition;

    public GeographicMapTopViewMaskGameLayerBehavior() {
        super(16 //32
        );
        this.autoStepBlocks = true;
        //this.offsetY = 0;
    }
    
    public GeographicMapTopViewMaskGameLayerBehavior(final int maxGravityActionIndex, final boolean autoStepBlocks, final int offsetY) {
        super(maxGravityActionIndex);
        this.autoStepBlocks = autoStepBlocks;
        //this.offsetY = offsetY;
    }
    
    @Override
    public void gravity(final VelocityProperties velocityProperties,
            final BasicGeographicMap[] geographicMapInterfaceArray,
            final GeographicMapCellType[] geographicMapCellTypeArray, 
            final GeographicMapCellPosition geographicMapCellPosition)
            throws Exception {
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition);
            final boolean hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);

            if (!hasSolidBlock) {
                //logUtil.put(new StringMaker().append("Not on Block: ").append(geographicMapCellPosition).append(" cellType: ").append(cellType).toString(), this, "gravity");

                gravityUtil.process(velocityProperties);

                velocityProperties.limitXYToForwardAndReverseMaxVelocity();
                this.gravity();
            } else {
                //logUtil.put(new StringMaker().append("On Block: ").append(geographicMapCellPosition).append(" cellType: ").append(cellType).toString(), this, "gravity");
            }
        }

        // If landing fails use this for debugging
        /*
         * if(jumpIndex != 0) {
         * this.getVelocityProperties().getVelocityYBasicDecimal().add(800);
         * this.getVelocityProperties().limitMaxVelocity(); }
         */
    }

    private BasicArrayList get(final BasicGeographicMap[] geographicMapInterfaceArray, final BasicArrayList geographicMapCellPositionList, final AllBinaryLayer layer, final int x, final int y) throws Exception {
        
        final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) layer;
        final int frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        final Rectangle maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        final GPoint maskPoint = maskRectangle.getPoint();
        final ViewPosition viewPosition = customGameLayer.getViewPosition();
        final int viewX = viewPosition.getX();
        final int viewY = viewPosition.getY();
        
//        final CommonSeps commonSeps = CommonSeps.getInstance();
//        logUtil.put(new StringMaker()
//                .append(layer.getX()).append(commonSeps.COLON).append(-x).append(commonSeps.COLON).append(layer.getHalfWidth())
//                .append(layer.getY()).append(commonSeps.COLON).append(-y).append(commonSeps.COLON).append(layer.getHalfHeight())
//                .toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
        final int xCellPosition = viewX + maskPoint.getX() + -x;
        final int yCellPosition = viewY + maskPoint.getY() + -y;
        final int x2CellPosition = viewX + maskPoint.getX() + -x + maskRectangle.getWidth();
        final int y2CellPosition = viewY + maskPoint.getY() + -y + maskRectangle.getHeight();
        
        return geographicMapInterfaceArray[0].getCellPositionAtNoThrow(xCellPosition, yCellPosition, x2CellPosition, y2CellPosition, geographicMapCellPositionList);
    }
       
    private GeographicMapCellPosition getLeftPosition(final BasicGeographicMap[] geographicMapInterfaceArray, final AllBinaryLayer layer) throws Exception {

        final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) layer;
        final int frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        final Rectangle maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        final GPoint maskPoint = maskRectangle.getPoint();
        final ViewPosition viewPosition = customGameLayer.getViewPosition();
        final int viewX = viewPosition.getX();
        final int viewY = viewPosition.getY();

        final int xCellPosition = viewX + maskPoint.getX();
        final int yCellPosition = viewY + maskPoint.getY() + maskRectangle.getHeight();

        return geographicMapInterfaceArray[0].getCellPositionAtNoThrow(xCellPosition, yCellPosition);        
    }

    private GeographicMapCellPosition getRightPosition(final BasicGeographicMap[] geographicMapInterfaceArray, final AllBinaryLayer layer) throws Exception {

        final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) layer;
        final int frame = customGameLayer.getIndexedAnimationInterface().getFrame();
        final Rectangle maskRectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame];
        final GPoint maskPoint = maskRectangle.getPoint();
        final ViewPosition viewPosition = customGameLayer.getViewPosition();
        final int viewX = viewPosition.getX();
        final int viewY = viewPosition.getY();
        
        final int xCellPosition = viewX + maskPoint.getX() + maskRectangle.getWidth();
        final int yCellPosition = viewY + maskPoint.getY() + maskRectangle.getHeight();

        return geographicMapInterfaceArray[0].getCellPositionAtNoThrow(xCellPosition, yCellPosition);        
    }
    
    @Override
    public GeographicMapCellPosition getGeographicMapCellPositionIfNotSolidBlockOrOffMap(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, int y) throws Exception {
        
        final BasicArrayList geographicMapCellPositionList = this.unsafeGeographicMapCellPositionList;
        this.get(geographicMapInterfaceArray, geographicMapCellPositionList, layer, x, y);
        //logUtil.put("Blocks Touching Total: " + geographicMapCellPositionList.size(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");

        final GeographicMapCellPosition geographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer);

        if (geographicMapCellPosition == null) {
//            if(layer.getName().startsWith("BatEnemy")) {
//                logUtil.put("Found impassable block: top left", this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
//            }
            return null;
        } else {
//            if(layer.getName().startsWith("BatEnemy")) {
//                logUtil.put("Did not find impassable block ", this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
//            }
        }

        return geographicMapCellPosition;
    }
    
    @Override
    public GeographicMapCellPosition getGeographicMapCellPositionIfNotSolidBlockOrOffMap(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final BasicArrayList geographicMapCellPositionList, final VelocityProperties velocityProperties, final AllBinaryLayer layer) throws Exception {
        
        //logUtil.put(geographicMapCellPosition.toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");

        //GeographicMapCellPosition previousGeographicMapCellPosition = null;        
        unsafePossibleGeographicMapCellPositionList.clear();

        // If walking into a solid block
        //this.isJumpAction && 
        //this.previousGeographicMapCellPosition != geographicMapCellPosition && 
        if (geographicMapCellPositionList.size() > 0) {

            final int size = geographicMapCellPositionList.size();
            for(int index = 0; index < size; index++) {

            final GeographicMapCellPosition possibleStepGeographicMapCellPosition = (GeographicMapCellPosition) geographicMapCellPositionList.get(index);

//            final GeographicMapCellPosition possibleStepGeographicMapCellPosition
//                    = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getInstance(
//                            geographicMapCellPosition.getColumn(),
//                            geographicMapCellPosition.getRow());
//
            //logUtil.put(possibleStepGeographicMapCellPosition.toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");

            final AllBinaryTiledLayer tiledLayer = geographicMapInterfaceArray[0].getAllBinaryTiledLayer();
            //logUtil.put(new StringMaker().append("tileLayer: ").append(tiledLayer.getX()).append(CommonSeps.getInstance().COLON).append(tiledLayer.getY()).toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
            //logUtil.put(new StringMaker().append("tileLayer: ").append(tiledLayer.getColumns()).append(CommonSeps.getInstance().COLON).append(tiledLayer.getRows()).toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");

            if(possibleStepGeographicMapCellPosition.getColumn() > 0 && possibleStepGeographicMapCellPosition.getRow() > 0 &&
                    possibleStepGeographicMapCellPosition.getColumn() < tiledLayer.getColumns() && 
                    possibleStepGeographicMapCellPosition.getRow() < tiledLayer.getRows()) {

            geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            final boolean hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);
            final boolean hasOffMap = this.isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray);

            //logUtil.put("cellType: " + cellType, this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");

             //|| basicPlatormGeographicMapCellTypeFactory.JUMP_THRU_CELL_TYPE.isType(cellType)
                if (hasSolidBlock || hasOffMap) {
                //if (cellType.getType() != 14) {
                    
                    //logUtil.put("found cellType: " + cellType, this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
                    
//                    if (this.autoStepBlocks) {
//                        // int newY = this.getHeight() -
//                        // possibleStepGeographicMapCellPosition.getPoint().getY().intValue();
//                        final int newY = possibleStepGeographicMapCellPosition.getPoint().getY() - layer.getHeight();
//                        //logUtil.put("Stepping at: y: " + newY, this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
//                        // -possibleStepGeographicMapCellPosition.getPoint().getX().intValue()
//                        layer.setPosition(layer.getX(), newY, layer.getZ());
//                        this.previousGeographicMapCellPosition = possibleStepGeographicMapCellPosition;
//                        return possibleStepGeographicMapCellPosition;
//                    } else {
                        //logUtil.put("do not move", this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
                        //this.blockGeographicMapCellPosition = possibleStepGeographicMapCellPosition;
                        //velocityProperties.getVelocityXBasicDecimal().set(0);
                        //previousGeographicMapCellPosition = null;
                        return null;
//                    }
                } else {
                    //logUtil.put("cellType: " + cellType, this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
                    //previousGeographicMapCellPosition = possibleStepGeographicMapCellPosition;
                    unsafePossibleGeographicMapCellPositionList.add(possibleStepGeographicMapCellPosition);
                    //return possibleStepGeographicMapCellPosition;
                }

            }
            }
            
            if(unsafePossibleGeographicMapCellPositionList.size() > 0) {
                //logUtil.put("Tile with movement allowed total: " + unsafePossibleGeographicMapCellPositionList.size(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
                return (GeographicMapCellPosition) unsafePossibleGeographicMapCellPositionList.get(0);
            }
            
        } else {
            //logUtil.put("GeographicMapCellPosition was null: Probably off Map: " + layer.toString(), this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap", new Exception());
        }
        
        //logUtil.put("not moving", this, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap");
        //previousGeographicMapCellPosition = null;
        return null;
        //this.previousGeographicMapCellPosition = geographicMapCellPosition;
        //return geographicMapCellPosition;
    }
    
    @Override
    public void moveAndLand(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final GeographicMapCellPosition geographicMapCellPosition, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, final int y) throws Exception {
        
        //final int x = velocityProperties.getVelocityXBasicDecimal().getScaled();
        //final int y = velocityProperties.getVelocityYBasicDecimal().getScaled();

        //logUtil.put(new StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand");
        
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

            ((TopViewCharacterInterface) layer).terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y);

            //final String MOVE_AND_LAND = "moveAndLand";
            //logUtil.put(new StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND);
//            if (this.gravityActionIndex != 0 && y > 0 && geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
//
//                final GeographicMapCellType cellType = geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellPosition);
//
//                //logUtil.put(new StringMaker().append("Should Land at cellType: ").append(cellType).toString(), this, MOVE_AND_LAND);
//                if (geographicMapCellTypeFactory.BLOCK_CELL_TYPE.isType(cellType)) // ||
//                // this.getViewPositionY() > DisplayInfoSingleton.getInstance().getLastHeight() - 55)
//                {
//                    final int landY = geographicMapCellPosition.getPoint().getY() - layer.getHeight() + offsetY;
//
//                    // logUtil.put("Cell Position: y: " + geographicMapCellPosition.getPoint().getX().intValue(), this, "moveAndLand");
//                    // logUtil.put("Landing at: y: " + landY, this, "moveAndLand");
//                    layer.setPosition(layer.getX(), landY, layer.getZ());
//                    //this.land(velocityProperties);
//                    //((TopViewCharacterInterface) layer).terrainLand();
//                }
//
//            }
//
//            ((TopViewCharacterInterface) layer).terrainEvent(x, y, geographicMapInterfaceArray, geographicMapCellPosition);
        } else {
            //logUtil.put("do not move", this, "moveAndLand");
        }
        
    }
    
    @Override
    public boolean move(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, final int y) throws Exception {

        final GeographicMapCellPosition geographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y);

        //this.gravity(velocityProperties, geographicMapInterfaceArray, geographicMapCellPosition);

        this.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);
        
        if(geographicMapCellPosition == null) {
            return false;
        } else {
            return true;
        }
    }
    
    @Override
    public void left(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final VelocityProperties velocityProperties, final AllBinaryLayer layer) throws Exception {

        final GeographicMapCellPosition geographicMapCellPosition = this.getLeftPosition(geographicMapInterfaceArray, layer);

        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

            final GeographicMapCellPosition possibleStepGeographicMapCellPosition
                    = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getInstance(
                            geographicMapCellPosition.getColumn(),
                            geographicMapCellPosition.getRow() - 1);

            geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            final boolean hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);

            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    ((TopViewCharacterInterface) layer).leftp();
                } else {
                    velocityProperties.getVelocityXBasicDecimalP().set(0);
                }
            } else {
                ((TopViewCharacterInterface) layer).leftp();
            }
        }
        
    }

    @Override
    public void right(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final VelocityProperties velocityProperties, final AllBinaryLayer layer) throws Exception {

        final GeographicMapCellPosition geographicMapCellPosition = this.getRightPosition(geographicMapInterfaceArray, layer);

        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

            final GeographicMapCellPosition possibleStepGeographicMapCellPosition
                    = geographicMapInterfaceArray[0].getGeographicMapCellPositionFactory().getInstance(
                            geographicMapCellPosition.getColumn(),
                            geographicMapCellPosition.getRow() - 1);

            geographicMapBehavior.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
            final boolean hasSolidBlock = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray);

            if (hasSolidBlock) {
                if (this.autoStepBlocks) {
                    ((TopViewCharacterInterface) layer).rightp();
                } else {
                    velocityProperties.getVelocityXBasicDecimalP().set(0);
                }
            } else {
                ((TopViewCharacterInterface) layer).rightp();
            }
        }
    }
}
