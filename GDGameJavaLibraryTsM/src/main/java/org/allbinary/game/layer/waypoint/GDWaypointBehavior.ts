
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { PrimaryWaypointHelper } from '../../../../../org/allbinary/game/input/form/PrimaryWaypointHelper.js';
//not GWT import const PrimaryWaypointHelper

import { PathFindingLayerInterface } from '../../../../../org/allbinary/game/layer/PathFindingLayerInterface.js';
//not GWT import const PathFindingLayerInterface

import { RTSLayerEvent } from '../../../../../org/allbinary/game/layer/RTSLayerEvent.js';
//not GWT import const RTSLayerEvent

import { SensorAction } from '../../../../../org/allbinary/game/layer/SensorAction.js';
//not GWT import const SensorAction

import { SensorActionFactory } from '../../../../../org/allbinary/game/layer/SensorActionFactory.js';
//not GWT import const SensorActionFactory

import { WaypointBehaviorBase } from '../../../../../org/allbinary/game/layer/WaypointBehaviorBase.js';
//not GWT import const WaypointBehaviorBase

import { CollidableDestroyableDamageableLayer } from '../../../../../org/allbinary/game/layer/special/CollidableDestroyableDamageableLayer.js';
//not GWT import const CollidableDestroyableDamageableLayer

import { WaypointEventListenerInterface } from '../../../../../org/allbinary/game/layer/waypoint/event/WaypointEventListenerInterface.js';
//not GWT import const WaypointEventListenerInterface

import { BasicColorFactory } from '../../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { AllBinaryLayer } from '../../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { AllBinaryEventObject } from '../../../../../org/allbinary/logic/util/event/AllBinaryEventObject.js';
//not GWT import const AllBinaryEventObject

import { EventStrings } from '../../../../../org/allbinary/logic/util/event/EventStrings.js';
//not GWT import const EventStrings

import { GeographicMapCellHistory } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellHistory.js';
//not GWT import const GeographicMapCellHistory

import { GeographicMapCellPosition } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPosition.js';
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
        
export class GDWaypointBehavior extends WaypointBehaviorBase implements WaypointEventListenerInterface {
        

    static readonly DEFAULT: BasicArrayList = new ImmutableBasicArrayList("DefaultAndImmutable", 0);

    private static readonly PATHING: string = "Pathing";

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private longWeaponRange: number = 0;

    private sensorAction: SensorAction = SensorActionFactory.getInstance()!.ATTACK;

    private readonly completeTimeDelayHelper: TimeDelayHelper;

    currentGeographicMapCellHistory: GeographicMapCellHistory;

    private lastPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private currentPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private readonly FAKE_WAYPOINT_LAYER: CollidableDestroyableDamageableLayer;

    readonly targetList: BasicArrayList;

    private moving: boolean = false;

    private movingFromStopped: boolean = false;

    waypointPathsList: BasicArrayList = BasicArrayListUtil.getInstance()!.getImmutableInstance()!;

    private readonly possibleTargetList: BasicArrayList;

    private currentTargetDistance: number = Integer.MAX_VALUE;

    currentTargetLayerInterface: CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance()!;

    currentTargetGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private trackingWaypoint: boolean= false;

    readonly associatedAdvancedRTSGameLayer: PathFindingLayerInterface;

protected constructor (associatedAdvancedRTSGameLayer: PathFindingLayerInterface, fakeWaypoint: CollidableDestroyableDamageableLayer){

            super();
        this.associatedAdvancedRTSGameLayer= associatedAdvancedRTSGameLayer;
    
this.completeTimeDelayHelper= new TimeDelayHelper(30000);
    
this.targetList= new BasicArrayListD();
    
this.possibleTargetList= new BasicArrayListD();
    
this.setWaypointPathsList(GDWaypointBehavior.DEFAULT);
    
this.currentGeographicMapCellHistory= new GeographicMapCellHistory();
    
this.FAKE_WAYPOINT_LAYER= fakeWaypoint;
    
}


    initRange(weaponRange: number){
this.longWeaponRange= weaponRange /2;
    
}


    public onEvent(eventObject: AllBinaryEventObject){
ForcedLogUtil.log(EventStrings.getInstance()!.PERFORMANCE_MESSAGE, this);
    
}


                //@Throws(Exception.constructor)
            
    public onWaypointEvent(event: RTSLayerEvent){

    var advancedRTSGameLayer: PathFindingLayerInterface = event.getRtsLayer() as PathFindingLayerInterface;;
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.onWaypointEvent(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
    

                        if(this.associatedAdvancedRTSGameLayer!.isSelected())
                        
                                    {
                                    this.addWaypointFromUser(advancedRTSGameLayer);
    

                                    }
                                
                             else 
                        if(advancedRTSGameLayer!.shouldAddWaypointFromBuilding())
                        
                                    {
                                    this.addWaypointFromBuilding(advancedRTSGameLayer);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    addWaypointFromUser(advancedRTSGameLayer: PathFindingLayerInterface){
}


                //@Throws(Exception.constructor)
            
    addWaypointFromBuilding(advancedRTSGameLayer: PathFindingLayerInterface){

                        if(advancedRTSGameLayer == PrimaryWaypointHelper.getInstance()!.getWaypointLayer() || advancedRTSGameLayer!.getParentLayer() == this.associatedAdvancedRTSGameLayer!.getParentLayer())
                        
                                    {
                                    
                        if(!this.targetList!.contains(advancedRTSGameLayer))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
    

                        if(advancedRTSGameLayer!.isDestroyed())
                        
                                    {
                                    


                            throw new Exception("Trying to add a dead: " +advancedRTSGameLayer);
                    

                                    }
                                
this.targetList!.add(advancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.addWaypointFromBuildingList(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.targetList);
    

                                    }
                                

                                    }
                                
}


    public isWaypointListEmptyOrOnlyTargets(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public insertWaypoint(index: number, rtsLayer: CollidableDestroyableDamageableLayer): boolean{

                        if(this.canInsertWaypoint(index, rtsLayer))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.insertWaypoint(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName());
    

                        if(rtsLayer!.isDestroyed())
                        
                                    {
                                    


                            throw new Exception("Trying to add a dead: " +rtsLayer);
                    

                                    }
                                
this.targetList!.addAt(index, rtsLayer);
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.insertWaypointList(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName(), this.targetList);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    move(){

                        if(this.isMoving())
                        
                                    {
                                    this.setMovingFromStopped(false);
    

                                    }
                                
                        else {
                            this.setMovingFromStopped(true);
    

                        }
                            
this.setMoving(false);
    
}


                //@Throws(Exception.constructor)
            
    setRandomGeographicMapCellHistory(pathsList: BasicArrayList){

                        if(pathsList == BasicArrayListUtil.getInstance()!.getImmutableInstance())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.setRandomGeographicMapCellHistory(this.associatedAdvancedRTSGameLayer);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var size: number = pathsList!.size()!;;
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.setRandomGeographicMapCellHistoryList(this.associatedAdvancedRTSGameLayer, pathsList);
    

                        if(size > 0)
                        
                                    {
                                    
    var geographicMapCellPositionBasicArrayList: BasicArrayList = BasicArrayListUtil.getInstance()!.getRandom(pathsList) as BasicArrayList;;
    
this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList: BasicArrayList){
this.lastPathGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                        if(this.associatedAdvancedRTSGameLayer!.isShowMoreCaptionStates())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(GDWaypointBehavior.PATHING, BasicColorFactory.getInstance()!.GREEN);
    

                                    }
                                
this.currentGeographicMapCellHistory!.init();
    
this.associatedAdvancedRTSGameLayer!.init(this.currentGeographicMapCellHistory, geographicMapCellPositionBasicArrayList);
    
this.setTrackingWaypoint(true);
    
this.getCompleteTimeDelayHelper()!.setStartTimeTNT();
    
}


    canInsertWaypoint(index: number, rtsLayer: CollidableDestroyableDamageableLayer): boolean{

                        if(this.targetList!.size() > 4)
                        
                                    {
                                    
                                    }
                                
                             else 
                        if(this.targetList!.contains(rtsLayer))
                        
                                    {
                                    
                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public addBuildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition){
}


                //@Throws(Exception.constructor)
            
    moveAwayFromBuilding(buildingLayer: PathFindingLayerInterface){

    var geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!.getCurrentGeographicMapCellPosition()!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var list: BasicArrayList = buildingLayer!.getGeographicMapCellPositionArea()!.getOccupyingGeographicMapCellPositionList()!;;
    

                        if(list.contains(geographicMapCellPosition))
                        
                                    {
                                    
                        if(this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.moveAwayFromBuilding(this.associatedAdvancedRTSGameLayer);
    
this.setCurrentTargetLayerInterface(this.FAKE_WAYPOINT_LAYER as CollidableDestroyableDamageableLayer);
    

    var pathsList: BasicArrayList = buildingLayer!.getMoveOutOfBuildAreaPath(geographicMapCellPosition)!;;
    
this.associatedAdvancedRTSGameLayer!.setClosestGeographicMapCellHistory(pathsList);
    

                                    }
                                

                                    }
                                
}


    private readonly repeatedToLong: TimeDelayHelper = new TimeDelayHelper(22000);

    public needToMove(): boolean{
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.needToMove(this.associatedAdvancedRTSGameLayer, this);
    

                        if(this.isTrackingWaypoint() || this.sensorAction == SensorActionFactory.getInstance()!.EVADE || (this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentTargetDistance() >= this.longWeaponRange +this.currentTargetLayerInterface!.getHalfHeight()))
                        
                                    {
                                    this.repeatedToLong!.setStartTimeTNT();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                

                        if(this.repeatedToLong!.isTimeTNT())
                        
                                    {
                                    
    var message: string = "Repeating too long: " +this.getMovementLogicAsString();;
    
ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer);
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    public getMovementLogicAsString(): string{

    var stringBuffer: StringMaker = new StringMaker();;
    
stringBuffer!.append("isTrackingWaypoint: ");
    
stringBuffer!.appendboolean(this.isTrackingWaypoint());
    
stringBuffer!.append(" sensorAction: ");
    
stringBuffer!.append(this.sensorAction!.name);
    
stringBuffer!.append(" getCurrentTargetLayerInterface: ");
    
stringBuffer!.append(StringUtil.getInstance()!.toString(this.currentTargetLayerInterface));
    

                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    stringBuffer!.append(" Target Range: ");
    
stringBuffer!.appendint(this.getCurrentTargetDistance());
    
stringBuffer!.append(" >= ");
    
stringBuffer!.appendint(this.longWeaponRange +this.currentTargetLayerInterface!.getHalfHeight());
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!.toString();;
    
}


    public isMovingFromStopped(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.movingFromStopped;
    
}


    setMovingFromStopped(movingFromStopped: boolean){
this.movingFromStopped= movingFromStopped;
    
}


    public setWaypointPathsList(waypointPathsList: BasicArrayList){
this.waypointPathsList= waypointPathsList;
    
}


    public getWaypointPathsList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.waypointPathsList;
    
}


    isMoving(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.moving;
    
}


    setMoving(moving: boolean){
this.moving= moving;
    
}


    public isTrackingWaypoint(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.trackingWaypoint;
    
}


    getPossibleTargetList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.possibleTargetList;
    
}


    setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition: GeographicMapCellPosition){
this.lastPathGeographicMapCellPosition= lastPathGeographicMapCellPosition;
    
}


    getLastPathGeographicMapCellPosition(): GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.lastPathGeographicMapCellPosition;
    
}


    setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition: GeographicMapCellPosition){
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.setCurrentPathGeographicMapCellPosition(this.associatedAdvancedRTSGameLayer, this.currentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition);
    
this.currentPathGeographicMapCellPosition= currentPathGeographicMapCellPosition;
    
}


    public getCurrentPathGeographicMapCellPosition(): GeographicMapCellPosition{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentPathGeographicMapCellPosition;
    
}


    setSensorAction(sensorAction: SensorAction){
this.sensorAction= sensorAction;
    
}


    getSensorAction(): SensorAction{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.sensorAction;
    
}


    getTargetList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.targetList;
    
}


                //@Throws(Exception.constructor)
            
    setCurrentTargetLayerInterface(currentTargetLayerInterface: CollidableDestroyableDamageableLayer){
this.currentTargetLayerInterface= currentTargetLayerInterface;
    

                        if(this.currentTargetLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    this.currentTargetGeographicMapCellPosition= (currentTargetLayerInterface as PathFindingLayerInterface).getCurrentGeographicMapCellPosition();
    

                                    }
                                
                        else {
                            this.currentTargetGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                        }
                            
}


    public getCurrentTargetLayerInterface(): CollidableDestroyableDamageableLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentTargetLayerInterface;
    
}


    setCurrentTargetDistance(currentTargetDistance: number){
this.currentTargetDistance= currentTargetDistance;
    
}


    getCurrentTargetDistance(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentTargetDistance;
    
}


    getCompleteTimeDelayHelper(): TimeDelayHelper{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.completeTimeDelayHelper;
    
}


    public getCurrentGeographicMapCellHistory(): GeographicMapCellHistory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentGeographicMapCellHistory;
    
}


    setTrackingWaypoint(trackingWaypoint: boolean){
this.trackingWaypoint= trackingWaypoint;
    
}


}



