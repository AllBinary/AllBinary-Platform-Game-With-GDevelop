
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

import { UnitWaypointStrings } from '../../../../../org/allbinary/game/layer/unit/UnitWaypointStrings.js';
//not GWT import const UnitWaypointStrings

import { WaypointEventListenerInterface } from '../../../../../org/allbinary/game/layer/waypoint/event/WaypointEventListenerInterface.js';
//not GWT import const WaypointEventListenerInterface

import { BasicColorFactory } from '../../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { AllBinaryLayer } from '../../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;
type ForcedLogUtil<T = any, U = any> = typeof ForcedLogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ForcedLogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

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
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
type BasicArrayListUtil<T = any, U = any> = typeof BasicArrayListUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListUtil;

//not plain js import { ImmutableBasicArrayList } 
const ImmutableBasicArrayList = globalThis.org.allbinary.util.ImmutableBasicArrayList;
type ImmutableBasicArrayList<T = any, U = any> = typeof ImmutableBasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ImmutableBasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDWaypointBehavior extends WaypointBehaviorBase implements WaypointEventListenerInterface {
        

    static readonly DEFAULT: BasicArrayList = new ImmutableBasicArrayList("DefaultAndImmutable", 0);

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly unitWaypointStrings: UnitWaypointStrings = UnitWaypointStrings.getInstance()!;

    private longWeaponRange: number = 0;

    private sensorAction: SensorAction = SensorActionFactory.getInstance()!.ATTACK;

    private readonly completeTimeDelayHelper: TimeDelayHelper;

    currentGeographicMapCellHistoryP: GeographicMapCellHistory;

    private lastPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private currentPathGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private readonly FAKE_WAYPOINT_LAYER: CollidableDestroyableDamageableLayer;

    readonly targetListP: BasicArrayList;

    private moving: boolean = false;

    private movingFromStopped: boolean = false;

    waypointPathsListP: BasicArrayList = BasicArrayListUtil.getInstance()!.getImmutableInstance()!;

    private readonly possibleTargetList: BasicArrayList;

    private currentTargetDistance: number = Integer.MAX_VALUE;

    currentTargetLayerInterfaceP: CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance()!;

    currentTargetGeographicMapCellPosition: GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;

    private trackingWaypoint: boolean= false;

    readonly associatedAdvancedRTSGameLayer: PathFindingLayerInterface;

protected constructor (associatedAdvancedRTSGameLayer: PathFindingLayerInterface, fakeWaypoint: CollidableDestroyableDamageableLayer){

            super();
        this.associatedAdvancedRTSGameLayer= associatedAdvancedRTSGameLayer;
    
this.completeTimeDelayHelper= new TimeDelayHelper(30000);
    
this.targetListP= new BasicArrayListD();
    
this.possibleTargetList= new BasicArrayListD();
    
this.setWaypointPathsList(GDWaypointBehavior.DEFAULT);
    
this.currentGeographicMapCellHistoryP= new GeographicMapCellHistory();
    
this.FAKE_WAYPOINT_LAYER= fakeWaypoint;
    
}


    initRange(weaponRange: number){
this.longWeaponRange= globalThis.Math.trunc(weaponRange /2);
    
}


    public onEvent(eventObject: AllBinaryEventObject){
ForcedLogUtil.log(EventStrings.getInstance()!.PERFORMANCE_MESSAGE, this);
    
}


                //@Throws(Exception.constructor)
            
    public onWaypointEvent(event: RTSLayerEvent){

    let advancedRTSGameLayer: PathFindingLayerInterface = event.getRtsLayer() as PathFindingLayerInterface;;
    
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
                                    
                        if(!this.targetListP!.contains(advancedRTSGameLayer))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
    

                        if(advancedRTSGameLayer!.isDestroyed())
                        
                                    {
                                    


                            throw new Exception("Trying to add a dead: " +advancedRTSGameLayer);
                    

                                    }
                                
this.targetListP!.add(advancedRTSGameLayer);
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.addWaypointFromBuildingList(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.targetListP);
    

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
                                
this.targetListP!.addAt(index, rtsLayer);
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.insertWaypointList(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName(), this.targetListP);
    



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
                                

    let size: number = pathsList!.size()!;;
    
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.setRandomGeographicMapCellHistoryList(this.associatedAdvancedRTSGameLayer, pathsList);
    

                        if(size > 0)
                        
                                    {
                                    
    let geographicMapCellPositionBasicArrayList: BasicArrayList = BasicArrayListUtil.getInstance()!.getRandom(pathsList) as BasicArrayList;;
    
this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList: BasicArrayList){
this.lastPathGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                        if(this.associatedAdvancedRTSGameLayer!.isShowMoreCaptionStates())
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getCaptionAnimationHelper()!.update(this.unitWaypointStrings!.PATHING, BasicColorFactory.getInstance()!.GREEN);
    

                                    }
                                
this.currentGeographicMapCellHistoryP!.init();
    
this.associatedAdvancedRTSGameLayer!.init(this.currentGeographicMapCellHistoryP, geographicMapCellPositionBasicArrayList);
    
this.setTrackingWaypoint(true);
    
this.getCompleteTimeDelayHelper()!.setStartTimeTNT();
    
}


    canInsertWaypoint(index: number, rtsLayer: CollidableDestroyableDamageableLayer): boolean{

                        if(this.targetListP!.size() > 4)
                        
                                    {
                                    
                                    }
                                
                             else 
                        if(this.targetListP!.contains(rtsLayer))
                        
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

    let geographicMapCellPosition: GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer!.getCurrentGeographicMapCellPosition()!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    let list: BasicArrayList = buildingLayer!.getGeographicMapCellPositionArea()!.getOccupyingGeographicMapCellPositionList()!;;
    

                        if(list.contains(geographicMapCellPosition))
                        
                                    {
                                    
                        if(this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER))
                        
                                    {
                                    this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.moveAwayFromBuilding(this.associatedAdvancedRTSGameLayer);
    
this.setCurrentTargetLayerInterface(this.FAKE_WAYPOINT_LAYER as CollidableDestroyableDamageableLayer);
    

    let pathsList: BasicArrayList = buildingLayer!.getMoveOutOfBuildAreaPath(geographicMapCellPosition)!;;
    
this.associatedAdvancedRTSGameLayer!.setClosestGeographicMapCellHistory(pathsList);
    

                                    }
                                

                                    }
                                
}


    private readonly repeatedToLong: TimeDelayHelper = new TimeDelayHelper(22000);

    public needToMove(): boolean{
this.associatedAdvancedRTSGameLayer!.getWaypointLogHelper()!.needToMove(this.associatedAdvancedRTSGameLayer, this);
    

                        if(this.isTrackingWaypoint() || this.sensorAction == SensorActionFactory.getInstance()!.EVADE || (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentTargetDistance() >= this.longWeaponRange +this.currentTargetLayerInterfaceP!.getHalfHeight()))
                        
                                    {
                                    this.repeatedToLong!.setStartTimeTNT();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                

                        if(this.repeatedToLong!.isTimeTNT())
                        
                                    {
                                    
    let message: string = "Repeating too long: " +this.getMovementLogicAsString();;
    
ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer);
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    public getMovementLogicAsString(): string{

    let stringBuffer: StringMaker = new StringMaker();;
    
stringBuffer!.append("isTrackingWaypoint: ");
    
stringBuffer!.appendboolean(this.isTrackingWaypoint());
    
stringBuffer!.append(" sensorAction: ");
    
stringBuffer!.append(this.sensorAction!.name);
    
stringBuffer!.append(" getCurrentTargetLayerInterface: ");
    
stringBuffer!.append(StringUtil.getInstance()!.toString(this.currentTargetLayerInterfaceP));
    

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    stringBuffer!.append(" Target Range: ");
    
stringBuffer!.appendint(this.getCurrentTargetDistance());
    
stringBuffer!.append(" >= ");
    
stringBuffer!.appendint(this.longWeaponRange +this.currentTargetLayerInterfaceP!.getHalfHeight());
    

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
this.waypointPathsListP= waypointPathsList;
    
}


    public getWaypointPathsList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.waypointPathsListP;
    
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
                        return this.targetListP;
    
}


                //@Throws(Exception.constructor)
            
    setCurrentTargetLayerInterface(currentTargetLayerInterface: CollidableDestroyableDamageableLayer){
this.currentTargetLayerInterfaceP= currentTargetLayerInterface;
    

                        if(this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance())
                        
                                    {
                                    this.currentTargetGeographicMapCellPosition= (currentTargetLayerInterfaceP as PathFindingLayerInterface).getCurrentGeographicMapCellPosition();
    

                                    }
                                
                        else {
                            this.currentTargetGeographicMapCellPosition= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                        }
                            
}


    public getCurrentTargetLayerInterface(): CollidableDestroyableDamageableLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.currentTargetLayerInterfaceP;
    
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
                        return this.currentGeographicMapCellHistoryP;
    
}


    setTrackingWaypoint(trackingWaypoint: boolean){
this.trackingWaypoint= trackingWaypoint;
    
}


}

