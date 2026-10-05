
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
                *  
                *  By agreeing to this license you and any business entity you represent are
                *  legally bound to the AllBinary Open License Version 1 legal agreement.
                *  
                *  You may obtain the AllBinary Open License Version 1 legal agreement from
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
                *  
                *  Created By: Travis Berthelot   
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layout




        import java.lang.Object        
        
        import java.lang.Integer
        
        import java.lang.Runnable
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.event.GameKeyEvent
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.input.motion.gesture.MotionGestureInput
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
import org.allbinary.logic.NullUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonStrings
import org.allbinary.thread.NullRunnable

open public class GDNode
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val nodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()!!

    var currentRunnable: Runnable = NullRunnable.getInstance()!!

    private val name: Int
public constructor (name: Int)
            : super()
        {
    //var name = name
this.name= name
this.init()
}


    open fun init()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{
this.currentRunnable= NullRunnable.getInstance()
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun process(objecArray: Array<Any?>, intArray: IntArray, longArray: LongArray, floatArray: FloatArray)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var objecArray = objecArray
    //var intArray = intArray
    //var longArray = longArray
    //var floatArray = floatArray



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun processStats()
        //nullable = true from not(false or (false and true)) = true
{
this.nodeStatsFactory!!.push(2, this.name)
}


    open fun processStatsE()
        //nullable = true from not(false or (false and true)) = true
{
this.nodeStatsFactory!!.push(3, this.name)
}


                @Throws(Exception::class)
            
    open fun processReleased()
        //nullable = true from not(false or (false and true)) = true
: Boolean{
this.processReleasedStats()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun processReleasedStats()
        //nullable = true from not(false or (false and true)) = true
{
this.nodeStatsFactory!!.push(4, this.name)
}


                @Throws(Exception::class)
            
    open fun process(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameKeyEvent = gameKeyEvent



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun processReleased(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameKeyEvent = gameKeyEvent



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun process(keyAsInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var keyAsInteger = keyAsInteger



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun processReleased(keyAsInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var keyAsInteger = keyAsInteger



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var motionGestureEvent = motionGestureEvent
    //var lastMotionGestureInput = lastMotionGestureInput



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun processScrolling(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var motionGestureEvent = motionGestureEvent
    //var lastMotionGestureInput = lastMotionGestureInput



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun processStats(motionGestureEvent: MotionGestureEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var motionGestureEvent = motionGestureEvent
this.nodeStatsFactory!!.push(5, this.name)
}


                @Throws(Exception::class)
            
    open fun process(index: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var index = index



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun processStats(index: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var index = index
this.nodeStatsFactory!!.push(6, this.name)
}


                @Throws(Exception::class)
            
    open fun processEnd()
        //nullable = true from not(false or (false and true)) = true
{
}


                @Throws(Exception::class)
            
    open fun processEnd(index: Int, createIndex: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var index = index
    //var createIndex = createIndex
}


                @Throws(Exception::class)
            
    open fun processEndStats()
        //nullable = true from not(false or (false and true)) = true
{
this.nodeStatsFactory!!.push(7, this.name)
}


                @Throws(Exception::class)
            
    open fun processCreate()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    
                        if(true)
                        
                                    throw RuntimeException()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


                @Throws(Exception::class)
            
    open fun processCreateWithGDObject(gdObject: Object)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gdObject = gdObject

    
                        if(true)
                        
                                    throw RuntimeException()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


                @Throws(Exception::class)
            
    open fun processCreateByName(gdObject: GDObject, createString: String, createIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gdObject = gdObject
    //var createString = createString
    //var createIndex = createIndex

    
                        if(true)
                        
                                    throw RuntimeException()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


                @Throws(Exception::class)
            
    open fun processCreateGD(gameLayerArray: Array<GDGameLayer?>)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameLayerArray = gameLayerArray

    
                        if(true)
                        
                                    throw RuntimeException()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun processCreateStats(gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
this.nodeStatsFactory!!.push(10, this.name)
}


    open fun processReleasedStats(gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
this.nodeStatsFactory!!.push(11, this.name)
}


                @Throws(Exception::class)
            
    open fun processGD(gameLayerArray: Array<GDGameLayer?>)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameLayerArray = gameLayerArray
this.processGDStats(gameLayerArray)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun processGDStats(gameLayerArray: Array<GDGameLayer?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayerArray = gameLayerArray
this.nodeStatsFactory!!.push(14, this.name)
}


    open fun getReturnValue()
        //nullable = true from not(false or (false and true)) = true
: Any{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT
}


    open fun getName()
        //nullable = true from not(false or (false and true)) = true
: Long{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name
}


}
                
            

