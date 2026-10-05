
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer.waypoint




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.game.layer.PathFindingLayerInterface
import org.allbinary.game.layer.SteeringVisitor
import org.allbinary.game.layer.WaypointPathRunnable
import org.allbinary.game.layer.WaypointPathRunnableBase
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
import org.allbinary.game.tracking.TrackingEventHandler
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.layer.AllBinaryLayerManager
import org.allbinary.logic.NullUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonSeps
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.math.LayerDistanceUtil
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
import org.allbinary.thread.PathFindingThreadPool
import org.allbinary.thread.ThreadPool
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.util.BasicArrayListUtil

open public class GDWaypointBehavior2 : GDWaypointBehavior {
        
companion object {
            
    private val WANDERING: String = "Order?"

    private val THINKING: String = "Thinking"

    private val THINKING_ABOUT_TARGET: String = "Hmmm"

    private val TARGET: String = "Target"

    private val KILL: String = "Kill!"

    private val STOP: String = "Stop"

    private val WAYPOINT_DESTROYED_SHORT: String = "Uh Oh"

    private val WAYPOINT_DESTROYED: String = "Waypoint Destroyed"

    private val ALL_VISITED_SHORT: String = "Arrived"

    private val _ALL_VISITED_SHORT: String = " Arrived"

    private val ALREADY_THERE_SHORT: String = "Again?"

    private val _ALREADY_THERE_SHORT: String = " Again?"

    private val NEXT_PATH_NODE: String = "Next Path Node"

    private val VISITED_MOST_OF_THE_PATH: String = " visited most of the path"

    private val RETURNING_AS_WAYPOINT_PATH_LIST: String = " returning as waypointPathsList was runningWaypointPathList"

    private val runningWaypointPathList: BasicArrayList = BasicArrayListD()

    private val TARGET_DISTANCE: String = "Target Distance"

    private val TARGET_LAYER: String = "Target Layer"

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val layerDistanceUtil: LayerDistanceUtil = LayerDistanceUtil.getInstance()!!

    private val pathFindingThreadPool: ThreadPool = PathFindingThreadPool.getInstance()!!

    private val targetWithoutSensors: Boolean = true

    private var sensorRange: Int = 0

    private var closeRange: Int = 0

    private val progressTimeDelayHelper: TimeDelayHelper

    var nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

    private var afterNextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition

    private val wanderPathsList: BasicArrayList

    private val waypointPathRunnable: WaypointPathRunnableBase

    private var waitingOnTargetPath: Boolean= false

    private var waitingOnWaypointPath: Boolean= false

    private var targetWithoutCachedPathLayerInterface: CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance()!!
public constructor (ownerAdvancedRTSGameLayer: PathFindingLayerInterface, fakeWaypoint: CollidableDestroyableDamageableLayer)                        

                            : super(ownerAdvancedRTSGameLayer, fakeWaypoint){
    //var ownerAdvancedRTSGameLayer = ownerAdvancedRTSGameLayer
    //var fakeWaypoint = fakeWaypoint


                            //For kotlin this is before the body of the constructor.
                    
this.progressTimeDelayHelper= TimeDelayHelper(5000)
this.wanderPathsList= BasicArrayListD()
this.waypointPathRunnable= WaypointPathRunnable()
}


    override fun initRange(weaponRange: Int)
        //nullable = true from not(false or (false and false)) = true
{
var weaponRange = weaponRange
super.initRange(weaponRange)
this.closeRange= weaponRange
this.sensorRange= weaponRange *4
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.initRange(this.associatedAdvancedRTSGameLayer, this.closeRange, this.sensorRange)
}


    override fun isRunning()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    
                        if(this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                        }
                            
}


                @Throws(Exception::class)
            
    override fun processTick(allBinaryLayerManager: AllBinaryLayerManager)
        //nullable = true from not(false or (false and false)) = true
{
    //var allBinaryLayerManager = allBinaryLayerManager

    
                        if(this.waypointPathsList == GDWaypointBehavior.DEFAULT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentGeographicMapCellHistory()!!.getTotalVisited() > this.getCurrentGeographicMapCellHistory()!!.getTotalNotVisited())
                        
                                    {
                                    this.updatePathOnTargetMove(GDWaypointBehavior2.VISITED_MOST_OF_THE_PATH)

                                    }
                                

    
                        if(this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    
    
                        if(this.waypointPathsList != GDWaypointBehavior2.runningWaypointPathList)
                        
                                    {
                                    this.waypointPathRunnable!!.setRunning(false)

    
                        if(this.waitingOnTargetPath)
                        
                                    {
                                    this.setTargetPath()

                                    }
                                
                             else 
    
                        if(this.waitingOnWaypointPath)
                        
                                    {
                                    this.setWaypointPath(this.waypointPathRunnable!!.getTargetLayer())

                                    }
                                
                        else {
                            


                            throw Exception("Should not happen")

                        }
                            

                                    }
                                
                        else {
                            this.updatePathOnTargetMove(GDWaypointBehavior2.RETURNING_AS_WAYPOINT_PATH_LIST)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                        }
                            

                                    }
                                
this.processTargetList()

    
                        if(!this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    this.processWaypoint()

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                        }
                            

    
                        if(!this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    this.processTargeting()

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                        }
                            

    
                        if(!this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    this.teleportIfNoProgress()

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                        }
                            
}


                @Throws(Exception::class)
            
    open fun onEnemyMovement(layerInterface: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
var layerInterface = layerInterface

    var anotherTargetDistance: Int = this.layerDistanceUtil!!.getDistance(this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer, layerInterface as CollidableDestroyableDamageableLayer)!!


    
                        if(layerInterface == this.currentTargetLayerInterface)
                        
                                    {
                                    this.setCurrentTargetDistance(anotherTargetDistance)

                                    }
                                
                        else {
                            this.processPossibleTarget(layerInterface, anotherTargetDistance)

                        }
                            
}


                @Throws(Exception::class)
            
    open fun processPossibleTarget(layerInterface: PathFindingLayerInterface, anotherTargetDistance: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var layerInterface = layerInterface
    //var anotherTargetDistance = anotherTargetDistance

    var isShorterThanCurrentTargetDistance: Boolean = this.getCurrentTargetDistance() > anotherTargetDistance


    var isCurrentTargetDestroyed: Boolean = this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.currentTargetLayerInterface!!.isDestroyed()

this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)

    
                        if(this.isWaypointListEmptyOrOnlyTargets() && this.isInSensorRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processSetTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance)
this.setTargetWithDistance(layerInterface, anotherTargetDistance)

                                    }
                                
                             else 
    
                        if(this.isCloseRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processPossibleTargetCloser(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance)
this.setTargetWithDistance(layerInterface, anotherTargetDistance)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun teleportIfNoProgress()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.isTrackingWaypoint())
                        
                                    {
                                    
    
                        if(this.progressTimeDelayHelper!!.isTimeTNT() && this.nextUnvisitedPathGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.teleportTo(this.nextUnvisitedPathGeographicMapCellPosition)

                                    }
                                

    
                        if(this.getCompleteTimeDelayHelper()!!.isTimeTNT())
                        
                                    {
                                    
    var geographicMapCellPosition: GeographicMapCellPosition = this.currentGeographicMapCellHistory!!.getTracked()!!.get(this.currentGeographicMapCellHistory!!.getSize() -1) as GeographicMapCellPosition

this.associatedAdvancedRTSGameLayer!!.teleportTo(geographicMapCellPosition)

                                    }
                                

                                    }
                                
}


                @Throws(Exception::class)
            
    override fun updatePathOnTargetMove(reason: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var reason = reason

    var currentTargetLayerInterface: CollidableDestroyableDamageableLayer = this.currentTargetLayerInterface


    
                        if(currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
    var geographicMapCellPosition: GeographicMapCellPosition = 
                                    (currentTargetLayerInterface as PathFindingLayerInterface).getCurrentGeographicMapCellPosition()!!


    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.currentTargetGeographicMapCellPosition != geographicMapCellPosition)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.targetMovedSoRetarget(this.associatedAdvancedRTSGameLayer)
this.setWaypointPathsList(GDWaypointBehavior.DEFAULT)
this.setTarget(currentTargetLayerInterface as PathFindingLayerInterface)

                                    }
                                
                        else {
                            
                        }
                            

                                    }
                                
                        else {
                            


                            throw RuntimeException()

                        }
                            
}


                @Throws(Exception::class)
            
    override fun setTarget(layerInterface: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var layerInterface = layerInterface

    var anotherTargetDistance: Int = this.layerDistanceUtil!!.getDistance(this.associatedAdvancedRTSGameLayer as AllBinaryLayer, layerInterface as AllBinaryLayer)!!

this.setTargetWithDistance(layerInterface, anotherTargetDistance)
}


                @Throws(Exception::class)
            
    override fun setTargetWithDistance(layerInterface: PathFindingLayerInterface, anotherTargetDistance: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var layerInterface = layerInterface
    //var anotherTargetDistance = anotherTargetDistance
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.setTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.TARGET, BasicColorFactory.getInstance()!!.GREEN)
this.associatedAdvancedRTSGameLayer!!.setLoad(0.toShort())
this.setCurrentTargetDistance(anotherTargetDistance)
this.setCurrentTargetLayerInterface(layerInterface as CollidableDestroyableDamageableLayer)
this.setTrackingWaypoint(false)
this.targetList!!.clear()

    
                        if(!this.isCloseRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && this.canInsertWaypoint(0, this.currentTargetLayerInterface))
                        
                                    {
                                    
    var geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!!.getCurrentGeographicMapCellPosition()!!


    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var waypoint: WaypointBase = currentTargetLayerInterface = this.currentTargetLayerInterfacecurrentTargetLayerInterface as PathFindingLayerInterface
currentTargetLayerInterface.
                    getWaypointBehavior()!!.getWaypoint()!!


    var list: BasicArrayList = waypoint.getPathsListFromCacheOnly(geographicMapCellPosition)!!

this.setWaypointPathsList(list)

    
                        if(this.waypointPathsList == BasicArrayListUtil.getInstance()!!.getImmutableInstance())
                        
                                    {
                                    this.targetWithoutCachedPathLayerInterface= this.currentTargetLayerInterface

                                    }
                                
                             else 
    
                        if(this.waypointPathsList!!.size() != 0)
                        
                                    {
                                    this.setTargetPath()

                                    }
                                

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun setTargetPath()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
    
                        if(this.currentTargetLayerInterface!!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.setTargetPath(this.associatedAdvancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.KILL, BasicColorFactory.getInstance()!!.ORANGE)
this.clearTarget()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.currentTargetLayerInterface == this.waypointPathRunnable!!.getTargetLayer())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.setTargetPathIgnoreNewPath(this.associatedAdvancedRTSGameLayer, this)
this.insertWaypoint(0, this.currentTargetLayerInterface)
this.setRandomGeographicMapCellHistory(this.waypointPathsList)

                                    }
                                

                                    }
                                
}


                @Throws(Exception::class)
            
    override fun setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapCellPositionBasicArrayList = geographicMapCellPositionBasicArrayList
this.setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
this.setNextUnvisitedPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
super.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
}


                @Throws(Exception::class)
            
    open fun processWaypoint()
        //nullable = true from not(false or (false and true)) = true
{

    var size: Int = this.targetList!!.size()!!


    
                        if(size > 0)
                        
                                    {
                                    
    var targetLayer: PathFindingLayerInterface = this.targetList!!.get(0) as PathFindingLayerInterface

this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processWaypoint(this.associatedAdvancedRTSGameLayer, this, targetLayer, size)

    
                        if(targetLayer!!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.WAYPOINT_DESTROYED_SHORT, BasicColorFactory.getInstance()!!.YELLOW)
this.removeWaypoint(targetLayer, GDWaypointBehavior2.WAYPOINT_DESTROYED)

                                    }
                                
                        else {
                            
    var geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!!.getCurrentGeographicMapCellPosition()!!


    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.isTrackingWaypoint())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processWaypointTracked(this.associatedAdvancedRTSGameLayer, this)

    
                        if(this.visitIfAtMidPoint(geographicMapCellPosition))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processWaypointTrackedVisit(this.associatedAdvancedRTSGameLayer, geographicMapCellPosition)

                                    }
                                

    
                        if(this.currentGeographicMapCellHistory!!.isAllVisited2() && this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
    var oldWaypointLayer: PathFindingLayerInterface = this.currentTargetLayerInterface as PathFindingLayerInterface

oldWaypointLayer!!.getWaypointBehavior()!!.getWaypoint()!!.visit(this.associatedAdvancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.ALL_VISITED_SHORT, BasicColorFactory.getInstance()!!.GREEN)
this.updatePathOnTargetMove(GDWaypointBehavior2._ALL_VISITED_SHORT)

                                    }
                                

                                    }
                                
                             else 
    
                        if(this.currentTargetLayerInterface == CollidableDestroyableDamageableLayer.getNullInstance() || this.waypointOverridesAttacking)
                        
                                    {
                                    
    var list: BasicArrayList = targetLayer!!.getWaypointBehavior()!!.getWaypoint()!!.getPathsListFromCacheOnly(geographicMapCellPosition)!!

this.setWaypointPathsList(list)

    
                        if(this.waypointPathsList == BasicArrayListUtil.getInstance()!!.getImmutableInstance())
                        
                                    {
                                    this.waitingOnWaypointPath= true
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.THINKING, BasicColorFactory.getInstance()!!.GREEN)
this.runWaypointPathTask(targetLayer)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.setWaypointPath(targetLayer)

                                    }
                                

                        }
                            

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun wander()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.currentGeographicMapCellHistory!!.isAllVisited2())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.wander(this.associatedAdvancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.WANDERING, BasicColorFactory.getInstance()!!.RED)
this.wanderPathsList!!.clear()
this.wanderPathsList!!.add(this.associatedAdvancedRTSGameLayer!!.getSurroundingGeographicMapCellPositionList())
this.setRandomGeographicMapCellHistory(this.wanderPathsList)

                                    }
                                
this.visitIfAtMidPoint(this.getCurrentPathGeographicMapCellPosition())
this.updateCurrentPathGeographicMapCellPosition()
this.associatedAdvancedRTSGameLayer!!.trackTo(GDWaypointBehavior2.NEXT_PATH_NODE)
}


    open fun visitIfAtMidPoint(geographicMapCellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var geographicMapCellPosition = geographicMapCellPosition

    var unitLayer: CollidableDestroyableDamageableLayer = this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer


    
                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && this.nextUnvisitedPathGeographicMapCellPosition == geographicMapCellPosition)
                        
                                    {
                                    
    var point: GPoint = geographicMapCellPosition!!.getMidPoint()!!


    var afterNextPoint: GPoint = this.afterNextUnvisitedPathGeographicMapCellPosition!!.getMidPoint()!!


    var beyondMidPoint: Boolean = true


    
                        if(geographicMapCellPosition!!.getColumn() == this.afterNextUnvisitedPathGeographicMapCellPosition!!.getColumn())
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(point.getX() < afterNextPoint!!.getX())
                        
                                    {
                                    
    
                        if(unitLayer!!.getXP() +unitLayer!!.getHalfWidth() < point.getX())
                        
                                    {
                                    beyondMidPoint= false

                                    }
                                

                                    }
                                
                        else {
                            
    
                        if(unitLayer!!.getXP() +unitLayer!!.getHalfWidth() > point.getX())
                        
                                    {
                                    beyondMidPoint= false

                                    }
                                

                        }
                            

    
                        if(geographicMapCellPosition!!.getRow() == this.afterNextUnvisitedPathGeographicMapCellPosition!!.getRow())
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(point.getY() < afterNextPoint!!.getY())
                        
                                    {
                                    
    
                        if(unitLayer!!.getYP() +unitLayer!!.getHalfHeight() < point.getY())
                        
                                    {
                                    beyondMidPoint= false

                                    }
                                

                                    }
                                
                        else {
                            
    
                        if(unitLayer!!.getYP() +unitLayer!!.getHalfHeight() > point.getY())
                        
                                    {
                                    beyondMidPoint= false

                                    }
                                

                        }
                            

    
                        if(beyondMidPoint)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentGeographicMapCellHistory!!.visit(geographicMapCellPosition)

                                    }
                                

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun processTargetList()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index in this.getPossibleTargetList()!!.size() -1 downTo 0)

        {

    var layerInterface: PathFindingLayerInterface = this.getPossibleTargetList()!!.get(index) as PathFindingLayerInterface


    
                        if(layerInterface!!.isDestroyed())
                        
                                    {
                                    this.getPossibleTargetList()!!.remove(layerInterface)

                                    }
                                
                        else {
                            this.onEnemyMovement(layerInterface)

                        }
                            
}


    
                        if(this.targetWithoutCachedPathLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    this.waitingOnTargetPath= true
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.THINKING_ABOUT_TARGET, BasicColorFactory.getInstance()!!.GREEN)
this.runWaypointPathTask(this.currentTargetLayerInterface as PathFindingLayerInterface)
this.targetWithoutCachedPathLayerInterface= CollidableDestroyableDamageableLayer.getNullInstance()

                                    }
                                
this.getPossibleTargetList()!!.clear()
}


                @Throws(Exception::class)
            
    open fun processTargeting()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && (this.isInSensorRange(this.currentTargetLayerInterface, this.getCurrentTargetDistance()) || this.isTrackingWaypoint() || this.targetWithoutSensors))
                        
                                    {
                                    
    
                        if(this.currentTargetLayerInterface!!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.targetDestroyed(this.associatedAdvancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.KILL, BasicColorFactory.getInstance()!!.ORANGE)
this.clearTarget()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var dx: Int = 0


    var dy: Int = 0


    var associatedAdvancedRTSGameLayer2: CollidableDestroyableDamageableLayer = this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer


    
                        if(this.isTrackingWaypoint())
                        
                                    {
                                    this.updateCurrentPathGeographicMapCellPosition()

    var point: GPoint = this.nextUnvisitedPathGeographicMapCellPosition!!.getMidPoint()!!


    var geographicMapCompositeInterface: GeographicMapCompositeInterface = associatedAdvancedRTSGameLayer2!!.allBinaryGameLayerManagerP as GeographicMapCompositeInterface


    var geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface!!.getGeographicMapInterface()[0]!!


    var tiledLayer: AllBinaryTiledLayer = geographicMapInterface!!.getAllBinaryTiledLayer()!!

dx= associatedAdvancedRTSGameLayer2!!.getXP() +associatedAdvancedRTSGameLayer2!!.getHalfWidth() -point.getX() +tiledLayer!!.getXP()
dy= associatedAdvancedRTSGameLayer2!!.getYP() +associatedAdvancedRTSGameLayer2!!.getHalfHeight() -point.getY() +tiledLayer!!.getYP()
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processTargeting(this.associatedAdvancedRTSGameLayer, dx, dy)

                                    }
                                
                        else {
                            this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.processTargetingNonWayPoint(this.associatedAdvancedRTSGameLayer, dx, dy)
dx= (associatedAdvancedRTSGameLayer2!!.getXP() +associatedAdvancedRTSGameLayer2!!.getHalfWidth()) -(this.currentTargetLayerInterface!!.getXP() +this.currentTargetLayerInterface!!.getHalfWidth())
dy= (associatedAdvancedRTSGameLayer2!!.getYP() +associatedAdvancedRTSGameLayer2!!.getHalfHeight()) -(this.currentTargetLayerInterface!!.getYP() +this.currentTargetLayerInterface!!.getHalfHeight())

                        }
                            
this.associatedAdvancedRTSGameLayer!!.trackToDXY(dx, dy)

                                    }
                                
                        else {
                            
    
                        if(this.associatedAdvancedRTSGameLayer!!.isShowMoreCaptionStates())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.STOP, BasicColorFactory.getInstance()!!.YELLOW)

                                    }
                                
this.associatedAdvancedRTSGameLayer!!.allStop()

                        }
                            
}


                @Throws(Exception::class)
            
    open fun updateCurrentPathGeographicMapCellPosition()
        //nullable = true from not(false or (false and true)) = true
{
this.setLastPathGeographicMapCellPosition(this.getCurrentPathGeographicMapCellPosition())
this.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer!!.getCurrentGeographicMapCellPosition())
this.setNextUnvisitedPathGeographicMapCellPosition(this.currentGeographicMapCellHistory!!.getFirstUnvisited())
this.afterNextUnvisitedPathGeographicMapCellPosition= this.currentGeographicMapCellHistory!!.getAfterIfNotLast(this.nextUnvisitedPathGeographicMapCellPosition)

    
                        if(this.getCurrentPathGeographicMapCellPosition() != this.nextUnvisitedPathGeographicMapCellPosition)
                        
                                    {
                                    this.progressTimeDelayHelper!!.setStartTimeTNT()

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun setWaypointPath(waypointLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var waypointLayer = waypointLayer

    
                        if(this.waypointPathsList!!.size() != 0)
                        
                                    {
                                    this.setCurrentTargetLayerInterface(waypointLayer as CollidableDestroyableDamageableLayer)
this.setCurrentTargetDistance(.MAX_VALUE())
this.setRandomGeographicMapCellHistory(this.waypointPathsList)

                                    }
                                
                        else {
                            waypointLayer!!.getWaypointBehavior()!!.getWaypoint()!!.visit(this.associatedAdvancedRTSGameLayer)
this.associatedAdvancedRTSGameLayer!!.getCaptionAnimationHelper()!!.update(GDWaypointBehavior2.ALREADY_THERE_SHORT, BasicColorFactory.getInstance()!!.YELLOW)
this.updatePathOnTargetMove(GDWaypointBehavior2._ALREADY_THERE_SHORT)

                        }
                            
}


                @Throws(Exception::class)
            
    open fun runWaypointPathTask(waypointLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var waypointLayer = waypointLayer
this.setWaypointPathsList(GDWaypointBehavior2.runningWaypointPathList)

    
                        if(this.waypointPathRunnable!!.isRunning())
                        
                                    {
                                    


                            throw Exception("Should never be running here")

                                    }
                                
this.waypointPathRunnable!!.setRunning(true)
this.waypointPathRunnable!!.setUnitLayer(this.associatedAdvancedRTSGameLayer)
this.waypointPathRunnable!!.setTargetLayer(waypointLayer)
this.pathFindingThreadPool!!.runTaskWithPriority(this.waypointPathRunnable)
}


                @Throws(Exception::class)
            
    open fun removeWaypoint(waypointLayer: PathFindingLayerInterface, reason: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var waypointLayer = waypointLayer
    //var reason = reason
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.removeWaypoint(this.associatedAdvancedRTSGameLayer, this, waypointLayer, reason)
this.targetList!!.remove(waypointLayer)
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.removeWaypointList(this.associatedAdvancedRTSGameLayer, this, this.targetList)

    
                        if(this.currentTargetLayerInterface == waypointLayer)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.removeWaypointClear(this.associatedAdvancedRTSGameLayer)
this.clearTarget()

                                    }
                                
}


                @Throws(Exception::class)
            
    override fun clearTarget()
        //nullable = true from not(false or (false and true)) = true
{
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.clearTarget(this.associatedAdvancedRTSGameLayer)
this.setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance())
this.setTrackingWaypoint(false)
this.setCurrentTargetDistance(.MAX_VALUE())
TrackingEventHandler.getInstance()!!.fireEvent(this.associatedAdvancedRTSGameLayer!!.getTrackingEvent())
}


    override fun isWaypointListEmptyOrOnlyTargets()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    var list: BasicArrayList = this.targetList


    
                        if(list.size() == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                




                        for (index in list.size() -1 downTo 0)

        {

    var layerInterface: PathFindingLayerInterface = list.get(index) as PathFindingLayerInterface


    
                        if(layerInterface!!.isWaypointListEmptyOrOnlyTargets())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun isCloseRange(layerInterface: CollidableDestroyableDamageableLayer, targetDistance: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var layerInterface = layerInterface
    //var targetDistance = targetDistance



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return targetDistance < this.closeRange +layerInterface!!.getHalfHeight()
}


    override fun isInSensorRange(layerInterface: CollidableDestroyableDamageableLayer, targetDistance: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var layerInterface = layerInterface
    //var targetDistance = targetDistance



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return targetDistance < this.sensorRange +layerInterface!!.getHalfHeight()
}


    override fun getCurrentTargetingStateString()
        //nullable = true from not(false or (false and true)) = true
: String{

    var stringBuffer: StringMaker = StringMaker()


    
                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    stringBuffer!!.append(GDWaypointBehavior2.TARGET_LAYER)
stringBuffer!!.append(CommonSeps.getInstance()!!.SPACE)
stringBuffer!!.append(this.currentTargetLayerInterface!!.getName())
stringBuffer!!.append(" with")
stringBuffer!!.append(CommonSeps.getInstance()!!.SPACE)
stringBuffer!!.append(GDWaypointBehavior2.TARGET_DISTANCE)
stringBuffer!!.append(CommonSeps.getInstance()!!.SPACE)
stringBuffer!!.appendint(this.getCurrentTargetDistance())

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!!.toString()
}


                @Throws(Exception::class)
            
    override fun addWaypointFromUser(advancedRTSGameLayer: PathFindingLayerInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var advancedRTSGameLayer = advancedRTSGameLayer

    
                        if(advancedRTSGameLayer!!.isDestroyed())
                        
                                    {
                                    


                            throw Exception("Trying to add a dead: " +advancedRTSGameLayer)

                                    }
                                
this.associatedAdvancedRTSGameLayer!!.getWaypoint2LogHelper()!!.addWaypointFromUser(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
this.targetList!!.clear()
this.targetList!!.add(advancedRTSGameLayer)
this.clearTarget()
}


open public inner class BuildingSteeringVisitor : SteeringVisitor {
        
/*Static stuff is not allowed for Kotlin inner classescompanion object {
            *//*
        }
            */


            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val positionList: BasicArrayList = BasicArrayListD()

    override fun visit(anyType: Any)
        //nullable = true from not(false or (false and false)) = true
: Any{
var anyType = anyType

        try {
            
    
                        if(this.getList()!!.size() > 0)
                        
                                    {
                                    
    var allbinaryLayer: AllBinaryLayer = this.getList()!!.get(0) as AllBinaryLayer


    var cellPosition: GeographicMapCellPosition = this.getPositionList()!!.get(0) as GeographicMapCellPosition


    var clear: Boolean = this@GDWaypointBehavior2.buildingChase(allbinaryLayer, cellPosition)!!


    
                        if(clear)
                        
                                    {
                                    this.getList()!!.clear()
this.positionList!!.clear()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Boolean.FALSE

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

logUtil!!.put(commonStrings!!.EXCEPTION, this, "visit", e)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT
}

}


    open fun getPositionList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.positionList
}


}
                
            
    private val buildingSteeringVisitor: BuildingSteeringVisitor = BuildingSteeringVisitor()

                @Throws(Exception::class)
            
    override fun addBuildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
    //var allbinaryLayer = allbinaryLayer
    //var cellPosition = cellPosition

    
                        if(!this.buildingSteeringVisitor!!.getList()!!.contains(allbinaryLayer))
                        
                                    {
                                    this.buildingSteeringVisitor!!.getList()!!.add(allbinaryLayer)
this.buildingSteeringVisitor!!.getPositionList()!!.add(cellPosition)

                                    }
                                

    
                        if(!this.getSteeringVisitorList()!!.contains(this.buildingSteeringVisitor))
                        
                                    {
                                    this.getSteeringVisitorList()!!.add(this.buildingSteeringVisitor)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun buildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var allbinaryLayer = allbinaryLayer
    //var cellPosition = cellPosition



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.associatedAdvancedRTSGameLayer!!.buildingChase(allbinaryLayer, cellPosition)
}


    override fun getNextUnvisitedPathGeographicMapCellPosition()
        //nullable = true from not(false or (false and true)) = true
: GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.nextUnvisitedPathGeographicMapCellPosition
}


    open fun setNextUnvisitedPathGeographicMapCellPosition(nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
    //var nextUnvisitedPathGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
this.associatedAdvancedRTSGameLayer!!.getWaypointLogHelper()!!.setNextUnvisitedPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.nextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition)
this.nextUnvisitedPathGeographicMapCellPosition= nextUnvisitedPathGeographicMapCellPosition
}


}
                
            

