
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer.waypoint




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.form.PrimaryWaypointHelper
import org.allbinary.game.layer.PathFindingLayerInterface
import org.allbinary.game.layer.RTSLayerEvent
import org.allbinary.game.layer.SensorAction
import org.allbinary.game.layer.SensorActionFactory
import org.allbinary.game.layer.WaypointBehaviorBase
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
import org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.communication.log.ForcedLogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.util.event.AllBinaryEventObject
import org.allbinary.logic.util.event.EventStrings
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.util.BasicArrayListUtil
import org.allbinary.util.ImmutableBasicArrayList

open public class GDWaypointBehavior : WaypointBehaviorBase
                , WaypointEventListenerInterface {
        
companion object {
            
    val DEFAULT: BasicArrayList = ImmutableBasicArrayList("DefaultAndImmutable", 0)

    private val PATHING: String = "Pathing"

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var longWeaponRange: Int = 0

    private var sensorAction: SensorAction = SensorActionFactory.getInstance()!!.ATTACK

    private val completeTimeDelayHelper: TimeDelayHelper

    var currentGeographicMapCellHistory: GeographicMapCellHistory

    private var lastPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

    private var currentPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

    private val FAKE_WAYPOINT_LAYER: CollidableDestroyableDamageableLayer

    val targetList: BasicArrayList

    private var moving: Boolean = false

    private var movingFromStopped: Boolean = false

    var waypointPathsList: BasicArrayList = BasicArrayListUtil.getInstance()!!.getImmutableInstance()!!

    private val possibleTargetList: BasicArrayList

    private var currentTargetDistance: Int = Integer.MAX_VALUE

    var currentTargetLayerInterface: CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance()!!

    var currentTargetGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

    private var trackingWaypoint: Boolean= false

    val associatedAdvancedRTSGameLayer: PathFindingLayerInterface
protected constructor (associatedAdvancedRTSGameLayer: PathFindingLayerInterface, fakeWaypoint: CollidableDestroyableDamageableLayer){
    //var associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer
    //var fakeWaypoint = fakeWaypoint
this.associatedAdvancedRTSGameLayer= associatedAdvancedRTSGameLayer
this.completeTimeDelayHelper= TimeDelayHelper(30000)
this.targetList= BasicArrayListD()
this.possibleTargetList= BasicArrayListD()
this.setWaypointPathsList(GDWaypointBehavior.DEFAULT)
this.currentGeographicMapCellHistory= GeographicMapCellHistory()
this.FAKE_WAYPOINT_LAYER= fakeWaypoint
}


    open fun initRange(weaponRange: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var weaponRange = weaponRange
this.longWeaponRange= weaponRange /2
}


    override fun onEvent(eventObject: AllBinaryEventObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var eventObject = eventObject
ForcedLogUtil.log(EventStrings.getInstance()!!.PERFORMANCE_MESSAGE, this)
}


                @Throws(Exception::class)
            
    override fun onWaypointEvent(event: RTSLayerEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var event = event

    var advancedRTSGameLayer: PathFindingLayerInterface = event.getRtsLayer() as PathFindingLayerInterface

this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.onWaypointEvent(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)

    
                        if(this.associatedAdvancedRTSGameLayer!!.isSelected())
                        
                                    {
                                    this.addWaypointFromUser(advancedRTSGameLayer)

                                    }
                                
                             else 
    
                        if(advancedRTSGameLayer!!.shouldAddWaypointFromBuilding())
                        
                                    {
                                    this.addWaypointFromBuilding(advancedRTSGameLayer)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun addWaypointFromUser(advancedRTSGameLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var advancedRTSGameLayer = advancedRTSGameLayer
}


                @Throws(Exception::class)
            
    open fun addWaypointFromBuilding(advancedRTSGameLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var advancedRTSGameLayer = advancedRTSGameLayer

    
                        if(advancedRTSGameLayer == PrimaryWaypointHelper.getInstance()!!.getWaypointLayer() || advancedRTSGameLayer!!.getParentLayer() == this.associatedAdvancedRTSGameLayer!!.getParentLayer())
                        
                                    {
                                    
    
                        if(!this.targetList!!.contains(advancedRTSGameLayer))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)

    
                        if(advancedRTSGameLayer!!.isDestroyed())
                        
                                    {
                                    


                            throw Exception("Trying to add a dead: " +advancedRTSGameLayer)

                                    }
                                
this.targetList!!.add(advancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.addWaypointFromBuildingList(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.targetList)

                                    }
                                

                                    }
                                
}


    override fun isWaypointListEmptyOrOnlyTargets()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun insertWaypoint(index: Int, rtsLayer: CollidableDestroyableDamageableLayer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var index = index
    //var rtsLayer = rtsLayer

    
                        if(this.canInsertWaypoint(index, rtsLayer))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.insertWaypoint(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName())

    
                        if(rtsLayer!!.isDestroyed())
                        
                                    {
                                    


                            throw Exception("Trying to add a dead: " +rtsLayer)

                                    }
                                
this.targetList!!.addAt(index, rtsLayer)
this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.insertWaypointList(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName(), this.targetList)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun move()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.isMoving())
                        
                                    {
                                    this.setMovingFromStopped(false)

                                    }
                                
                        else {
                            this.setMovingFromStopped(true)

                        }
                            
this.setMoving(false)
}


                @Throws(Exception::class)
            
    open fun setRandomGeographicMapCellHistory(pathsList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var pathsList = pathsList

    
                        if(pathsList == BasicArrayListUtil.getInstance()!!.getImmutableInstance())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.setRandomGeographicMapCellHistory(this.associatedAdvancedRTSGameLayer)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var size: Int = pathsList!!.size()!!

this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.setRandomGeographicMapCellHistoryList(this.associatedAdvancedRTSGameLayer, pathsList)

    
                        if(size > 0)
                        
                                    {
                                    
    var geographicMapCellPositionBasicArrayList: BasicArrayList = BasicArrayListUtil.getInstance()!!.getRandom(pathsList) as BasicArrayList

this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapCellPositionBasicArrayList = geographicMapCellPositionBasicArrayList
this.lastPathGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

    
                        if(this.associatedAdvancedRTSGameLayer!!.isShowMoreCaptionStates())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior.PATHING, BasicColorFactory.getInstance()!!.GREEN)

                                    }
                                
this.currentGeographicMapCellHistory!!.init()
this.associatedAdvancedRTSGameLayer!!.init(this.currentGeographicMapCellHistory, geographicMapCellPositionBasicArrayList)
this.setTrackingWaypoint(true)
this.getCompleteTimeDelayHelper()!!.setStartTimeTNT()
}


    open fun canInsertWaypoint(index: Int, rtsLayer: CollidableDestroyableDamageableLayer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var index = index
    //var rtsLayer = rtsLayer

    
                        if(this.targetList!!.size() > 4)
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(this.targetList!!.contains(rtsLayer))
                        
                                    {
                                    
                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun addBuildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
    //var allbinaryLayer = allbinaryLayer
    //var cellPosition = cellPosition
}


                @Throws(Exception::class)
            
    open fun moveAwayFromBuilding(buildingLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var buildingLayer = buildingLayer

    var geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!!.getCurrentGeographicMapCellPosition()!!


    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var list: BasicArrayList = buildingLayer!!.getGeographicMapCellPositionArea()!!.getOccupyingGeographicMapCellPositionList()!!


    
                        if(list.contains(geographicMapCellPosition))
                        
                                    {
                                    
    
                        if(this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.moveAwayFromBuilding(this.associatedAdvancedRTSGameLayer)
this.setCurrentTargetLayerInterface(this.FAKE_WAYPOINT_LAYER as CollidableDestroyableDamageableLayer)

    var pathsList: BasicArrayList = buildingLayer!!.getMoveOutOfBuildAreaPath(geographicMapCellPosition)!!

this.associatedAdvancedRTSGameLayer!!.setClosestGeographicMapCellHistory(pathsList)

                                    }
                                

                                    }
                                
}


    private val repeatedToLong: TimeDelayHelper = TimeDelayHelper(22000)

    override fun needToMove()
        //nullable = true from not(false or (false and true)) = true
: Boolean{
this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.needToMove(this.associatedAdvancedRTSGameLayer, this)

    
                        if(this.isTrackingWaypoint() || this.sensorAction == SensorActionFactory.getInstance()!!.EVADE || (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentTargetDistance() >= this.longWeaponRange +this.currentTargetLayerInterface!!.getHalfHeight()))
                        
                                    {
                                    this.repeatedToLong!!.setStartTimeTNT()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(this.repeatedToLong!!.isTimeTNT())
                        
                                    {
                                    
    var message: String = "Repeating too long: " +this.getMovementLogicAsString()

ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    override fun getMovementLogicAsString()
        //nullable = true from not(false or (false and true)) = true
: String{

    var stringBuffer: StringMaker = StringMaker()

stringBuffer!!.append("isTrackingWaypoint: ")
stringBuffer!!.appendboolean(this.isTrackingWaypoint())
stringBuffer!!.append(" sensorAction: ")
stringBuffer!!.append(this.sensorAction!!.name)
stringBuffer!!.append(" getCurrentTargetLayerInterface: ")
stringBuffer!!.append(StringUtil.getInstance()!!.toString(this.currentTargetLayerInterface))

    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    stringBuffer!!.append(" Target Range: ")
stringBuffer!!.appendint(this.getCurrentTargetDistance())
stringBuffer!!.append(" >= ")
stringBuffer!!.appendint(this.longWeaponRange +this.currentTargetLayerInterface!!.getHalfHeight())

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!!.toString()
}


    open fun isMovingFromStopped()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.movingFromStopped
}


    open fun setMovingFromStopped(movingFromStopped: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var movingFromStopped = movingFromStopped
this.movingFromStopped= movingFromStopped
}


    override fun setWaypointPathsList(waypointPathsList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
var waypointPathsList = waypointPathsList
this.waypointPathsList= waypointPathsList
}


    override fun getWaypointPathsList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.waypointPathsList
}


    open fun isMoving()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.moving
}


    open fun setMoving(moving: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var moving = moving
this.moving= moving
}


    override fun isTrackingWaypoint()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.trackingWaypoint
}


    open fun getPossibleTargetList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.possibleTargetList
}


    open fun setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
var lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition
this.lastPathGeographicMapCellPosition= lastPathGeographicMapCellPosition
}


    open fun getLastPathGeographicMapCellPosition()
        //nullable = true from not(false or (false and true)) = true
: GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.lastPathGeographicMapCellPosition
}


    open fun setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
    //var currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition
this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.currentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition)
this.currentPathGeographicMapCellPosition= currentPathGeographicMapCellPosition
}


    override fun getCurrentPathGeographicMapCellPosition()
        //nullable = true from not(false or (false and true)) = true
: GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentPathGeographicMapCellPosition
}


    open fun setSensorAction(sensorAction: SensorAction)
        //nullable = true from not(false or (false and false)) = true
{
var sensorAction = sensorAction
this.sensorAction= sensorAction
}


    open fun getSensorAction()
        //nullable = true from not(false or (false and true)) = true
: SensorAction{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.sensorAction
}


    open fun getTargetList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.targetList
}


                @Throws(Exception::class)
            
    open fun setCurrentTargetLayerInterface(currentTargetLayerInterface: CollidableDestroyableDamageableLayer)
        //nullable = true from not(false or (false and false)) = true
{
var currentTargetLayerInterface = currentTargetLayerInterface
this.currentTargetLayerInterface= currentTargetLayerInterface

    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    this.currentTargetGeographicMapCellPosition= 
                                    (currentTargetLayerInterface as PathFindingLayerInterface).getCurrentGeographicMapCellPosition()

                                    }
                                
                        else {
                            this.currentTargetGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

                        }
                            
}


    override fun getCurrentTargetLayerInterface()
        //nullable = true from not(false or (false and true)) = true
: CollidableDestroyableDamageableLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentTargetLayerInterface
}


    open fun setCurrentTargetDistance(currentTargetDistance: Int)
        //nullable = true from not(false or (false and false)) = true
{
var currentTargetDistance = currentTargetDistance
this.currentTargetDistance= currentTargetDistance
}


    open fun getCurrentTargetDistance()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentTargetDistance
}


    open fun getCompleteTimeDelayHelper()
        //nullable = true from not(false or (false and true)) = true
: TimeDelayHelper{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.completeTimeDelayHelper
}


    override fun getCurrentGeographicMapCellHistory()
        //nullable = true from not(false or (false and true)) = true
: GeographicMapCellHistory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentGeographicMapCellHistory
}


    open fun setTrackingWaypoint(trackingWaypoint: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var trackingWaypoint = trackingWaypoint
this.trackingWaypoint= trackingWaypoint
}


}
                
            

