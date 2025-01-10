package org.allbinary.game.layer.waypoint;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.HTMLFeatureFactory;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.MultipassWaypointPathRunnable;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.SteeringVisitor;
import org.allbinary.game.layer.WaypointPathRunnable;
import org.allbinary.game.layer.WaypointPathRunnableBase;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.thread.PathFindingThreadPool;
import org.allbinary.thread.ThreadPool;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

public class GDWaypointBehavior2 
extends GDWaypointBehavior
{
    private final LayerDistanceUtil layerDistanceUtil = LayerDistanceUtil.getInstance();
    private final ThreadPool pathFindingThreadPool = PathFindingThreadPool.getInstance();

    private final boolean targetWithoutSensors = true;
    
    private int sensorRange = 0;
    private int closeRange = 0;
    
    private final TimeDelayHelper progressTimeDelayHelper;
    
    protected GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition;
    private GeographicMapCellPosition afterNextUnvisitedPathGeographicMapCellPosition;
    
    private final BasicArrayList wanderPathsList;
    
    private final WaypointPathRunnableBase waypointPathRunnable;
    
    private boolean waitingOnTargetPath;
    private boolean waitingOnWaypointPath;
    
    private CollidableDestroyableDamageableLayer targetWithoutCachedPathLayerInterface;

    private static final String WANDERING = "Order?"; //"Lalala" //"What Now? //"Wander";
    private static final String THINKING = "Thinking";
    private static final String THINKING_ABOUT_TARGET = "Hmmm"; //"Analyzing" //"Hmmm?"
    private static final String TARGET = "Target";
    private static final String KILL = "Kill!";
    private static final String STOP = "Stop";

    private static final String WAYPOINT_DESTROYED_SHORT = "Uh Oh";
    private static final String WAYPOINT_DESTROYED = "Waypoint Destroyed";
    private static final String ALL_VISITED_SHORT = "Arrived";
    private static final String _ALL_VISITED_SHORT = " Arrived";
    private static final String ALL_VISITED = "All Visited";
    private static final String ALREADY_THERE_SHORT = "Again?";
    private static final String _ALREADY_THERE_SHORT = " Again?";
    private static final String ALREADY_THERE = "Already There";
    private static final String NEXT_PATH_NODE = "Next Path Node";

    private static final String VISITED_MOST_OF_THE_PATH = " visited most of the path";
    private static final String RETURNING_AS_WAYPOINT_PATH_LIST = " returning as waypointPathsList was runningWaypointPathList";
    
    public GDWaypointBehavior2(
            final PathFindingLayerInterface ownerAdvancedRTSGameLayer,
            final CollidableDestroyableDamageableLayer fakeWaypoint)
    throws Exception
    {
        super(ownerAdvancedRTSGameLayer, fakeWaypoint);
        
        this.progressTimeDelayHelper = new TimeDelayHelper(5000);
        
        this.wanderPathsList = new BasicArrayList();
        
        final Features features = Features.getInstance();
        final boolean isHTML = features.isDefault(HTMLFeatureFactory.getInstance().HTML);

        this.waypointPathRunnable = 
            isHTML ? new MultipassWaypointPathRunnable() : 
            new WaypointPathRunnable();
        
    }
    
    protected void initRange(int weaponRange)
    {
        super.initRange(weaponRange);
        
        this.closeRange = weaponRange;
            //this.getOwnerAdvancedRTSGameLayer().geographicMapInterface.getAllBinaryTiledLayer().getCellHeight() * 3 / 2;
        
        this.sensorRange = weaponRange * 4;
        
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().initRange(this.associatedAdvancedRTSGameLayer,  this.closeRange, this.sensorRange);
    }
    
    public boolean isRunning() {
        if (this.waypointPathRunnable.isRunning()) {
            return true;
        } else {
            return false;
        }
    }
    
    //this could become somewhat event driven with a seperate waypoint processor
    //making it more performant and less polling like
    public void processTick(final AllBinaryLayerManager allBinaryLayerManager)
    throws Exception
    {
        if(this.waypointPathsList == BasicArrayListUtil.getInstance().getImmutableInstance()) {
            return;
        }

        if(this.currentTargetLayerInterface != null && this.getCurrentGeographicMapCellHistory().getTotalVisited() > this.getCurrentGeographicMapCellHistory().getTotalNotVisited()) {
            this.updatePathOnTargetMove(VISITED_MOST_OF_THE_PATH);
        }
        
        if (this.waypointPathRunnable.isRunning())
        {
            //thread is done
            if (waypointPathsList != runningWaypointPathList)
            {
                this.waypointPathRunnable.setRunning(false);

                if (this.waitingOnTargetPath)
                {
                    this.setTargetPath();
                }
                else if (this.waitingOnWaypointPath)
                {
                    //TWBAdvancedRTSGameLayer
                    this.setWaypointPath(this.waypointPathRunnable.getTargetLayer());
                }
                else
                {
                    throw new Exception("Should not happen");
                }
            }
            else
            {
                //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(reason).toString(), this, GameStrings.getInstance().PROCESS_TICK));
                this.updatePathOnTargetMove(RETURNING_AS_WAYPOINT_PATH_LIST);
                return;
            }
        }

        this.processTargetList();

        if (!this.waypointPathRunnable.isRunning())
        {
            this.processWaypoint();
        }
        else
        {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(" returning without waypoint processing").toString(), this, GameStrings.getInstance().PROCESS_TICK));
            return;
        }

        if (!this.waypointPathRunnable.isRunning())
        {
            this.processTargeting();
        }
        else
        {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(" returning without targeting processing").toString(), this, GameStrings.getInstance().PROCESS_TICK));
            return;
        }

        if (!this.waypointPathRunnable.isRunning())
        {
            this.teleportIfNoProgress();
        }
        else
        {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(" returning without teleport processing").toString(), this, GameStrings.getInstance().PROCESS_TICK));
            return;
        }
    }
    
    private void onEnemyMovement(PathFindingLayerInterface layerInterface)
        throws Exception
    {
        /*
        if(this.getOwnerAdvancedRTSGameLayer().isSelected())
        {
            LogUtil.put(LogFactory.getInstance(
                    "Enemy Possible Target: " + layerInterface.getName(), this, 
                    "selected: onEnemyMovement"));                    
        }
        */

        final int anotherTargetDistance = layerDistanceUtil.getDistance(
                (CollidableDestroyableDamageableLayer) this.associatedAdvancedRTSGameLayer,
                (CollidableDestroyableDamageableLayer) layerInterface);

        // String destroyedTarget = NULL;
        // if (this.currentTargetLayerInterface != null)
        // {
        // destroyedTarget =
        // Boolean.toString(this.currentTargetLayerInterface.isDestroyed());
        // }

        // LogUtil.put(LogFactory.getInstance(
        // "Weapons Range: " + this.hackRange +
        // " anotherTargetDistance: " + anotherTargetDistance +
        // getCurrentTargetingStateString(),
        // this, "onMovementFound"));

        // Update Distance Of Current Target
        if (layerInterface == this.currentTargetLayerInterface)
        {
            this.setCurrentTargetDistance(anotherTargetDistance);
        }
        // Not tracking
        else
        {
            this.processPossibleTarget(layerInterface, anotherTargetDistance);
        }
    }

    private void processPossibleTarget(final PathFindingLayerInterface layerInterface, final int anotherTargetDistance) throws Exception
    {
        boolean isShorterThanCurrentTargetDistance = 
            this.getCurrentTargetDistance() > anotherTargetDistance;
            
        boolean isCurrentTargetDestroyed = 
            this.currentTargetLayerInterface != null && this.currentTargetLayerInterface.isDestroyed();

        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed);

        if (this.isWaypointListEmptyOrOnlyTargets()
                && this.isInSensorRange((CollidableDestroyableDamageableLayer) layerInterface, anotherTargetDistance) &&
                // and Found Closer target
                (isShorterThanCurrentTargetDistance ||
                // or
                // and Change Target if Target Dead
                        isCurrentTargetDestroyed))
        {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);

            this.setTarget(layerInterface, anotherTargetDistance);
        }
        // Really close target go for it
        // else if (this.currentTargetDistance < this.longWeaponRange + 10 //&&
        // this.attackCloseTargetsRegardless
        else if (this.isCloseRange((CollidableDestroyableDamageableLayer) layerInterface, anotherTargetDistance) &&
                (isShorterThanCurrentTargetDistance ||
                        // or
                        // and Change Target if Target Dead
                 isCurrentTargetDestroyed))
        {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processPossibleTargetCloser(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
            
            this.setTarget(layerInterface, anotherTargetDistance);
        }
        //else
          //  if(this.getOwnerAdvancedRTSGameLayer().isTakingDamage())
        //{
            
        //}
    }
    
    private void teleportIfNoProgress()
        throws Exception
    {
        if (this.isTrackingWaypoint() //|| 
                //this.associatedAdvancedRTSGameLayer.getParentLayer().isDestroyed()
            )
        {
            //If not progressing move to next position
            if (this.progressTimeDelayHelper.isTime() && 
                    this.nextUnvisitedPathGeographicMapCellPosition != null)
            {
                this.associatedAdvancedRTSGameLayer.teleportTo(
                        this.nextUnvisitedPathGeographicMapCellPosition);
            }

            //If path taking a long time then
            if (this.getCompleteTimeDelayHelper().isTime())
            {
                final GeographicMapCellPosition geographicMapCellPosition =
                    (GeographicMapCellPosition) this.currentGeographicMapCellHistory.getTracked().get(
                    this.currentGeographicMapCellHistory.getSize() - 1);

                this.associatedAdvancedRTSGameLayer.teleportTo(geographicMapCellPosition);
            }
        }
    }

    //private static final String UPDATE_PATH_ON_TARGET_MOVE = "updatePathOnTargetMove";
    public void updatePathOnTargetMove(final String reason) throws Exception {
        
        final CollidableDestroyableDamageableLayer currentTargetLayerInterface = this.currentTargetLayerInterface;
        if (currentTargetLayerInterface != null) {
            final GeographicMapCellPosition geographicMapCellPosition = ((PathFindingLayerInterface) currentTargetLayerInterface).getCurrentGeographicMapCellPosition();

            if (geographicMapCellPosition == null) {
                return;
            }

            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(" - retarget? ").append(this.currentTargetGeographicMapCellPosition).append(' ').append(geographicMapCellPosition).toString(), this, UPDATE_PATH_ON_TARGET_MOVE));
            if (this.currentTargetGeographicMapCellPosition != geographicMapCellPosition) {
                //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(reason).toString(), this, UPDATE_PATH_ON_TARGET_MOVE));

                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().targetMovedSoRetarget(this.associatedAdvancedRTSGameLayer);
                this.setWaypointPathsList(BasicArrayListUtil.getInstance().getImmutableInstance());
                this.setTarget((PathFindingLayerInterface) currentTargetLayerInterface);
            } else {
                //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.associatedAdvancedRTSGameLayer.getName()).append(" - target has not moved").toString(), this, UPDATE_PATH_ON_TARGET_MOVE));
            }
        } else {
            throw new RuntimeException();
        }
        
    }
    
    public void setTarget(final PathFindingLayerInterface layerInterface)
        throws Exception
    {
        final int anotherTargetDistance = layerDistanceUtil.getDistance(
            (AllBinaryLayer) this.associatedAdvancedRTSGameLayer, (AllBinaryLayer) layerInterface);
        
        this.setTarget(layerInterface, anotherTargetDistance);
    }
    
    public void setTarget(final PathFindingLayerInterface layerInterface, final int anotherTargetDistance)
        throws Exception
    {
        
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);

        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(TARGET, BasicColorFactory.getInstance().GREEN);
        //Drop load when going after target
        this.associatedAdvancedRTSGameLayer.setLoad((short) 0);

        //Set target for pathfinding or chasing
        this.setCurrentTargetDistance(anotherTargetDistance);
        this.setCurrentTargetLayerInterface((CollidableDestroyableDamageableLayer) layerInterface);
        this.setTrackingWaypoint(false);

        //Hmm one target at a time
        this.targetList.clear();

        if (!this.isCloseRange((CollidableDestroyableDamageableLayer) layerInterface, anotherTargetDistance) &&
            this.canInsertWaypoint(0, this.currentTargetLayerInterface))
        {
            final GeographicMapCellPosition geographicMapCellPosition =
                associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();

            if (geographicMapCellPosition == null) {
                return;
            }
            
            final WaypointBase waypoint = ((PathFindingLayerInterface) 
                this.currentTargetLayerInterface).getWaypointBehavior().getWaypoint();
            
            final BasicArrayList list = 
                waypoint.getPathsListFromCacheOnly(geographicMapCellPosition);
                
            //"waypointPathsList: " + list, this);
            this.setWaypointPathsList(list);

            if (this.waypointPathsList == null)
            {
                this.targetWithoutCachedPathLayerInterface =
                    this.currentTargetLayerInterface;
            }
            else if (this.waypointPathsList.size() != 0)
            {
                this.setTargetPath();
            }
        }
        // LogUtil.put(LogFactory.getInstance("Weapons Range: " +
        // this.longWeaponRange + 
        //getCurrentTargetingStateString(), 
        //this, "onMovementFound"));
    }

    private void setTargetPath()
        throws Exception
    {
        if(this.currentTargetLayerInterface != null)
        {
            if(this.currentTargetLayerInterface.isDestroyed())
            {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTargetPath(this.associatedAdvancedRTSGameLayer);
                
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                        KILL, BasicColorFactory.getInstance().ORANGE);
                
                this.clearTarget();
                return;
            }
            
            // Ignore new path if target changed - this shouldn't happen but?
            if (this.currentTargetLayerInterface == this.waypointPathRunnable.getTargetLayer())
            {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().setTargetPath(this.associatedAdvancedRTSGameLayer, this);
                
                this.insertWaypoint(0, this.currentTargetLayerInterface);
                this.setRandomGeographicMapCellHistory(this.waypointPathsList);
            }

        }

    }
     
    protected void setGeographicMapCellHistoryPath(
            final BasicArrayList geographicMapCellPositionBasicArrayList)
            throws Exception
    {
        this.setCurrentPathGeographicMapCellPosition(null);
        this.setNextUnvisitedPathGeographicMapCellPosition(null);
        
        super.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    }
    
    private void processWaypoint() throws Exception
    {
        final int size = this.targetList.size();

        if (size > 0)
        {
            final PathFindingLayerInterface targetLayer =
                (PathFindingLayerInterface) this.targetList.get(0);

            //
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypoint(this.associatedAdvancedRTSGameLayer, this, targetLayer, size);

            // If waypoint was destroyed
            if (targetLayer.isDestroyed())
            {
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                        WAYPOINT_DESTROYED_SHORT, BasicColorFactory.getInstance().YELLOW);
                this.removeWaypoint(targetLayer, WAYPOINT_DESTROYED);
            }
            else
            // If at waypoint remove it
            /*
             * //Cheaper to use CellHistory isAllVisited if
             * (waypointLayer.isCollision(this)) {
             * this.removeWaypoint(waypointLayer, "Reached Waypoint"); } else
             */
            {
                final GeographicMapCellPosition geographicMapCellPosition =
                    this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();

                if (geographicMapCellPosition == null) {
                    return;
                }
                
                if (this.isTrackingWaypoint())
                {
                    //
                    this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypointTracked(this.associatedAdvancedRTSGameLayer, this);

                    if (this.visitIfAtMidPoint(geographicMapCellPosition))
                    {
                        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processWaypointTracked(this.associatedAdvancedRTSGameLayer, geographicMapCellPosition);
                    }

                    if (this.currentGeographicMapCellHistory.isAllVisited2() &&
                        this.currentTargetLayerInterface != null)
                    {
                        final PathFindingLayerInterface oldWaypointLayer = (PathFindingLayerInterface)
                            this.currentTargetLayerInterface;

                        // Get next waypoint if any
                        oldWaypointLayer.getWaypointBehavior().getWaypoint().visit(
                                this.associatedAdvancedRTSGameLayer);

                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                                ALL_VISITED_SHORT, BasicColorFactory.getInstance().GREEN);
                        
                        this.updatePathOnTargetMove(_ALL_VISITED_SHORT);
                        //this.removeWaypoint((PathFindingLayerInterface) this.currentTargetLayerInterface, ALL_VISITED);
                    }
                }
                else // If close to waypoint and not getting closer then
                // A. As close as your going to get
                // B. Having a pathfinding issue
                // either way you should remove the waypoint
                // this.removeWaypoint(waypointLayer);
                // Otherwise Move towards waypoint
                // If currentlyTargeting enemy then check priority
                if (this.currentTargetLayerInterface == null ||
                    this.waypointOverridesAttacking)
                {
                    final BasicArrayList list = targetLayer.getWaypointBehavior().getWaypoint().getPathsListFromCacheOnly(geographicMapCellPosition);
                    //"waypointPathsList2: " + list, this);
                    this.setWaypointPathsList(list);
                    
                    if (this.waypointPathsList == null)
                    {
                        this.waitingOnWaypointPath = true;

                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                                THINKING, BasicColorFactory.getInstance().GREEN);

                        this.runWaypointPathTask(targetLayer);

                        return;
                    }

                    //BasicArrayList waypointPathsList =
                    //  waypointLayer.getWaypoint().getPathsList(
                    //geographicMapCellPosition);

                    this.setWaypointPath(targetLayer);
                }

                // If out of waypoints and without target then check sensors
                /*
                if (this.currentTargetLayerInterface == null &&
                this.getWaypointList().size() == 0)
                {
                LogUtil.put(LogFactory.getInstance(
                "No Waypoints or Target", this, "processWaypoint"));
                }
                 */
            }
        }
    }

    private void wander() throws Exception
    {
        if (this.currentGeographicMapCellHistory.isAllVisited2())
        {
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().wander(this.associatedAdvancedRTSGameLayer);
            
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                    WANDERING, BasicColorFactory.getInstance().RED);

            wanderPathsList.clear();

            wanderPathsList.add(this.associatedAdvancedRTSGameLayer.getSurroundingGeographicMapCellPositionList());

            this.setRandomGeographicMapCellHistory(wanderPathsList);
        }

        this.visitIfAtMidPoint(this.getCurrentPathGeographicMapCellPosition());

        this.updateCurrentPathGeographicMapCellPosition();

        this.associatedAdvancedRTSGameLayer.trackTo(NEXT_PATH_NODE);
    }

    private boolean visitIfAtMidPoint(final GeographicMapCellPosition geographicMapCellPosition) {

        final CollidableDestroyableDamageableLayer unitLayer = (CollidableDestroyableDamageableLayer) this.associatedAdvancedRTSGameLayer;
        
        if(geographicMapCellPosition != null && this.nextUnvisitedPathGeographicMapCellPosition == geographicMapCellPosition) {
            final GPoint point = geographicMapCellPosition.getMidPoint();
            final GPoint afterNextPoint = this.afterNextUnvisitedPathGeographicMapCellPosition.getMidPoint();

            boolean beyondMidPoint = true;
            if(geographicMapCellPosition.getColumn() == this.afterNextUnvisitedPathGeographicMapCellPosition.getColumn()) {
                
            } else if(point.getX() < afterNextPoint.getX()) {
                if (unitLayer.getX() + unitLayer.getHalfWidth() < point.getX()) {
                    beyondMidPoint = false;
                }
            } else {
                if (unitLayer.getX() + unitLayer.getHalfWidth() > point.getX()) {
                    beyondMidPoint = false;
                }
            }
            
            if(geographicMapCellPosition.getRow() == this.afterNextUnvisitedPathGeographicMapCellPosition.getRow()) {
                
            } else if(point.getY() < afterNextPoint.getY()) {
                if (unitLayer.getY() + unitLayer.getHalfHeight() < point.getY()) {
                    beyondMidPoint = false;
                }
            } else {
                if (unitLayer.getY() + unitLayer.getHalfHeight() > point.getY()) {
                    beyondMidPoint = false;
                }
            }
            
            if (beyondMidPoint) {
                return this.currentGeographicMapCellHistory.visit(geographicMapCellPosition);
            }
        }
        
        return false;
    }
    
    // private final BasicArrayList midWaypointlist = new BasicArrayList();
    // Insert Mid waypoints to get around buildings or move out of build area
    // Use collide to keep away from units
    /*
     * private void processMidWaypoints() throws Exception {
     * this.geographicMapCellPositionArea.update();
     * 
     * BasicArrayList occupyingList =this.geographicMapCellPositionArea.
     * getOccupyingGeographicMapCellPositionList();
     * 
     * GeographicMapCellPosition geographicMapCellPosition =
     * (GeographicMapCellPosition) occupyingList.get(0);
     * 
     * if (DropCellPositionHistory.getInstance().isCellPositionWithDrop(
     * geographicMapCellPosition)) { //Add Waypoint to empty position
     * BasicArrayList surroundingGeographicMapCellPositionList =
     * CellPositionUtil.getAllSurrounding( this.geographicMapInterface,
     * this
     * .geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList
     * (), midWaypointlist);
     * 
     * if(surroundingGeographicMapCellPositionList.size() > 0) {
     * GeographicMapCellPosition emptyGeographicMapCellPosition =
     * (GeographicMapCellPosition)
     * surroundingGeographicMapCellPositionList.get(0);
     * 
     * LogUtil.put(LogFactory.getInstance( "Inserting Waypoint: " +
     * emptyGeographicMapCellPosition, this, "processMidWaypoint"));
     * 
     * GPoint point = emptyGeographicMapCellPosition.getPoint();
     * 
     * this.OUT_OF_BUILDING_WAYPOINT.setPosition( point.getX().intValue(),
     * point.getY().intValue());
     * 
     * this.getPathIdList().add(0, this.OUT_OF_BUILDING_WAYPOINT); } else {
     * //This is very bad. Stuck in a building how?
     * LogUtil.put(LogFactory.getInstance
     * ("Should Not Happen unless buildings get bigger", this,
     * "processMidWaypoint")); } } else if (this.isMoving) { int angle =
     * this.getRotationAnimationInterface().getAngleInfo().getAngle();
     * 
     * //goingTowardsGeographicMapCellPosition
     * //DropCellPositionHistory.getInstance().isCellPositionWithDrop(
     * //goingTowardsGeographicMapCellPosition) //Add Waypoint to get around
     * building //this.getWaypointList().add(); } }
     */
    private void processTargetList()
        throws Exception
    {
        //this.targetWithoutCachedPathLayerInterface = null;

        for (int index = this.getPossibleTargetList().size() - 1; index >= 0; index--)
        {
            final PathFindingLayerInterface layerInterface = 
                (PathFindingLayerInterface) 
                this.getPossibleTargetList().get(index);

            //Remove Destroyed targets
            if(layerInterface.isDestroyed())
            {
                this.getPossibleTargetList().remove(layerInterface);
            }
            else
            {
                this.onEnemyMovement(layerInterface);
            }
        }

        //TWB - I don't think this is called currently
        if (this.targetWithoutCachedPathLayerInterface != null)
        {
            this.waitingOnTargetPath = true;

            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                    THINKING_ABOUT_TARGET, BasicColorFactory.getInstance().GREEN);
                        
            //TWBAdvancedRTSGameLayer
            this.runWaypointPathTask(
                (PathFindingLayerInterface) this.currentTargetLayerInterface);
            
            this.targetWithoutCachedPathLayerInterface = null;
        }

        this.getPossibleTargetList().clear();
    }
    
    private void processTargeting() throws Exception
    {
        
        if (this.currentTargetLayerInterface != null &&
            (this.isInSensorRange(this.currentTargetLayerInterface, this.getCurrentTargetDistance()) ||
            this.isTrackingWaypoint() || targetWithoutSensors))
        {
            
            /*
            if(this.getOwnerAdvancedRTSGameLayer().isSelected())
            {
                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "selected: processTargeting"));
            }
            */
            
            if (this.currentTargetLayerInterface.isDestroyed())
            {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().targetDestroyed(this.associatedAdvancedRTSGameLayer);
                
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                        KILL, BasicColorFactory.getInstance().ORANGE);
                
                this.clearTarget();
                return;
            }

            // If current target is waypoint then follow path therwise target
            // layer

            //int dx = getOwnerAdvancedRTSGameLayer().getX() - this.currentTargetLayerInterface.getX();
            //int dy = getOwnerAdvancedRTSGameLayer().getY() - this.currentTargetLayerInterface.getY();

            int dx = 0;
            int dy = 0;
            
            final CollidableDestroyableDamageableLayer associatedAdvancedRTSGameLayer2 = (CollidableDestroyableDamageableLayer) associatedAdvancedRTSGameLayer;
            if (this.isTrackingWaypoint())
            {
                this.updateCurrentPathGeographicMapCellPosition();

                final GPoint point = this.nextUnvisitedPathGeographicMapCellPosition.getMidPoint();
                
                final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) associatedAdvancedRTSGameLayer2.allBinaryGameLayerManager;
                final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];
                final AllBinaryTiledLayer tiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                        
                dx = associatedAdvancedRTSGameLayer2.getX() + associatedAdvancedRTSGameLayer2.getHalfWidth() - point.getX() + tiledLayer.getX();
                dy = associatedAdvancedRTSGameLayer2.getY() + associatedAdvancedRTSGameLayer2.getHalfHeight() - point.getY() + tiledLayer.getY();
                
                //
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processTargeting(this.associatedAdvancedRTSGameLayer, dx, dy);
            }
            else
            {
                this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().processTargetingNonWayPoint(this.associatedAdvancedRTSGameLayer, dx, dy);

                dx = (associatedAdvancedRTSGameLayer2.getX() +
                        associatedAdvancedRTSGameLayer2.getHalfWidth()) -
                    (this.currentTargetLayerInterface.getX() +
                            this.currentTargetLayerInterface.getHalfWidth());
                dy = (associatedAdvancedRTSGameLayer2.getY() + 
                        associatedAdvancedRTSGameLayer2.getHalfHeight())-
                    (this.currentTargetLayerInterface.getY() +
                    this.currentTargetLayerInterface.getHalfHeight());
            }

            this.associatedAdvancedRTSGameLayer.trackTo(dx, dy);
        }
        else
        {
            // If owner is dead then track and move
//            if (this.associatedAdvancedRTSGameLayer.getParentLayer().isDestroyed())
//            {
//                this.wander();
//            }
//            else
//            {
                if(this.associatedAdvancedRTSGameLayer.isShowMoreCaptionStates())
                {
                    this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                            STOP, BasicColorFactory.getInstance().YELLOW);
                }
                this.associatedAdvancedRTSGameLayer.allStop();
//            }
        }
    }

    private void updateCurrentPathGeographicMapCellPosition() throws Exception
    {
        this.setLastPathGeographicMapCellPosition(this.getCurrentPathGeographicMapCellPosition());

        //this.setCurrentPathGeographicMapCellPosition(this.nextUnvisitedPathGeographicMapCellPosition);
        this.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition());

        this.setNextUnvisitedPathGeographicMapCellPosition(this.currentGeographicMapCellHistory.getFirstUnvisited());
        this.afterNextUnvisitedPathGeographicMapCellPosition = 
            this.currentGeographicMapCellHistory.getAfterIfNotLast(this.nextUnvisitedPathGeographicMapCellPosition);

        if (this.getCurrentPathGeographicMapCellPosition() != this.nextUnvisitedPathGeographicMapCellPosition)
        {
            this.progressTimeDelayHelper.setStartTime();
        }
    }
    
    private void setWaypointPath(final PathFindingLayerInterface waypointLayer)
        throws Exception
    {
        if (waypointPathsList.size() != 0)
        {
            this.setCurrentTargetLayerInterface((CollidableDestroyableDamageableLayer) waypointLayer);
            this.setCurrentTargetDistance(Integer.MAX_VALUE);

            this.setRandomGeographicMapCellHistory(waypointPathsList);
        }
        else
        {
            // Get next waypoint
            waypointLayer.getWaypointBehavior().getWaypoint().visit(
                    this.associatedAdvancedRTSGameLayer);

            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                    ALREADY_THERE_SHORT, BasicColorFactory.getInstance().YELLOW);
            
            this.updatePathOnTargetMove(_ALREADY_THERE_SHORT);
            //this.removeWaypoint(waypointLayer, ALREADY_THERE);
        }
    }
    private static final BasicArrayList runningWaypointPathList = new BasicArrayList();
    
    //private final String RUN_WAYPOINT_PATH_TASK = "runWaypointPathTask";
    
    private void runWaypointPathTask(
        final PathFindingLayerInterface waypointLayer)
        throws Exception
    {
        setWaypointPathsList(runningWaypointPathList);

        if (this.waypointPathRunnable.isRunning())
        {
            throw new Exception("Should never be running here");
        }
        
        this.waypointPathRunnable.setRunning(true);
        this.waypointPathRunnable.setUnitLayer(this.associatedAdvancedRTSGameLayer);
        this.waypointPathRunnable.setTargetLayer(waypointLayer);

        this.pathFindingThreadPool.runTaskWithPriority(this.waypointPathRunnable);

    }

    private void removeWaypoint(final PathFindingLayerInterface waypointLayer, final String reason) throws Exception
    {
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypoint(this.associatedAdvancedRTSGameLayer, this, waypointLayer, reason);

        this.targetList.remove(waypointLayer);

        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypoint(this.associatedAdvancedRTSGameLayer, this, this.targetList);
        
        if (this.currentTargetLayerInterface == waypointLayer)
        {
            
            this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().removeWaypointClear(this.associatedAdvancedRTSGameLayer);
            
            this.clearTarget();
        }
    }
    
    public void clearTarget() throws Exception
    {
        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().clearTarget(this.associatedAdvancedRTSGameLayer);

//        this.currentGeographicMapCellHistory.init();
//        this.setCurrentPathGeographicMapCellPosition(null);
//        this.setNextUnvisitedPathGeographicMapCellPosition(null);
//        this.waitingOnWaypointPath = false;
        
        //this.waypointPathsList = BasicArrayListUtil.getImmutableInstance();
        this.setCurrentTargetLayerInterface(null);
        this.setTrackingWaypoint(false);
        this.setCurrentTargetDistance(Integer.MAX_VALUE);
        TrackingEventHandler.getInstance().fireEvent(
                this.associatedAdvancedRTSGameLayer.getTrackingEvent());
    }

    //Returns true if no waypoints or only targets in list
    //Only public for logging
    public boolean isWaypointListEmptyOrOnlyTargets()
    {
        final BasicArrayList list = this.targetList;
        if (list.size() == 0)
        {
            //LogUtil.put(LogFactory.getInstance("No Waypoints", this, "isWaypointListEmptyOrOnlyTargets"));

            return true;
        }

        for (int index = list.size() - 1; index >= 0; index--)
        {
            final PathFindingLayerInterface layerInterface =
                (PathFindingLayerInterface) list.get(index);

            if (layerInterface.isWaypointListEmptyOrOnlyTargets())
            {
                return false;
            }
        }
        //LogUtil.put(LogFactory.getInstance("All Waypoints Targets/Units", this, "isWaypointListEmptyOrOnlyTargets"));
        return true;
    }
        
    private boolean isCloseRange(final CollidableDestroyableDamageableLayer layerInterface, final int targetDistance)
    {
        return targetDistance < this.closeRange + layerInterface.getHalfHeight();
    }

    public boolean isInSensorRange(final CollidableDestroyableDamageableLayer layerInterface, final int targetDistance)
    {
        return targetDistance < this.sensorRange + layerInterface.getHalfHeight();
    }

    private static final String TARGET_DISTANCE = "Target Distance";
    private static final String TARGET_LAYER = "Target Layer";

    public String getCurrentTargetingStateString()
    {
        final StringMaker stringBuffer = new StringMaker();

        if (this.currentTargetLayerInterface != null)
        {
            stringBuffer.append(TARGET_LAYER);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(this.currentTargetLayerInterface.getName());

            stringBuffer.append(" with");
            stringBuffer.append(CommonSeps.getInstance().SPACE);

            stringBuffer.append(TARGET_DISTANCE);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(getCurrentTargetDistance());
        }

        return stringBuffer.toString();
    }
    
    protected void addWaypointFromUser(final PathFindingLayerInterface advancedRTSGameLayer)
    throws Exception
    {
        if (advancedRTSGameLayer.isDestroyed())
        {
            throw new Exception("Trying to add a dead: " + advancedRTSGameLayer);
        }

        this.associatedAdvancedRTSGameLayer.getWaypoint2LogHelper().addWaypointFromUser(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);

        // clear waypoints and use player created waypoint
        this.targetList.clear();
        this.targetList.add(advancedRTSGameLayer);

        // must be reassigned to building to follow buildings order/waypoint
        this.clearTarget();
    }
    
    private class BuildingSteeringVisitor extends SteeringVisitor
    {
        private final BasicArrayList positionList = new BasicArrayList();
        
        public Object visit(Object object)
        {
            try
            {
                if (this.getList().size() > 0) {
                    //LogUtil.put(LogFactory.getInstance("steering", this, "visit"));

                    final AllBinaryLayer allbinaryLayer = (AllBinaryLayer) this.getList().get(0);

                    final GeographicMapCellPosition cellPosition
                            = (GeographicMapCellPosition) this.getPositionList().get(0);

                    final boolean clear = GDWaypointBehavior2.this.buildingChase(
                            allbinaryLayer, cellPosition);

                    if (clear) {
                        this.getList().clear();
                        this.positionList.clear();
                        return null;
                    }
                    return Boolean.FALSE;
                }
                return null;
            }
            catch(Exception e)
            {
                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "visit", e));
                return null;
            }
        }

        public BasicArrayList getPositionList()
        {
            return positionList;
        }
    }
    
    private final BuildingSteeringVisitor buildingSteeringVisitor = 
        new BuildingSteeringVisitor();

    public void addBuildingChase(
            final AllBinaryLayer allbinaryLayer, final GeographicMapCellPosition cellPosition)
    throws Exception
    {
        //chase mode
        if(!this.buildingSteeringVisitor.getList().contains(allbinaryLayer))
        {
            this.buildingSteeringVisitor.getList().add(allbinaryLayer);
            this.buildingSteeringVisitor.getPositionList().add(cellPosition);
        }

        if(!this.getSteeringVisitorList().contains(this.buildingSteeringVisitor))
        {
            this.getSteeringVisitorList().add(this.buildingSteeringVisitor);
        }
    }

    //Follow building wall
    private boolean buildingChase(
            final AllBinaryLayer allbinaryLayer, final GeographicMapCellPosition cellPosition)
    throws Exception
    {
        return this.associatedAdvancedRTSGameLayer.buildingChase(allbinaryLayer, cellPosition);
    }

    public GeographicMapCellPosition getNextUnvisitedPathGeographicMapCellPosition() {
        return nextUnvisitedPathGeographicMapCellPosition;
    }
    
    public void setNextUnvisitedPathGeographicMapCellPosition(final GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition) {
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setNextUnvisitedPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.nextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition);
        this.nextUnvisitedPathGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
    }
}
