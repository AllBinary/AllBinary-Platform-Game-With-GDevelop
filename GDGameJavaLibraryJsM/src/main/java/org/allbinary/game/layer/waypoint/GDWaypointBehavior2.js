/* Generated Code Do Not Modify */
import { Exception } from '../../../../../java/lang/Exception.js';
import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
//not GWT import const PathFindingLayerInterface
import { SteeringVisitor } from '../../../../../org/allbinary/game/layer/SteeringVisitor.js';
//not GWT import const SteeringVisitor
import { WaypointPathRunnable } from '../../../../../org/allbinary/game/layer/WaypointPathRunnable.js';
//not GWT import const WaypointPathRunnableBase
import { CollidableDestroyableDamageableLayer } from '../../../../../org/allbinary/game/layer/special/CollidableDestroyableDamageableLayer.js';
//not GWT import const CollidableDestroyableDamageableLayer
import { TrackingEventHandler } from '../../../../../org/allbinary/game/tracking/TrackingEventHandler.js';
//not GWT import const GPoint
import { BasicColorFactory } from '../../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const AllBinaryLayerManager
//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
import { LayerDistanceUtil } from '../../../../../org/allbinary/math/LayerDistanceUtil.js';
//not GWT import const GeographicMapCompositeInterface
import { SimpleGeographicMapCellPositionFactory } from '../../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory
import { PathFindingThreadPool } from '../../../../../org/allbinary/thread/PathFindingThreadPool.js';
//not GWT import const ThreadPool
import { TimeDelayHelper } from '../../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDWaypointBehavior } from './GDWaypointBehavior.js';
//not GWT import - same folder const WaypointBase
//import { BuildingSteeringVisitor } from './BuildingSteeringVisitor.js';
//not GWT import - same folder const BuildingSteeringVisitor
export class GDWaypointBehavior2 extends GDWaypointBehavior {
    constructor(ownerAdvancedRTSGameLayer, fakeWaypoint) {
        super(ownerAdvancedRTSGameLayer, fakeWaypoint);
        this.logUtil = LogUtil.getInstance();
        this.layerDistanceUtil = LayerDistanceUtil.getInstance();
        this.pathFindingThreadPool = PathFindingThreadPool.getInstance();
        this.targetWithoutSensors = true;
        this.sensorRange = 0;
        this.closeRange = 0;
        this.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        this.waitingOnTargetPath = false;
        this.waitingOnWaypointPath = false;
        this.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance();
        //inner= member=true isStatic=
        this.BuildingSteeringVisitor = class extends SteeringVisitor {
            constructor() {
                /*Static stuff is not allowed for TypeScript inner classes*/ /**/
                super(...arguments);
                this.positionList = new BasicArrayListD();
            }
            visit(anyType = {}) {
                try {
                    if (this.getList().size() > 0) {
                        var allbinaryLayer = this.getList().get(0);
                        ;
                        var cellPosition = this.getPositionList().get(0);
                        ;
                        var clear = GDWaypointBehavior2.prototype.buildingChase(allbinaryLayer, cellPosition);
                        ;
                        if (clear) {
                            this.getList().clear();
                            this.positionList.clear();
                            //if statement needs to be on the same line and ternary does not work the same way.
                            return NullUtil.getInstance().NULL_OBJECT;
                        }
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Boolean.FALSE;
                    }
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return NullUtil.getInstance().NULL_OBJECT;
                    //: 
                }
                catch (e) {
                    var commonStrings = CommonStrings.getInstance();
                    ;
                    logUtil.put(commonStrings.EXCEPTION, this, "visit", e);
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return NullUtil.getInstance().NULL_OBJECT;
                }
            }
            getPositionList() {
                //if statement needs to be on the same line and ternary does not work the same way.
                return this.positionList;
            }
        };
        this.buildingSteeringVisitor = new this.BuildingSteeringVisitor();
        //For kotlin this is before the body of the constructor.
        this.progressTimeDelayHelper = new TimeDelayHelper(5000);
        this.wanderPathsList = new BasicArrayListD();
        this.waypointPathRunnable = new WaypointPathRunnable();
    }
    initRange(weaponRange) {
        super.initRange(weaponRange);
        this.closeRange = weaponRange;
        this.sensorRange = weaponRange * 4;
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().initRange(this.associatedAdvancedRTSGameLayer, this.closeRange, this.sensorRange);
    }
    isRunning() {
        if (this.waypointPathRunnable.isRunning()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return false;
        }
    }
    //@Throws(Exception.constructor)
    processTick(allBinaryLayerManager) {
        if (this.waypointPathsList == GDWaypointBehavior.DEFAULT) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentGeographicMapCellHistory().getTotalVisited() > this.getCurrentGeographicMapCellHistory().getTotalNotVisited()) {
            this.updatePathOnTargetMove(GDWaypointBehavior2.VISITED_MOST_OF_THE_PATH);
        }
        if (this.waypointPathRunnable.isRunning()) {
            if (this.waypointPathsList != GDWaypointBehavior2.runningWaypointPathList) {
                this.waypointPathRunnable.setRunning(false);
                if (this.waitingOnTargetPath) {
                    this.setTargetPath();
                }
                else if (this.waitingOnWaypointPath) {
                    this.setWaypointPath(this.waypointPathRunnable.getTargetLayer());
                }
                else {
                    throw new Exception("Should not happen");
                }
            }
            else {
                this.updatePathOnTargetMove(GDWaypointBehavior2.RETURNING_AS_WAYPOINT_PATH_LIST);
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
        }
        this.processTargetList();
        if (!this.waypointPathRunnable.isRunning()) {
            this.processWaypoint();
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (!this.waypointPathRunnable.isRunning()) {
            this.processTargeting();
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (!this.waypointPathRunnable.isRunning()) {
            this.teleportIfNoProgress();
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
    }
    //@Throws(Exception.constructor)
    onEnemyMovement(layerInterface) {
        var anotherTargetDistance = this.layerDistanceUtil.getDistance(this.associatedAdvancedRTSGameLayer, layerInterface);
        ;
        if (layerInterface == this.currentTargetLayerInterface) {
            this.setCurrentTargetDistance(anotherTargetDistance);
        }
        else {
            this.processPossibleTarget(layerInterface, anotherTargetDistance);
        }
    }
    //@Throws(Exception.constructor)
    processPossibleTarget(layerInterface, anotherTargetDistance) {
        var isShorterThanCurrentTargetDistance = this.getCurrentTargetDistance() > anotherTargetDistance;
        ;
        var isCurrentTargetDestroyed = this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.currentTargetLayerInterface.isDestroyed();
        ;
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed);
        if (this.isWaypointListEmptyOrOnlyTargets() && this.isInSensorRange(layerInterface, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed)) {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processSetTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
            this.setTargetWithDistance(layerInterface, anotherTargetDistance);
        }
        else if (this.isCloseRange(layerInterface, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed)) {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processPossibleTargetCloser(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
            this.setTargetWithDistance(layerInterface, anotherTargetDistance);
        }
    }
    //@Throws(Exception.constructor)
    teleportIfNoProgress() {
        if (this.isTrackingWaypoint()) {
            if (this.progressTimeDelayHelper.isTimeTNT() && this.nextUnvisitedPathGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                this.associatedAdvancedRTSGameLayer.teleportTo(this.nextUnvisitedPathGeographicMapCellPosition);
            }
            if (this.getCompleteTimeDelayHelper().isTimeTNT()) {
                var geographicMapCellPosition = this.currentGeographicMapCellHistory.getTracked().get(this.currentGeographicMapCellHistory.getSize() - 1);
                ;
                this.associatedAdvancedRTSGameLayer.teleportTo(geographicMapCellPosition);
            }
        }
    }
    //@Throws(Exception.constructor)
    updatePathOnTargetMove(reason) {
        var currentTargetLayerInterface = this.currentTargetLayerInterface;
        ;
        if (currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            var geographicMapCellPosition = currentTargetLayerInterface.getCurrentGeographicMapCellPosition();
            ;
            if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
            if (this.currentTargetGeographicMapCellPosition != geographicMapCellPosition) {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().targetMovedSoRetarget(this.associatedAdvancedRTSGameLayer);
                this.setWaypointPathsList(GDWaypointBehavior.DEFAULT);
                this.setTarget(currentTargetLayerInterface);
            }
            else {
            }
        }
        else {
            throw new RuntimeException();
        }
    }
    //@Throws(Exception.constructor)
    setTarget(layerInterface) {
        var anotherTargetDistance = this.layerDistanceUtil.getDistance(this.associatedAdvancedRTSGameLayer, layerInterface);
        ;
        this.setTargetWithDistance(layerInterface, anotherTargetDistance);
    }
    //@Throws(Exception.constructor)
    setTargetWithDistance(layerInterface, anotherTargetDistance) {
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.TARGET, BasicColorFactory.getInstance().GREEN);
        this.associatedAdvancedRTSGameLayer.setLoad(0);
        this.setCurrentTargetDistance(anotherTargetDistance);
        this.setCurrentTargetLayerInterface(layerInterface);
        this.setTrackingWaypoint(false);
        this.targetList.clear();
        if (!this.isCloseRange(layerInterface, anotherTargetDistance) && this.canInsertWaypoint(0, this.currentTargetLayerInterface)) {
            var geographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
            ;
            if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
            var waypoint = currentTargetLayerInterface = this.currentTargetLayerInterfacecurrentTargetLayerInterface;
            currentTargetLayerInterface.
                getWaypointBehavior().getWaypoint();
            ;
            var list = waypoint.getPathsListFromCacheOnly(geographicMapCellPosition);
            ;
            this.setWaypointPathsList(list);
            if (this.waypointPathsList == BasicArrayListUtil.getInstance().getImmutableInstance()) {
                this.targetWithoutCachedPathLayerInterface = this.currentTargetLayerInterface;
            }
            else if (this.waypointPathsList.size() != 0) {
                this.setTargetPath();
            }
        }
    }
    //@Throws(Exception.constructor)
    setTargetPath() {
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            if (this.currentTargetLayerInterface.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTargetPath(this.associatedAdvancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.KILL, BasicColorFactory.getInstance().ORANGE);
                this.clearTarget();
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
            if (this.currentTargetLayerInterface == this.waypointPathRunnable.getTargetLayer()) {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTargetPathIgnoreNewPath(this.associatedAdvancedRTSGameLayer, this);
                this.insertWaypoint(0, this.currentTargetLayerInterface);
                this.setRandomGeographicMapCellHistory(this.waypointPathsList);
            }
        }
    }
    //@Throws(Exception.constructor)
    setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList) {
        this.setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION);
        this.setNextUnvisitedPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION);
        super.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    }
    //@Throws(Exception.constructor)
    processWaypoint() {
        var size = this.targetList.size();
        ;
        if (size > 0) {
            var targetLayer = this.targetList.get(0);
            ;
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypoint(this.associatedAdvancedRTSGameLayer, this, targetLayer, size);
            if (targetLayer.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.WAYPOINT_DESTROYED_SHORT, BasicColorFactory.getInstance().YELLOW);
                this.removeWaypoint(targetLayer, GDWaypointBehavior2.WAYPOINT_DESTROYED);
            }
            else {
                var geographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
                ;
                if (geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return;
                }
                if (this.isTrackingWaypoint()) {
                    this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypointTracked(this.associatedAdvancedRTSGameLayer, this);
                    if (this.visitIfAtMidPoint(geographicMapCellPosition)) {
                        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypointTrackedVisit(this.associatedAdvancedRTSGameLayer, geographicMapCellPosition);
                    }
                    if (this.currentGeographicMapCellHistory.isAllVisited2() && this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
                        var oldWaypointLayer = this.currentTargetLayerInterface;
                        ;
                        oldWaypointLayer.getWaypointBehavior().getWaypoint().visit(this.associatedAdvancedRTSGameLayer);
                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.ALL_VISITED_SHORT, BasicColorFactory.getInstance().GREEN);
                        this.updatePathOnTargetMove(GDWaypointBehavior2._ALL_VISITED_SHORT);
                    }
                }
                else if (this.currentTargetLayerInterface == CollidableDestroyableDamageableLayer.getNullInstance() || this.waypointOverridesAttacking) {
                    var list = targetLayer.getWaypointBehavior().getWaypoint().getPathsListFromCacheOnly(geographicMapCellPosition);
                    ;
                    this.setWaypointPathsList(list);
                    if (this.waypointPathsList == BasicArrayListUtil.getInstance().getImmutableInstance()) {
                        this.waitingOnWaypointPath = true;
                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.THINKING, BasicColorFactory.getInstance().GREEN);
                        this.runWaypointPathTask(targetLayer);
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return;
                    }
                    this.setWaypointPath(targetLayer);
                }
            }
        }
    }
    //@Throws(Exception.constructor)
    wander() {
        if (this.currentGeographicMapCellHistory.isAllVisited2()) {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().wander(this.associatedAdvancedRTSGameLayer);
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.WANDERING, BasicColorFactory.getInstance().RED);
            this.wanderPathsList.clear();
            this.wanderPathsList.add(this.associatedAdvancedRTSGameLayer.getSurroundingGeographicMapCellPositionList());
            this.setRandomGeographicMapCellHistory(this.wanderPathsList);
        }
        this.visitIfAtMidPoint(this.getCurrentPathGeographicMapCellPosition());
        this.updateCurrentPathGeographicMapCellPosition();
        this.associatedAdvancedRTSGameLayer.trackTo(GDWaypointBehavior2.NEXT_PATH_NODE);
    }
    visitIfAtMidPoint(geographicMapCellPosition) {
        var unitLayer = this.associatedAdvancedRTSGameLayer;
        ;
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && this.nextUnvisitedPathGeographicMapCellPosition == geographicMapCellPosition) {
            var point = geographicMapCellPosition.getMidPoint();
            ;
            var afterNextPoint = this.afterNextUnvisitedPathGeographicMapCellPosition.getMidPoint();
            ;
            var beyondMidPoint = true;
            ;
            if (geographicMapCellPosition.getColumn() == this.afterNextUnvisitedPathGeographicMapCellPosition.getColumn()) {
            }
            else if (point.getX() < afterNextPoint.getX()) {
                if (unitLayer.getXP() + unitLayer.getHalfWidth() < point.getX()) {
                    beyondMidPoint = false;
                }
            }
            else {
                if (unitLayer.getXP() + unitLayer.getHalfWidth() > point.getX()) {
                    beyondMidPoint = false;
                }
            }
            if (geographicMapCellPosition.getRow() == this.afterNextUnvisitedPathGeographicMapCellPosition.getRow()) {
            }
            else if (point.getY() < afterNextPoint.getY()) {
                if (unitLayer.getYP() + unitLayer.getHalfHeight() < point.getY()) {
                    beyondMidPoint = false;
                }
            }
            else {
                if (unitLayer.getYP() + unitLayer.getHalfHeight() > point.getY()) {
                    beyondMidPoint = false;
                }
            }
            if (beyondMidPoint) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return this.currentGeographicMapCellHistory.visit(geographicMapCellPosition);
                ;
            }
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    processTargetList() {
        for (var index = this.getPossibleTargetList().size() - 1; index >= 0; index--) {
            var layerInterface = this.getPossibleTargetList().get(index);
            ;
            if (layerInterface.isDestroyed()) {
                this.getPossibleTargetList().remove(layerInterface);
            }
            else {
                this.onEnemyMovement(layerInterface);
            }
        }
        if (this.targetWithoutCachedPathLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.waitingOnTargetPath = true;
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.THINKING_ABOUT_TARGET, BasicColorFactory.getInstance().GREEN);
            this.runWaypointPathTask(this.currentTargetLayerInterface);
            this.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance();
        }
        this.getPossibleTargetList().clear();
    }
    //@Throws(Exception.constructor)
    processTargeting() {
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && (this.isInSensorRange(this.currentTargetLayerInterface, this.getCurrentTargetDistance()) || this.isTrackingWaypoint() || this.targetWithoutSensors)) {
            if (this.currentTargetLayerInterface.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().targetDestroyed(this.associatedAdvancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.KILL, BasicColorFactory.getInstance().ORANGE);
                this.clearTarget();
                //if statement needs to be on the same line and ternary does not work the same way.
                return;
            }
            var dx = 0;
            ;
            var dy = 0;
            ;
            var associatedAdvancedRTSGameLayer2 = this.associatedAdvancedRTSGameLayer;
            ;
            if (this.isTrackingWaypoint()) {
                this.updateCurrentPathGeographicMapCellPosition();
                var point = this.nextUnvisitedPathGeographicMapCellPosition.getMidPoint();
                ;
                var geographicMapCompositeInterface = associatedAdvancedRTSGameLayer2.allBinaryGameLayerManagerP;
                ;
                var geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];
                ;
                var tiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                ;
                dx = associatedAdvancedRTSGameLayer2.getXP() + associatedAdvancedRTSGameLayer2.getHalfWidth() - point.getX() + tiledLayer.getXP();
                dy = associatedAdvancedRTSGameLayer2.getYP() + associatedAdvancedRTSGameLayer2.getHalfHeight() - point.getY() + tiledLayer.getYP();
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processTargeting(this.associatedAdvancedRTSGameLayer, dx, dy);
            }
            else {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processTargetingNonWayPoint(this.associatedAdvancedRTSGameLayer, dx, dy);
                dx = (associatedAdvancedRTSGameLayer2.getXP() + associatedAdvancedRTSGameLayer2.getHalfWidth()) - (this.currentTargetLayerInterface.getXP() + this.currentTargetLayerInterface.getHalfWidth());
                dy = (associatedAdvancedRTSGameLayer2.getYP() + associatedAdvancedRTSGameLayer2.getHalfHeight()) - (this.currentTargetLayerInterface.getYP() + this.currentTargetLayerInterface.getHalfHeight());
            }
            this.associatedAdvancedRTSGameLayer.trackToDXY(dx, dy);
        }
        else {
            if (this.associatedAdvancedRTSGameLayer.isShowMoreCaptionStates()) {
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.STOP, BasicColorFactory.getInstance().YELLOW);
            }
            this.associatedAdvancedRTSGameLayer.allStop();
        }
    }
    //@Throws(Exception.constructor)
    updateCurrentPathGeographicMapCellPosition() {
        this.setLastPathGeographicMapCellPosition(this.getCurrentPathGeographicMapCellPosition());
        this.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition());
        this.setNextUnvisitedPathGeographicMapCellPosition(this.currentGeographicMapCellHistory.getFirstUnvisited());
        this.afterNextUnvisitedPathGeographicMapCellPosition = this.currentGeographicMapCellHistory.getAfterIfNotLast(this.nextUnvisitedPathGeographicMapCellPosition);
        if (this.getCurrentPathGeographicMapCellPosition() != this.nextUnvisitedPathGeographicMapCellPosition) {
            this.progressTimeDelayHelper.setStartTimeTNT();
        }
    }
    //@Throws(Exception.constructor)
    setWaypointPath(waypointLayer) {
        if (this.waypointPathsList.size() != 0) {
            this.setCurrentTargetLayerInterface(waypointLayer);
            this.setCurrentTargetDistance(MAX_VALUE());
            this.setRandomGeographicMapCellHistory(this.waypointPathsList);
        }
        else {
            waypointLayer.getWaypointBehavior().getWaypoint().visit(this.associatedAdvancedRTSGameLayer);
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(GDWaypointBehavior2.ALREADY_THERE_SHORT, BasicColorFactory.getInstance().YELLOW);
            this.updatePathOnTargetMove(GDWaypointBehavior2._ALREADY_THERE_SHORT);
        }
    }
    //@Throws(Exception.constructor)
    runWaypointPathTask(waypointLayer) {
        this.setWaypointPathsList(GDWaypointBehavior2.runningWaypointPathList);
        if (this.waypointPathRunnable.isRunning()) {
            throw new Exception("Should never be running here");
        }
        this.waypointPathRunnable.setRunning(true);
        this.waypointPathRunnable.setUnitLayer(this.associatedAdvancedRTSGameLayer);
        this.waypointPathRunnable.setTargetLayer(waypointLayer);
        this.pathFindingThreadPool.runTaskWithPriority(this.waypointPathRunnable);
    }
    //@Throws(Exception.constructor)
    removeWaypoint(waypointLayer, reason) {
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypoint(this.associatedAdvancedRTSGameLayer, this, waypointLayer, reason);
        this.targetList.remove(waypointLayer);
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypointList(this.associatedAdvancedRTSGameLayer, this, this.targetList);
        if (this.currentTargetLayerInterface == waypointLayer) {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypointClear(this.associatedAdvancedRTSGameLayer);
            this.clearTarget();
        }
    }
    //@Throws(Exception.constructor)
    clearTarget() {
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().clearTarget(this.associatedAdvancedRTSGameLayer);
        this.setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance());
        this.setTrackingWaypoint(false);
        this.setCurrentTargetDistance(MAX_VALUE());
        TrackingEventHandler.getInstance().fireEvent(this.associatedAdvancedRTSGameLayer.getTrackingEvent());
    }
    isWaypointListEmptyOrOnlyTargets() {
        var list = this.targetList;
        ;
        if (list.size() == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        for (var index = list.size() - 1; index >= 0; index--) {
            var layerInterface = list.get(index);
            ;
            if (layerInterface.isWaypointListEmptyOrOnlyTargets()) {
                //if statement needs to be on the same line and ternary does not work the same way.
                return false;
            }
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    isCloseRange(layerInterface, targetDistance) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return targetDistance < this.closeRange + layerInterface.getHalfHeight();
    }
    isInSensorRange(layerInterface, targetDistance) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return targetDistance < this.sensorRange + layerInterface.getHalfHeight();
    }
    getCurrentTargetingStateString() {
        var stringBuffer = new StringMaker();
        ;
        if (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            stringBuffer.append(GDWaypointBehavior2.TARGET_LAYER);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(this.currentTargetLayerInterface.getName());
            stringBuffer.append(" with");
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(GDWaypointBehavior2.TARGET_DISTANCE);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.appendint(this.getCurrentTargetDistance());
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuffer.toString();
        ;
    }
    //@Throws(Exception.constructor)
    addWaypointFromUser(advancedRTSGameLayer) {
        if (advancedRTSGameLayer.isDestroyed()) {
            throw new Exception("Trying to add a dead: " + advancedRTSGameLayer);
        }
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().addWaypointFromUser(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
        this.targetList.clear();
        this.targetList.add(advancedRTSGameLayer);
        this.clearTarget();
    }
    //@Throws(Exception.constructor)
    addBuildingChase(allbinaryLayer, cellPosition) {
        if (!this.buildingSteeringVisitor.getList().contains(allbinaryLayer)) {
            this.buildingSteeringVisitor.getList().add(allbinaryLayer);
            this.buildingSteeringVisitor.getPositionList().add(cellPosition);
        }
        if (!this.getSteeringVisitorList().contains(this.buildingSteeringVisitor)) {
            this.getSteeringVisitorList().add(this.buildingSteeringVisitor);
        }
    }
    //@Throws(Exception.constructor)
    buildingChase(allbinaryLayer, cellPosition) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.associatedAdvancedRTSGameLayer.buildingChase(allbinaryLayer, cellPosition);
        ;
    }
    getNextUnvisitedPathGeographicMapCellPosition() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.nextUnvisitedPathGeographicMapCellPosition;
    }
    setNextUnvisitedPathGeographicMapCellPosition(nextUnvisitedPathGeographicMapCellPosition) {
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setNextUnvisitedPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.nextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition);
        this.nextUnvisitedPathGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
    }
}
GDWaypointBehavior2.WANDERING = "Order?";
GDWaypointBehavior2.THINKING = "Thinking";
GDWaypointBehavior2.THINKING_ABOUT_TARGET = "Hmmm";
GDWaypointBehavior2.TARGET = "Target";
GDWaypointBehavior2.KILL = "Kill!";
GDWaypointBehavior2.STOP = "Stop";
GDWaypointBehavior2.WAYPOINT_DESTROYED_SHORT = "Uh Oh";
GDWaypointBehavior2.WAYPOINT_DESTROYED = "Waypoint Destroyed";
GDWaypointBehavior2.ALL_VISITED_SHORT = "Arrived";
GDWaypointBehavior2._ALL_VISITED_SHORT = " Arrived";
GDWaypointBehavior2.ALREADY_THERE_SHORT = "Again?";
GDWaypointBehavior2._ALREADY_THERE_SHORT = " Again?";
GDWaypointBehavior2.NEXT_PATH_NODE = "Next Path Node";
GDWaypointBehavior2.VISITED_MOST_OF_THE_PATH = " visited most of the path";
GDWaypointBehavior2.RETURNING_AS_WAYPOINT_PATH_LIST = " returning as waypointPathsList was runningWaypointPathList";
GDWaypointBehavior2.runningWaypointPathList = new BasicArrayListD();
GDWaypointBehavior2.TARGET_DISTANCE = "Target Distance";
GDWaypointBehavior2.TARGET_LAYER = "Target Layer";
