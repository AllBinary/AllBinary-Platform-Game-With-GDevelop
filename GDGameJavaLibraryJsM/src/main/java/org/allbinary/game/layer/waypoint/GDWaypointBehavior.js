/* Generated Code Do Not Modify */
import { Exception } from '../../../../../java/lang/Exception.js';
import { Integer } from '../../../../../java/lang/Integer.js';
import { PrimaryWaypointHelper } from '../../../../../org/allbinary/game/input/form/PrimaryWaypointHelper.js';
//not GWT import const SensorAction
import { SensorActionFactory } from '../../../../../org/allbinary/game/layer/SensorActionFactory.js';
//not GWT import const SensorActionFactory
import { WaypointBehaviorBase } from '../../../../../org/allbinary/game/layer/WaypointBehaviorBase.js';
//not GWT import const WaypointBehaviorBase
import { CollidableDestroyableDamageableLayer } from '../../../../../org/allbinary/game/layer/special/CollidableDestroyableDamageableLayer.js';
//not GWT import const WaypointEventListenerInterface
import { BasicColorFactory } from '../../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const AllBinaryLayer
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not GWT import const AllBinaryEventObject
import { EventStrings } from '../../../../../org/allbinary/logic/util/event/EventStrings.js';
//not GWT import const EventStrings
import { GeographicMapCellHistory } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellHistory.js';
//not GWT import const GeographicMapCellPosition
import { SimpleGeographicMapCellPositionFactory } from '../../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory
import { TimeDelayHelper } from '../../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
//not plain js import { ImmutableBasicArrayList } 
const ImmutableBasicArrayList = globalThis.org.allbinary.util.ImmutableBasicArrayList;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDWaypointBehavior extends WaypointBehaviorBase {
    constructor(associatedAdvancedRTSGameLayer, fakeWaypoint) {
        super();
        this.logUtil = LogUtil.getInstance();
        this.longWeaponRange = 0;
        this.sensorAction = SensorActionFactory.getInstance().ATTACK;
        this.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        this.currentPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        this.moving = false;
        this.movingFromStopped = false;
        this.waypointPathsList = BasicArrayListUtil.getInstance().getImmutableInstance();
        this.currentTargetDistance = Integer.MAX_VALUE;
        this.currentTargetLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance();
        this.currentTargetGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        this.trackingWaypoint = false;
        this.repeatedToLong = new TimeDelayHelper(22000);
        this.associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer;
        this.completeTimeDelayHelper = new TimeDelayHelper(30000);
        this.targetList = new BasicArrayListD();
        this.possibleTargetList = new BasicArrayListD();
        this.setWaypointPathsList(GDWaypointBehavior.DEFAULT);
        this.currentGeographicMapCellHistory = new GeographicMapCellHistory();
        this.FAKE_WAYPOINT_LAYER = fakeWaypoint;
    }
    initRange(weaponRange) {
        this.longWeaponRange = weaponRange / 2;
    }
    onEvent(eventObject) {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }
    //@Throws(Exception.constructor)
    onWaypointEvent(event) {
        var advancedRTSGameLayer = event.getRtsLayer();
        ;
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().onWaypointEvent(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
        if (this.associatedAdvancedRTSGameLayer.isSelected()) {
            this.addWaypointFromUser(advancedRTSGameLayer);
        }
        else if (advancedRTSGameLayer.shouldAddWaypointFromBuilding()) {
            this.addWaypointFromBuilding(advancedRTSGameLayer);
        }
    }
    //@Throws(Exception.constructor)
    addWaypointFromUser(advancedRTSGameLayer) {
    }
    //@Throws(Exception.constructor)
    addWaypointFromBuilding(advancedRTSGameLayer) {
        if (advancedRTSGameLayer == PrimaryWaypointHelper.getInstance().getWaypointLayer() || advancedRTSGameLayer.getParentLayer() == this.associatedAdvancedRTSGameLayer.getParentLayer()) {
            if (!this.targetList.contains(advancedRTSGameLayer)) {
                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
                if (advancedRTSGameLayer.isDestroyed()) {
                    throw new Exception("Trying to add a dead: " + advancedRTSGameLayer);
                }
                this.targetList.add(advancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().addWaypointFromBuildingList(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.targetList);
            }
        }
    }
    isWaypointListEmptyOrOnlyTargets() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    insertWaypoint(index, rtsLayer) {
        if (this.canInsertWaypoint(index, rtsLayer)) {
            this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().insertWaypoint(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName());
            if (rtsLayer.isDestroyed()) {
                throw new Exception("Trying to add a dead: " + rtsLayer);
            }
            this.targetList.addAt(index, rtsLayer);
            this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().insertWaypointList(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName(), this.targetList);
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    move() {
        if (this.isMoving()) {
            this.setMovingFromStopped(false);
        }
        else {
            this.setMovingFromStopped(true);
        }
        this.setMoving(false);
    }
    //@Throws(Exception.constructor)
    setRandomGeographicMapCellHistory(pathsList) {
        if (pathsList == BasicArrayListUtil.getInstance().getImmutableInstance()) {
            this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setRandomGeographicMapCellHistory(this.associatedAdvancedRTSGameLayer);
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var size = pathsList.size();
        ;
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setRandomGeographicMapCellHistoryList(this.associatedAdvancedRTSGameLayer, pathsList);
        if (size > 0) {
            var geographicMapCellPositionBasicArrayList = BasicArrayListUtil.getInstance().getRandom(pathsList);
            ;
            this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
        }
    }
    //@Throws(Exception.constructor)
    setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList) {
        this.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        if (this.associatedAdvancedRTSGameLayer.isShowMoreCaptionStates()) {
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior.PATHING, BasicColorFactory.getInstance().GREEN);
        }
        this.currentGeographicMapCellHistory.init();
        this.associatedAdvancedRTSGameLayer.init(this.currentGeographicMapCellHistory, geographicMapCellPositionBasicArrayList);
        this.setTrackingWaypoint(true);
        this.getCompleteTimeDelayHelper().setStartTimeTNT();
    }
    canInsertWaypoint(index, rtsLayer) {
        if (this.targetList.size() > 4) {
        }
        else if (this.targetList.contains(rtsLayer)) {
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    addBuildingChase(allbinaryLayer, cellPosition) {
    }
    //@Throws(Exception.constructor)
    moveAwayFromBuilding(buildingLayer) {
        var geographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
        ;
        if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var list = buildingLayer.getGeographicMapCellPositionArea().getOccupyingGeographicMapCellPositionList();
        ;
        if (list.contains(geographicMapCellPosition)) {
            if (this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER)) {
                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().moveAwayFromBuilding(this.associatedAdvancedRTSGameLayer);
                this.setCurrentTargetLayerInterface(this.FAKE_WAYPOINT_LAYER);
                var pathsList = buildingLayer.getMoveOutOfBuildAreaPath(geographicMapCellPosition);
                ;
                this.associatedAdvancedRTSGameLayer.setClosestGeographicMapCellHistory(pathsList);
            }
        }
    }
    needToMove() {
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().needToMove(this.associatedAdvancedRTSGameLayer, this);
        if (this.isTrackingWaypoint() || this.sensorAction == SensorActionFactory.getInstance().EVADE || (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentTargetDistance() >= this.longWeaponRange + this.currentTargetLayerInterface.getHalfHeight())) {
            this.repeatedToLong.setStartTimeTNT();
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        if (this.repeatedToLong.isTimeTNT()) {
            var message = "Repeating too long: " + this.getMovementLogicAsString();
            ;
            ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer);
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    getMovementLogicAsString() {
        var stringBuffer = new StringMaker();
        ;
        stringBuffer.append("isTrackingWaypoint: ");
        stringBuffer.appendboolean(this.isTrackingWaypoint());
        stringBuffer.append(" sensorAction: ");
        stringBuffer.append(this.sensorAction.name);
        stringBuffer.append(" getCurrentTargetLayerInterface: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.currentTargetLayerInterface));
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            stringBuffer.append(" Target Range: ");
            stringBuffer.appendint(this.getCurrentTargetDistance());
            stringBuffer.append(" >= ");
            stringBuffer.appendint(this.longWeaponRange + this.currentTargetLayerInterface.getHalfHeight());
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuffer.toString();
        ;
    }
    isMovingFromStopped() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.movingFromStopped;
    }
    setMovingFromStopped(movingFromStopped) {
        this.movingFromStopped = movingFromStopped;
    }
    setWaypointPathsList(waypointPathsList) {
        this.waypointPathsList = waypointPathsList;
    }
    getWaypointPathsList() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.waypointPathsList;
    }
    isMoving() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.moving;
    }
    setMoving(moving) {
        this.moving = moving;
    }
    isTrackingWaypoint() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.trackingWaypoint;
    }
    getPossibleTargetList() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.possibleTargetList;
    }
    setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition) {
        this.lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition;
    }
    getLastPathGeographicMapCellPosition() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.lastPathGeographicMapCellPosition;
    }
    setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition) {
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.currentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition);
        this.currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition;
    }
    getCurrentPathGeographicMapCellPosition() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.currentPathGeographicMapCellPosition;
    }
    setSensorAction(sensorAction) {
        this.sensorAction = sensorAction;
    }
    getSensorAction() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.sensorAction;
    }
    getTargetList() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.targetList;
    }
    //@Throws(Exception.constructor)
    setCurrentTargetLayerInterface(currentTargetLayerInterface) {
        this.currentTargetLayerInterface = currentTargetLayerInterface;
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.currentTargetGeographicMapCellPosition = currentTargetLayerInterface.getCurrentGeographicMapCellPosition();
        }
        else {
            this.currentTargetGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
    }
    getCurrentTargetLayerInterface() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.currentTargetLayerInterface;
    }
    setCurrentTargetDistance(currentTargetDistance) {
        this.currentTargetDistance = currentTargetDistance;
    }
    getCurrentTargetDistance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.currentTargetDistance;
    }
    getCompleteTimeDelayHelper() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.completeTimeDelayHelper;
    }
    getCurrentGeographicMapCellHistory() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.currentGeographicMapCellHistory;
    }
    setTrackingWaypoint(trackingWaypoint) {
        this.trackingWaypoint = trackingWaypoint;
    }
}
GDWaypointBehavior.DEFAULT = new ImmutableBasicArrayList("DefaultAndImmutable", 0);
GDWaypointBehavior.PATHING = "Pathing";
