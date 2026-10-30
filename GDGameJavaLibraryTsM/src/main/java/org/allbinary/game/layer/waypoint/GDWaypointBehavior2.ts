
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
            import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { AllBinaryTiledLayer } from '../../../../../org/allbinary/game/layer/AllBinaryTiledLayer.js';
//not GWT import const AllBinaryTiledLayer

import { PathFindingLayerInterface } from '../../../../../org/allbinary/game/layer/PathFindingLayerInterface.js';
//not GWT import const PathFindingLayerInterface

import { SteeringVisitor } from '../../../../../org/allbinary/game/layer/SteeringVisitor.js';
//not GWT import const SteeringVisitor

import { WaypointPathRunnable } from '../../../../../org/allbinary/game/layer/WaypointPathRunnable.js';
//not GWT import const WaypointPathRunnable

import { WaypointPathRunnableBase } from '../../../../../org/allbinary/game/layer/WaypointPathRunnableBase.js';
//not GWT import const WaypointPathRunnableBase

import { CollidableDestroyableDamageableLayer } from '../../../../../org/allbinary/game/layer/special/CollidableDestroyableDamageableLayer.js';
//not GWT import const CollidableDestroyableDamageableLayer

import { UnitWaypointStrings } from '../../../../../org/allbinary/game/layer/unit/UnitWaypointStrings.js';
//not GWT import const UnitWaypointStrings

import { TrackingEventHandler } from '../../../../../org/allbinary/game/tracking/TrackingEventHandler.js';
//not GWT import const TrackingEventHandler

import { GPoint } from '../../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { BasicColorFactory } from '../../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { AllBinaryLayer } from '../../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

import { AllBinaryLayerManager } from '../../../../../org/allbinary/layer/AllBinaryLayerManager.js';
//not GWT import const AllBinaryLayerManager

//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
type NullUtil<T = any, U = any> = typeof NullUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof NullUtil;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
type CommonSeps<T = any, U = any> = typeof CommonSeps extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonSeps;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

import { LayerDistanceUtil } from '../../../../../org/allbinary/math/LayerDistanceUtil.js';
//not GWT import const LayerDistanceUtil

import { BasicGeographicMap } from '../../../../../org/allbinary/media/graphics/geography/map/BasicGeographicMap.js';
//not GWT import const BasicGeographicMap

import { GeographicMapCellPosition } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPosition.js';
//not GWT import const GeographicMapCellPosition

import { GeographicMapCompositeInterface } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCompositeInterface.js';
//not GWT import const GeographicMapCompositeInterface

import { SimpleGeographicMapCellPositionFactory } from '../../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory

import { PathFindingThreadPool } from '../../../../../org/allbinary/thread/PathFindingThreadPool.js';
//not GWT import const PathFindingThreadPool

import { ThreadPool } from '../../../../../org/allbinary/thread/ThreadPool.js';
//not GWT import const ThreadPool

import { TimeDelayHelper } from '../../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
type BasicArrayListUtil<T = any, U = any> = typeof BasicArrayListUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDWaypointBehavior } from './GDWaypointBehavior.js';
//not GWT import - same folder const GDWaypointBehavior
import { WaypointBase } from './WaypointBase.js';
//not GWT import - same folder const WaypointBase
//import { BuildingSteeringVisitor } from './BuildingSteeringVisitor.js';
//not GWT import - same folder const BuildingSteeringVisitor
type BuildingSteeringVisitor = InstanceType<GDWaypointBehavior2['BuildingSteeringVisitor']>;

export class GDWaypointBehavior2 extends GDWaypointBehavior {
        

    private static readonly TARGET_DISTANCE: string = "Target Distance";

    private static readonly TARGET_LAYER: string = "Target Layer";

    private static readonly runningWaypointPathList: BasicArrayList = new BasicArrayListD();

//inner= member=true isStatic=
BuildingSteeringVisitor = (() => { const outer$GDWaypointBehavior2 = this; return class extends SteeringVisitor {
        
/*Static stuff is not allowed for TypeScript inner classes*//**/


    private readonly positionList: BasicArrayList = new BasicArrayListD();

    public visit(anyType: any): any{

 try { 
                        if(this.getList()!.size() > 0)
                        
                                    {
                                    
    let allbinaryLayer: AllBinaryLayer = this.getList()!.get(0) as AllBinaryLayer;;
    

    let cellPosition: GeographicMapCellPosition = this.getPositionList()!.get(0) as GeographicMapCellPosition;;
    

    let clear: boolean = outer$GDWaypointBehavior2.buildingChase(allbinaryLayer, cellPosition)!;;
    

                        if(clear)
                        
                                    {
                                    this.getList()!.clear();
    
this.positionList!.clear();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!.NULL_OBJECT;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!.NULL_OBJECT;
    
 }
 catch (caught: any) {
 {
  const e = caught;
  

    let commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
logUtil!.put(commonStrings!.EXCEPTION, this, "visit", e);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!.NULL_OBJECT;
    

 }
   }
 
}


    public getPositionList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.positionList;
    
}


}; })();
    private readonly unitWaypointStrings: UnitWaypointStrings = UnitWaypointStrings.getInstance()!;

    private readonly layerDistanceUtil: LayerDistanceUtil = LayerDistanceUtil.getInstance()!;

    private readonly pathFindingThreadPool: ThreadPool = PathFindingThreadPool.getInstance()!;

    private readonly targetWithoutSensors: boolean = true;

    private sensorRange: number = 0;

    private closeRange: number = 0;

    private readonly progressTimeDelayHelper: TimeDelayHelper;

    nextUnvisitedPathGeographicMapCellPositionP: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private afterNextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private readonly wanderPathsList: BasicArrayList;

    private readonly waypointPathRunnable: WaypointPathRunnableBase;

    private waitingOnTargetPath: boolean= false;

    private waitingOnWaypointPath: boolean= false;

    private targetWithoutCachedPathLayerInterface: CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance()!;

public constructor (ownerAdvancedRTSGameLayer: PathFindingLayerInterface, fakeWaypoint: CollidableDestroyableDamageableLayer){
            super(ownerAdvancedRTSGameLayer, fakeWaypoint);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.progressTimeDelayHelper= new TimeDelayHelper(5000);
    
this.wanderPathsList= new BasicArrayListD();
    
this.waypointPathRunnable= new WaypointPathRunnable();
    
}


    initRange(weaponRange: number){
super.initRange(weaponRange);
    
this.closeRange= weaponRange;
    
this.sensorRange= weaponRange *4;
    
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.initRange(this.associatedAdvancedRTSGameLayer, this.closeRange, this.sensorRange);
    
}


    public isRunning(): boolean{

                        if(this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    public processTick(allBinaryLayerManager: AllBinaryLayerManager){

                        if(this.waypointPathsListP == GDWaypointBehavior.DEFAULT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentGeographicMapCellHistory()!.getTotalVisited() > this.getCurrentGeographicMapCellHistory()!.getTotalNotVisited())
                        
                                    {
                                    this.updatePathOnTargetMove(this.unitWaypointStrings!.VISITED_MOST_OF_THE_PATH);
    

                                    }
                                

                        if(this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    
                        if(this.waypointPathsListP != GDWaypointBehavior2.runningWaypointPathList)
                        
                                    {
                                    this.waypointPathRunnable!.setRunning(false);
    

                        if(this.waitingOnTargetPath)
                        
                                    {
                                    this.setTargetPath();
    

                                    }
                                
                             else 
                        if(this.waitingOnWaypointPath)
                        
                                    {
                                    this.setWaypointPath(this.waypointPathRunnable!.getTargetLayer());
    

                                    }
                                
                        else {
                            


                            throw new Exception("Should not happen");
                    

                        }
                            

                                    }
                                
                        else {
                            this.updatePathOnTargetMove(this.unitWaypointStrings!.RETURNING_AS_WAYPOINT_PATH_LIST);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                        }
                            

                                    }
                                
this.processTargetList();
    

                        if(!this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    this.processWaypoint();
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                        }
                            

                        if(!this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    this.processTargeting();
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                        }
                            

                        if(!this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    this.teleportIfNoProgress();
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    onEnemyMovement(layerInterface: PathFindingLayerInterface){

    let anotherTargetDistance: number = this.layerDistanceUtil!.getDistance(this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer, layerInterface as CollidableDestroyableDamageableLayer)!;;
    

                        if(layerInterface == this.currentTargetLayerInterfaceP)
                        
                                    {
                                    this.setCurrentTargetDistance(anotherTargetDistance);
    

                                    }
                                
                        else {
                            this.processPossibleTarget(layerInterface, anotherTargetDistance);
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    processPossibleTarget(layerInterface: PathFindingLayerInterface, anotherTargetDistance: number){

    let isShorterThanCurrentTargetDistance: boolean = this.getCurrentTargetDistance() > anotherTargetDistance;;
    

    let isCurrentTargetDestroyed: boolean = this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && this.currentTargetLayerInterfaceP!.isDestroyed();;
    
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed);
    

                        if(this.isWaypointListEmptyOrOnlyTargets() && this.isInSensorRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processSetTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
    
this.setTargetWithDistance(layerInterface, anotherTargetDistance);
    

                                    }
                                
                             else 
                        if(this.isCloseRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processPossibleTargetCloser(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
    
this.setTargetWithDistance(layerInterface, anotherTargetDistance);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    teleportIfNoProgress(){

                        if(this.isTrackingWaypoint())
                        
                                    {
                                    
                        if(this.progressTimeDelayHelper!.isTimeTNT() && this.nextUnvisitedPathGeographicMapCellPositionP != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.teleportTo(this.nextUnvisitedPathGeographicMapCellPositionP);
    

                                    }
                                

                        if(this.getCompleteTimeDelayHelper()!.isTimeTNT())
                        
                                    {
                                    
    let geographicMapCellPosition: GeographicMapCellPosition = this.currentGeographicMapCellHistoryP!.getTracked()!.get(this.currentGeographicMapCellHistoryP!.getSize() -1) as GeographicMapCellPosition;;
    
this.associatedAdvancedRTSGameLayer!.teleportTo(geographicMapCellPosition);
    

                                    }
                                

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    public updatePathOnTargetMove(reason: string){

    let currentTargetLayerInterface: CollidableDestroyableDamageableLayer = this.currentTargetLayerInterfaceP;;
    

                        if(currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
    let geographicMapCellPosition: GeographicMapCellPosition = (currentTargetLayerInterface as PathFindingLayerInterface).getCurrentGeographicMapCellPosition()!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.currentTargetGeographicMapCellPosition != geographicMapCellPosition)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.targetMovedSoRetarget(this.associatedAdvancedRTSGameLayer);
    
this.setWaypointPathsList(GDWaypointBehavior.DEFAULT);
    
this.setTarget(currentTargetLayerInterface as PathFindingLayerInterface);
    

                                    }
                                
                        else {
                            
                        }
                            

                                    }
                                
                        else {
                            


                            throw new RuntimeException();
                    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    public setTarget(layerInterface: PathFindingLayerInterface){

    let anotherTargetDistance: number = this.layerDistanceUtil!.getDistance(this.associatedAdvancedRTSGameLayer as AllBinaryLayer, layerInterface as AllBinaryLayer)!;;
    
this.setTargetWithDistance(layerInterface, anotherTargetDistance);
    
}


                //@Throws(Exception.constructor)
            
    public setTargetWithDistance(layerInterface: PathFindingLayerInterface, anotherTargetDistance: number){
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.setTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.TARGET, BasicColorFactory.getInstance()!.GREEN);
    
this.associatedAdvancedRTSGameLayer!.setLoad(0);
    
this.setCurrentTargetDistance(anotherTargetDistance);
    
this.setCurrentTargetLayerInterface(layerInterface as CollidableDestroyableDamageableLayer);
    
this.setTrackingWaypoint(false);
    
this.targetListP!.clear();
    

                        if(!this.isCloseRange(layerInterface as CollidableDestroyableDamageableLayer, anotherTargetDistance) && this.canInsertWaypoint(0, this.currentTargetLayerInterfaceP))
                        
                                    {
                                    
    let geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!.getCurrentGeographicMapCellPosition()!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    let pathFindingLayerInterface: PathFindingLayerInterface = (this.currentTargetLayerInterfaceP as PathFindingLayerInterface);;
    

    let waypoint: WaypointBase = pathFindingLayerInterface!.getWaypointBehavior()!.getWaypoint()!;;
    

    let list: BasicArrayList = waypoint.getPathsListFromCacheOnly(geographicMapCellPosition)!;;
    
this.setWaypointPathsList(list);
    

                        if(this.waypointPathsListP == BasicArrayListUtil.getInstance()!.getImmutableInstance())
                        
                                    {
                                    this.targetWithoutCachedPathLayerInterface= this.currentTargetLayerInterfaceP;
    

                                    }
                                
                             else 
                        if(this.waypointPathsListP!.size() != 0)
                        
                                    {
                                    this.setTargetPath();
    

                                    }
                                

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    setTargetPath(){

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
                        if(this.currentTargetLayerInterfaceP!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.setTargetPath(this.associatedAdvancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.KILL, BasicColorFactory.getInstance()!.ORANGE);
    
this.clearTarget();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.currentTargetLayerInterfaceP == this.waypointPathRunnable!.getTargetLayer())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.setTargetPathIgnoreNewPath(this.associatedAdvancedRTSGameLayer, this);
    
this.insertWaypoint(0, this.currentTargetLayerInterfaceP);
    
this.setRandomGeographicMapCellHistory(this.waypointPathsListP);
    

                                    }
                                

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList: BasicArrayList){
this.setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION);
    
this.setNextUnvisitedPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION);
    
super.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    
}


                //@Throws(Exception.constructor)
            
    processWaypoint(){

    let size: number = this.targetListP!.size()!;;
    

                        if(size > 0)
                        
                                    {
                                    
    let targetLayer: PathFindingLayerInterface = this.targetListP!.get(0) as PathFindingLayerInterface;;
    
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processWaypoint(this.associatedAdvancedRTSGameLayer, this, targetLayer, size);
    

                        if(targetLayer!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.WAYPOINT_DESTROYED_SHORT, BasicColorFactory.getInstance()!.YELLOW);
    
this.removeWaypoint(targetLayer, this.unitWaypointStrings!.WAYPOINT_DESTROYED);
    

                                    }
                                
                        else {
                            
    let geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!.getCurrentGeographicMapCellPosition()!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.isTrackingWaypoint())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processWaypointTracked(this.associatedAdvancedRTSGameLayer, this);
    

                        if(this.visitIfAtMidPoint(geographicMapCellPosition))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processWaypointTrackedVisit(this.associatedAdvancedRTSGameLayer, geographicMapCellPosition);
    

                                    }
                                

                        if(this.currentGeographicMapCellHistoryP!.isAllVisited2() && this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    
    let oldWaypointLayer: PathFindingLayerInterface = this.currentTargetLayerInterfaceP as PathFindingLayerInterface;;
    
oldWaypointLayer!.getWaypointBehavior()!.getWaypoint()!.visit(this.associatedAdvancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.ALL_VISITED_SHORT, BasicColorFactory.getInstance()!.GREEN);
    
this.updatePathOnTargetMove(this.unitWaypointStrings!._ALL_VISITED_SHORT);
    

                                    }
                                

                                    }
                                
                             else 
                        if(this.currentTargetLayerInterfaceP == CollidableDestroyableDamageableLayer.getNullInstance() || this.waypointOverridesAttacking)
                        
                                    {
                                    
    let list: BasicArrayList = targetLayer!.getWaypointBehavior()!.getWaypoint()!.getPathsListFromCacheOnly(geographicMapCellPosition)!;;
    
this.setWaypointPathsList(list);
    

                        if(this.waypointPathsListP == BasicArrayListUtil.getInstance()!.getImmutableInstance())
                        
                                    {
                                    this.waitingOnWaypointPath= true;
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.THINKING, BasicColorFactory.getInstance()!.GREEN);
    
this.runWaypointPathTask(targetLayer);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
this.setWaypointPath(targetLayer);
    

                                    }
                                

                        }
                            

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    wander(){

                        if(this.currentGeographicMapCellHistoryP!.isAllVisited2())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.wander(this.associatedAdvancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.WANDERING, BasicColorFactory.getInstance()!.RED);
    
this.wanderPathsList!.clear();
    
this.wanderPathsList!.add(this.associatedAdvancedRTSGameLayer!.getSurroundingGeographicMapCellPositionList());
    
this.setRandomGeographicMapCellHistory(this.wanderPathsList);
    

                                    }
                                
this.visitIfAtMidPoint(this.getCurrentPathGeographicMapCellPosition());
    
this.updateCurrentPathGeographicMapCellPosition();
    
this.associatedAdvancedRTSGameLayer!.trackTo(this.unitWaypointStrings!.NEXT_PATH_NODE);
    
}


    visitIfAtMidPoint(geographicMapCellPosition: GeographicMapCellPosition): boolean{

    let unitLayer: CollidableDestroyableDamageableLayer = this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer;;
    

                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && this.nextUnvisitedPathGeographicMapCellPositionP == geographicMapCellPosition)
                        
                                    {
                                    
    let point: GPoint = geographicMapCellPosition!.getMidPoint()!;;
    

    let afterNextPoint: GPoint = this.afterNextUnvisitedPathGeographicMapCellPosition!.getMidPoint()!;;
    

    let beyondMidPoint: boolean = true;;
    

                        if(geographicMapCellPosition!.getColumn() == this.afterNextUnvisitedPathGeographicMapCellPosition!.getColumn())
                        
                                    {
                                    
                                    }
                                
                             else 
                        if(point.getX() < afterNextPoint!.getX())
                        
                                    {
                                    
                        if(unitLayer!.getXP() +unitLayer!.getHalfWidth() < point.getX())
                        
                                    {
                                    beyondMidPoint= false;
    

                                    }
                                

                                    }
                                
                        else {
                            
                        if(unitLayer!.getXP() +unitLayer!.getHalfWidth() > point.getX())
                        
                                    {
                                    beyondMidPoint= false;
    

                                    }
                                

                        }
                            

                        if(geographicMapCellPosition!.getRow() == this.afterNextUnvisitedPathGeographicMapCellPosition!.getRow())
                        
                                    {
                                    
                                    }
                                
                             else 
                        if(point.getY() < afterNextPoint!.getY())
                        
                                    {
                                    
                        if(unitLayer!.getYP() +unitLayer!.getHalfHeight() < point.getY())
                        
                                    {
                                    beyondMidPoint= false;
    

                                    }
                                

                                    }
                                
                        else {
                            
                        if(unitLayer!.getYP() +unitLayer!.getHalfHeight() > point.getY())
                        
                                    {
                                    beyondMidPoint= false;
    

                                    }
                                

                        }
                            

                        if(beyondMidPoint)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentGeographicMapCellHistoryP!.visit(geographicMapCellPosition);;
    

                                    }
                                

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    processTargetList(){




                        for (
    let index: number = this.getPossibleTargetList()!.size() -1;index >= 0; index--)
        {

    let layerInterface: PathFindingLayerInterface = this.getPossibleTargetList()!.get(index) as PathFindingLayerInterface;;
    

                        if(layerInterface!.isDestroyed())
                        
                                    {
                                    this.getPossibleTargetList()!.remove(layerInterface);
    

                                    }
                                
                        else {
                            this.onEnemyMovement(layerInterface);
    

                        }
                            
}


                        if(this.targetWithoutCachedPathLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    this.waitingOnTargetPath= true;
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.THINKING_ABOUT_TARGET, BasicColorFactory.getInstance()!.GREEN);
    
this.runWaypointPathTask(this.currentTargetLayerInterfaceP as PathFindingLayerInterface);
    
this.targetWithoutCachedPathLayerInterface= CollidableDestroyableDamageableLayer.getNullInstance();
    

                                    }
                                
this.getPossibleTargetList()!.clear();
    
}


                //@Throws(Exception.constructor)
            
    processTargeting(){

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && (this.isInSensorRange(this.currentTargetLayerInterfaceP, this.getCurrentTargetDistance()) || this.isTrackingWaypoint() || this.targetWithoutSensors))
                        
                                    {
                                    
                        if(this.currentTargetLayerInterfaceP!.isDestroyed())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.targetDestroyed(this.associatedAdvancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.KILL, BasicColorFactory.getInstance()!.ORANGE);
    
this.clearTarget();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    let dx: number = 0;;
    

    let dy: number = 0;;
    

    let associatedAdvancedRTSGameLayer2: CollidableDestroyableDamageableLayer = this.associatedAdvancedRTSGameLayer as CollidableDestroyableDamageableLayer;;
    

                        if(this.isTrackingWaypoint())
                        
                                    {
                                    this.updateCurrentPathGeographicMapCellPosition();
    

    let point: GPoint = this.nextUnvisitedPathGeographicMapCellPositionP!.getMidPoint()!;;
    

    let geographicMapCompositeInterface: GeographicMapCompositeInterface = associatedAdvancedRTSGameLayer2!.allBinaryGameLayerManagerP as GeographicMapCompositeInterface;;
    

    let geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface!.getGeographicMapInterface()[0]!;;
    

    let tiledLayer: AllBinaryTiledLayer = geographicMapInterface!.getAllBinaryTiledLayer()!;;
    
dx= associatedAdvancedRTSGameLayer2!.getXP() +associatedAdvancedRTSGameLayer2!.getHalfWidth() -point.getX() +tiledLayer!.getXP();
    
dy= associatedAdvancedRTSGameLayer2!.getYP() +associatedAdvancedRTSGameLayer2!.getHalfHeight() -point.getY() +tiledLayer!.getYP();
    
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processTargeting(this.associatedAdvancedRTSGameLayer, dx, dy);
    

                                    }
                                
                        else {
                            this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.processTargetingNonWayPoint(this.associatedAdvancedRTSGameLayer, dx, dy);
    
dx= (associatedAdvancedRTSGameLayer2!.getXP() +associatedAdvancedRTSGameLayer2!.getHalfWidth()) -(this.currentTargetLayerInterfaceP!.getXP() +this.currentTargetLayerInterfaceP!.getHalfWidth());
    
dy= (associatedAdvancedRTSGameLayer2!.getYP() +associatedAdvancedRTSGameLayer2!.getHalfHeight()) -(this.currentTargetLayerInterfaceP!.getYP() +this.currentTargetLayerInterfaceP!.getHalfHeight());
    

                        }
                            
this.associatedAdvancedRTSGameLayer!.trackToDXY(dx, dy);
    

                                    }
                                
                        else {
                            
                        if(this.associatedAdvancedRTSGameLayer!.isShowMoreCaptionStates())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.STOP, BasicColorFactory.getInstance()!.YELLOW);
    

                                    }
                                
this.associatedAdvancedRTSGameLayer!.allStop();
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    updateCurrentPathGeographicMapCellPosition(){
this.setLastPathGeographicMapCellPosition(this.getCurrentPathGeographicMapCellPosition());
    
this.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer!.getCurrentGeographicMapCellPosition());
    
this.setNextUnvisitedPathGeographicMapCellPosition(this.currentGeographicMapCellHistoryP!.getFirstUnvisited());
    
this.afterNextUnvisitedPathGeographicMapCellPosition= this.currentGeographicMapCellHistoryP!.getAfterIfNotLast(this.nextUnvisitedPathGeographicMapCellPositionP);
    

                        if(this.getCurrentPathGeographicMapCellPosition() != this.nextUnvisitedPathGeographicMapCellPositionP)
                        
                                    {
                                    this.progressTimeDelayHelper!.setStartTimeTNT();
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    setWaypointPath(waypointLayer: PathFindingLayerInterface){

                        if(this.waypointPathsListP!.size() != 0)
                        
                                    {
                                    this.setCurrentTargetLayerInterface(waypointLayer as CollidableDestroyableDamageableLayer);
    
this.setCurrentTargetDistance(.MAX_VALUE());
    
this.setRandomGeographicMapCellHistory(this.waypointPathsListP);
    

                                    }
                                
                        else {
                            waypointLayer!.getWaypointBehavior()!.getWaypoint()!.visit(this.associatedAdvancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.ALREADY_THERE_SHORT, BasicColorFactory.getInstance()!.YELLOW);
    
this.updatePathOnTargetMove(this.unitWaypointStrings!._ALREADY_THERE_SHORT);
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    runWaypointPathTask(waypointLayer: PathFindingLayerInterface){
this.setWaypointPathsList(GDWaypointBehavior2.runningWaypointPathList);
    

                        if(this.waypointPathRunnable!.isRunning())
                        
                                    {
                                    


                            throw new Exception("Should never be running here");
                    

                                    }
                                
this.waypointPathRunnable!.setRunning(true);
    
this.waypointPathRunnable!.setUnitLayer(this.associatedAdvancedRTSGameLayer);
    
this.waypointPathRunnable!.setTargetLayer(waypointLayer);
    
this.pathFindingThreadPool!.runTaskWithPriority(this.waypointPathRunnable);
    
}


                //@Throws(Exception.constructor)
            
    removeWaypoint(waypointLayer: PathFindingLayerInterface, reason: string){
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.removeWaypoint(this.associatedAdvancedRTSGameLayer, this, waypointLayer, reason);
    
this.targetListP!.remove(waypointLayer);
    
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.removeWaypointList(this.associatedAdvancedRTSGameLayer, this, this.targetListP);
    

                        if(this.currentTargetLayerInterfaceP == waypointLayer)
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.removeWaypointClear(this.associatedAdvancedRTSGameLayer);
    
this.clearTarget();
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    public clearTarget(){
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.clearTarget(this.associatedAdvancedRTSGameLayer);
    
this.setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance());
    
this.setTrackingWaypoint(false);
    
this.setCurrentTargetDistance(.MAX_VALUE());
    
TrackingEventHandler.getInstance()!.fireEvent(this.associatedAdvancedRTSGameLayer!.getTrackingEvent());
    
}


    public isWaypointListEmptyOrOnlyTargets(): boolean{

    let list: BasicArrayList = this.targetListP;;
    

                        if(list.size() == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                




                        for (
    let index: number = list.size() -1;index >= 0; index--)
        {

    let layerInterface: PathFindingLayerInterface = list.get(index) as PathFindingLayerInterface;;
    

                        if(layerInterface!.isWaypointListEmptyOrOnlyTargets())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    isCloseRange(layerInterface: CollidableDestroyableDamageableLayer, targetDistance: number): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return targetDistance < this.closeRange +layerInterface!.getHalfHeight();
    
}


    public isInSensorRange(layerInterface: CollidableDestroyableDamageableLayer, targetDistance: number): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return targetDistance < this.sensorRange +layerInterface!.getHalfHeight();
    
}


    public getCurrentTargetingStateString(): string{

    let stringBuffer: StringMaker = new StringMaker();;
    

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    stringBuffer!.append(GDWaypointBehavior2.TARGET_LAYER);
    
stringBuffer!.append(CommonSeps.getInstance()!.SPACE);
    
stringBuffer!.append(this.currentTargetLayerInterfaceP!.getName());
    
stringBuffer!.append(" with");
    
stringBuffer!.append(CommonSeps.getInstance()!.SPACE);
    
stringBuffer!.append(GDWaypointBehavior2.TARGET_DISTANCE);
    
stringBuffer!.append(CommonSeps.getInstance()!.SPACE);
    
stringBuffer!.appendint(this.getCurrentTargetDistance());
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!.toString();;
    
}


                //@Throws(Exception.constructor)
            
    addWaypointFromUser(advancedRTSGameLayer: PathFindingLayerInterface){

                        if(advancedRTSGameLayer!.isDestroyed())
                        
                                    {
                                    


                            throw new Exception("Trying to add a dead: " +advancedRTSGameLayer);
                    

                                    }
                                
this.associatedAdvancedRTSGameLayer!.getWaypoint2LogHelper()!.addWaypointFromUser(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
    
this.targetListP!.clear();
    
this.targetListP!.add(advancedRTSGameLayer);
    
this.clearTarget();
    
}


    private readonly buildingSteeringVisitor = new this.BuildingSteeringVisitor();

                //@Throws(Exception.constructor)
            
    public addBuildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition){

                        if(!this.buildingSteeringVisitor!.getList()!.contains(allbinaryLayer))
                        
                                    {
                                    this.buildingSteeringVisitor!.getList()!.add(allbinaryLayer);
    
this.buildingSteeringVisitor!.getPositionList()!.add(cellPosition);
    

                                    }
                                

                        if(!this.getSteeringVisitorList()!.contains(this.buildingSteeringVisitor))
                        
                                    {
                                    this.getSteeringVisitorList()!.add(this.buildingSteeringVisitor);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    buildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.associatedAdvancedRTSGameLayer!.buildingChase(allbinaryLayer, cellPosition);;
    
}


    public getNextUnvisitedPathGeographicMapCellPosition(): GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.nextUnvisitedPathGeographicMapCellPositionP;
    
}


    public setNextUnvisitedPathGeographicMapCellPosition(nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition){
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.setNextUnvisitedPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.nextUnvisitedPathGeographicMapCellPositionP, nextUnvisitedPathGeographicMapCellPosition);
    
this.nextUnvisitedPathGeographicMapCellPositionP= nextUnvisitedPathGeographicMapCellPosition;
    
}


}

