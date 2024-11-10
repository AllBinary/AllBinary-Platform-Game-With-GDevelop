package org.allbinary.game.layer.waypoint;

import org.allbinary.game.input.form.PrimaryWaypointHelper;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.SensorAction;
import org.allbinary.game.layer.SensorActionFactory;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

public class GDWaypointBehavior 
    extends WaypointBehaviorBase
    implements WaypointEventListenerInterface
{    
    private int longWeaponRange = 0;
    
    private SensorAction sensorAction = SensorActionFactory.getInstance().ATTACK;

    private final TimeDelayHelper completeTimeDelayHelper;
    
    private GeographicMapCellHistory currentGeographicMapCellHistory;
    
    private GeographicMapCellPosition lastPathGeographicMapCellPosition;
    private GeographicMapCellPosition currentPathGeographicMapCellPosition;

    private final CollidableDestroyableDamageableLayer FAKE_WAYPOINT_LAYER;
    
    private final BasicArrayList targetList;

    private boolean moving = false;
    private boolean movingFromStopped = false;
    private BasicArrayList waypointPathsList;
    
    private final BasicArrayList possibleTargetList;
    
    private int currentTargetDistance = Integer.MAX_VALUE;
    protected CollidableDestroyableDamageableLayer currentTargetLayerInterface;
    
    private boolean trackingWaypoint;
    
    protected final PathFindingLayerInterface associatedAdvancedRTSGameLayer;
    
    private static final String PATHING = "Pathing";
    
    protected GDWaypointBehavior(
            PathFindingLayerInterface associatedAdvancedRTSGameLayer,
            CollidableDestroyableDamageableLayer fakeWaypoint) 
    throws Exception
    {
        this.associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer;
                
        this.completeTimeDelayHelper = new TimeDelayHelper(30000);
        
        this.targetList = new BasicArrayList();

        this.possibleTargetList = new BasicArrayList();

        this.setWaypointPathsList(BasicArrayListUtil.getInstance().getImmutableInstance());

        this.setCurrentGeographicMapCellHistory(new GeographicMapCellHistory());

        this.FAKE_WAYPOINT_LAYER = fakeWaypoint;
    }
 
    protected void initRange(final int weaponRange)
    {
        this.longWeaponRange = weaponRange / 2;
    }

    public void onEvent(final AllBinaryEventObject eventObject)
    {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }
    
    public void onWaypointEvent(final RTSLayerEvent event) throws Exception
    {
        final PathFindingLayerInterface advancedRTSGameLayer =
            (PathFindingLayerInterface) event.getRtsLayer();

        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().onWaypointEvent(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
        
        // If primary waypoint or both from parent or User/AI input
        // advancedRTSGameLayer.getParentLayer() == null for buildings
        if (this.associatedAdvancedRTSGameLayer.isSelected())
        {
            this.addWaypointFromUser(advancedRTSGameLayer);
        }
        else
            if(advancedRTSGameLayer.shouldAddWaypointFromBuilding())
            {
                this.addWaypointFromBuilding(advancedRTSGameLayer);
            }
    }

    protected void addWaypointFromUser(final PathFindingLayerInterface advancedRTSGameLayer)
    throws Exception
    {
    }

    private void addWaypointFromBuilding(final PathFindingLayerInterface advancedRTSGameLayer)
    throws Exception
    {
        if (advancedRTSGameLayer == PrimaryWaypointHelper.getInstance().getWaypointLayer()
                || advancedRTSGameLayer.getParentLayer() == associatedAdvancedRTSGameLayer.getParentLayer())
        {
            if (!this.getTargetList().contains(advancedRTSGameLayer))
            {
                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
                
                if (advancedRTSGameLayer.isDestroyed())
                {
                    throw new Exception("Trying to add a dead: " + advancedRTSGameLayer);
                }

                this.getTargetList().add(advancedRTSGameLayer);

                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.getTargetList());
            }
        }
    }

    public boolean isWaypointListEmptyOrOnlyTargets()
    {
        return false;
    }
    
    public boolean insertWaypoint(final int index, final CollidableDestroyableDamageableLayer rtsLayer)
    throws Exception
    {
        if (this.canInsertWaypoint(index, rtsLayer))
        {
            this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().insertWaypoint(index, rtsLayer, this.getName());

            if(rtsLayer.isDestroyed())
            {
                throw new Exception("Trying to add a dead: " + rtsLayer);
            }
            
            this.getTargetList().add(index, rtsLayer);

            this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().insertWaypoint(index, rtsLayer, this.getName(), this.targetList);

            return true;
        }
        return false;
    }
    
    protected void move()
    {
        if (this.isMoving())
        {
            this.setMovingFromStopped(false);
        } else
        {
            this.setMovingFromStopped(true);
        }
        this.setMoving(false);
    }
    
    protected void setRandomGeographicMapCellHistory(final BasicArrayList pathsList) throws Exception
    {
        final int size = pathsList.size();
        
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().setRandomGeographicMapCellHistory(pathsList);

        if (size > 0)
        {
            final BasicArrayList geographicMapCellPositionBasicArrayList =
                (BasicArrayList) BasicArrayListUtil.getInstance().getRandom(pathsList);

            this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
        }
    }
    
    protected void setGeographicMapCellHistoryPath(
            final BasicArrayList geographicMapCellPositionBasicArrayList)
            throws Exception
    {
        this.lastPathGeographicMapCellPosition = null;
        
        if(this.associatedAdvancedRTSGameLayer.isShowMoreCaptionStates())
        {
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(
                    PATHING, BasicColorFactory.getInstance().GREEN);
        }
        
        this.getCurrentGeographicMapCellHistory().init();

        this.associatedAdvancedRTSGameLayer.init(this.getCurrentGeographicMapCellHistory(),
                geographicMapCellPositionBasicArrayList);

        this.setTrackingWaypoint(true);
        this.getCompleteTimeDelayHelper().setStartTime();
    }
        
    protected boolean canInsertWaypoint(final int index, final CollidableDestroyableDamageableLayer rtsLayer)
    {
        if (this.getTargetList().size() > 4)
        {
            //LogUtil.put(LogFactory.getInstance(
            //  this.getName() + " has Too Many Waypoints of: " +
            //rtsLayer.getName(), this, "insertWaypoint"));
        }
        else if (this.getTargetList().contains(rtsLayer))
        {
            //LogUtil.put(LogFactory.getInstance(
            //  this.getName() + " Already Contains Same Waypoint: " +
            //rtsLayer.getName(), this, "insertWaypoint"));
        }
        else
        {
            return true;
        }
        return false;
    }
    
    public void addBuildingChase(
            final AllBinaryLayer allbinaryLayer, final GeographicMapCellPosition cellPosition)
    throws Exception
    {
    }
    
    protected void moveAwayFromBuilding(final PathFindingLayerInterface buildingLayer) throws Exception
    {
        final GeographicMapCellPosition geographicMapCellPosition = 
            this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();

        final BasicArrayList list = buildingLayer.getGeographicMapCellPositionArea()
                .getOccupyingGeographicMapCellPositionList();

        if (list.contains(geographicMapCellPosition))
        {

            if (this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER))
            {
                this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().moveAwayFromBuilding();

                this.setCurrentTargetLayerInterface((CollidableDestroyableDamageableLayer) this.FAKE_WAYPOINT_LAYER);

                final BasicArrayList pathsList = buildingLayer.getMoveOutOfBuildAreaPath(geographicMapCellPosition);

                // if (pathsList != null)
                // {
                this.associatedAdvancedRTSGameLayer.setClosestGeographicMapCellHistory(pathsList);
                // }
            }
        }
    }

    private final TimeDelayHelper repeatedToLong = new TimeDelayHelper(22000);
    
    protected boolean needToMove()
    {
        this.associatedAdvancedRTSGameLayer.getWaypointLogHelper().needToMove(this);
        
        if(this.isTrackingWaypoint() ||
                this.sensorAction == SensorActionFactory.getInstance().EVADE ||
                (this.currentTargetLayerInterface != null &&
                this.getCurrentTargetDistance() >= this.longWeaponRange +
                this.currentTargetLayerInterface.getHalfHeight()))
        {
            repeatedToLong.setStartTime();
            return true;
        }
        
        if(repeatedToLong.isTime())
        {
            final String message = "Repeating too long: " + this.getMovementLogicAsString();
            ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer);
        }
        
        return false;
    }
        
    public String getMovementLogicAsString() {

        final StringMaker stringBuffer = new StringMaker();

        stringBuffer.append("isTrackingWaypoint: ");
        stringBuffer.append(this.isTrackingWaypoint());
        stringBuffer.append(" sensorAction: ");
        stringBuffer.append(this.sensorAction.name);
        stringBuffer.append(" getCurrentTargetLayerInterface: ");
        stringBuffer.append(this.currentTargetLayerInterface);

        if (this.currentTargetLayerInterface != null) {
            stringBuffer.append(" Target Range: ");
            stringBuffer.append(this.getCurrentTargetDistance());
            stringBuffer.append(" >= ");
            stringBuffer.append(this.longWeaponRange + this.currentTargetLayerInterface.getHalfHeight());
        }
        return stringBuffer.toString();

    }
    
    public boolean isMovingFromStopped()
    {
        return this.movingFromStopped;
    }
    
    /**
     * @param movingFromStopped the movingFromStopped to set
     */
    protected void setMovingFromStopped(boolean movingFromStopped)
    {
        this.movingFromStopped = movingFromStopped;
    }

    public void setWaypointPathsList(BasicArrayList waypointPathsList)
    {
        this.waypointPathsList = waypointPathsList;
    }

    protected BasicArrayList getWaypointPathsList()
    {
        return waypointPathsList;
    }

    /**
     * @return the moving
     */
    protected boolean isMoving()
    {
        return moving;
    }

    /**
     * @param moving the moving to set
     */
    protected void setMoving(boolean moving)
    {
        this.moving = moving;
    }
    
    /**
     * @return the trackingWaypoint
     */
    public boolean isTrackingWaypoint()
    {
        return trackingWaypoint;
    }
    
    protected BasicArrayList getPossibleTargetList()
    {
        return possibleTargetList;
    }

    protected void setLastPathGeographicMapCellPosition(GeographicMapCellPosition lastPathGeographicMapCellPosition)
    {
        this.lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition;
    }

    protected GeographicMapCellPosition getLastPathGeographicMapCellPosition()
    {
        return lastPathGeographicMapCellPosition;
    }

    
    protected void setCurrentPathGeographicMapCellPosition(
            GeographicMapCellPosition currentPathGeographicMapCellPosition)
    {
        this.currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition;
    }

    public GeographicMapCellPosition getCurrentPathGeographicMapCellPosition()
    {
        return currentPathGeographicMapCellPosition;
    }
    
    protected void setSensorAction(SensorAction sensorAction)
    {
        this.sensorAction = sensorAction;
    }

    protected SensorAction getSensorAction()
    {
        return sensorAction;
    }
    
    /**
     * @return the waypointList
     */
    protected BasicArrayList getTargetList()
    {
        return targetList;
    }

    protected void setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer currentTargetLayerInterface)
    {
        this.currentTargetLayerInterface = currentTargetLayerInterface;
    }

    public CollidableDestroyableDamageableLayer getCurrentTargetLayerInterface()
    {
        return currentTargetLayerInterface;
    }

    protected void setCurrentTargetDistance(int currentTargetDistance)
    {
        this.currentTargetDistance = currentTargetDistance;
    }

    protected int getCurrentTargetDistance()
    {
        return currentTargetDistance;
    }

    protected TimeDelayHelper getCompleteTimeDelayHelper()
    {
        return completeTimeDelayHelper;
    }

    protected void setCurrentGeographicMapCellHistory(
            GeographicMapCellHistory currentGeographicMapCellHistory)
    {
        this.currentGeographicMapCellHistory = currentGeographicMapCellHistory;
    }

    public GeographicMapCellHistory getCurrentGeographicMapCellHistory()
    {
        return currentGeographicMapCellHistory;
    }

    protected void setTrackingWaypoint(boolean trackingWaypoint)
    {
        this.trackingWaypoint = trackingWaypoint;
    }
}
