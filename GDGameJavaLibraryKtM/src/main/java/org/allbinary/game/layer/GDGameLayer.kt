
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.khronos.opengles.GL
import javax.microedition.lcdui.Graphics
import org.allbinary.animation.Animation
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.animation.RotationAnimation
import org.allbinary.animation.text.CustomTextAnimation
import org.allbinary.animation.text.TextChangeListener
import org.allbinary.canvas.Processor
import org.allbinary.game.combat.CombatBaseBehavior
import org.allbinary.game.combat.damage.DamageableBaseBehavior
import org.allbinary.game.combat.destroy.GDDestroyableSimpleBehavior
import org.allbinary.game.layout.GDObject
import org.allbinary.game.identification.Group
import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer
import org.allbinary.game.multiplayer.layer.RemoteInfo
import org.allbinary.game.physics.velocity.VelocityProperties
import org.allbinary.game.physics.velocity.DragVelocityBehavior
import org.allbinary.game.physics.velocity.VelocityBehaviorBase
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.color.BasicColor
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.math.ScaleFactorFactory
import org.allbinary.logic.string.StringUtil
import org.allbinary.math.FrameUtil
import org.allbinary.media.ScaleProperties
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.view.ViewPosition
import org.allbinary.view.ViewPositionBase
import org.allbinary.animation.text.TextInterface

open public class GDGameLayer : MultiPlayerGameLayer {
        
companion object {
            
    private val HACK_ANIMATION_NAME: String = "ttack"

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val stringUtil: StringUtil = StringUtil.getInstance()!!

    val frameUtil: FrameUtil = FrameUtil.getInstance()!!

    private val scaleFactorFactory: ScaleFactorFactory = ScaleFactorFactory.getInstance()!!

    val SCALE_FACTOR: Int = this.scaleFactorFactory!!.DEFAULT_SCALE_FACTOR

    val SCALE_FACTOR2: Int = this.SCALE_FACTOR *2

    val quarterWidth: Int = (this.getHalfWidth() shr 1) -1

    val quarterHeight: Int = (this.getHalfHeight() shr 1) -1

    val combatBaseBehavior: CombatBaseBehavior

    val initIndexedAnimationInterfaceArray: Array<IndexedAnimation?>

    var indexedAnimationInterfaceArray: Array<IndexedAnimation?>

    private val resetAnimationBehavior: ResetAnimationBehavior

    val velocityInterface: VelocityProperties

    var realX: Long= 0

    var realY: Long= 0

    private val dimensionalBehavior: GDTwodBehavior

    val gameLayerList: BasicArrayList

    val gameLayerDestroyedList: BasicArrayList

    val behaviorList: BasicArrayList

    val rectangleArrayOfArrays: Array<Array<Rectangle?>?>

    val linkedGDGameLayerList: BasicArrayList = BasicArrayListD()

    var gdObject: GDObject

    var primitiveDrawing: Animation

    var scalableProcessor: ScalableBaseProcessor = ScalableBaseProcessor.getInstance()!!

    var moveProcessor: Processor = object: Processor()
                                {
                                
                @Throws(Exception::class)
            
    override fun processt(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
move()
}

                                }
                            

    var processor: Processor = this.moveProcessor

    var velocityBehavior: VelocityBehaviorBase = DragVelocityBehavior.instance
//    private float lastScaleY = 1;
open public inner class GDTextChangeListener : TextChangeListener {
        
/*Static stuff is not allowed for Kotlin inner classescompanion object {
            *//*
        }
            */


    private val gameLayer: GDGameLayer
 constructor (gameLayer: GDGameLayer){
    //var gameLayer = gameLayer
this.gameLayer= gameLayer
}


    open fun onMeasure()
        //nullable = true from not(false or (false and true)) = true
{
this.gameLayer!!.onMeasure()
}


}
                
            
    private var textChangeListener: TextChangeListener = GDTextChangeListener(this)
public constructor (primitiveDrawing: Animation, gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, behaviorList: BasicArrayList, velocityInterface: VelocityProperties, remoteInfo: RemoteInfo, groupInterface: Array<Group?>, gdName: String, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>, proceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?>, layerInfo: Rectangle, rectangleArrayOfArrays: Array<Array<Rectangle?>?>, viewPosition: ViewPosition, gdObject: GDObject, animationBehavior: GDAnimationBehaviorBase, rotationAdjustment: Boolean)                        

                            : super(remoteInfo, groupInterface, gdName, layerInfo, viewPosition){
    //var primitiveDrawing = primitiveDrawing
    //var gameLayerList = gameLayerList
    //var gameLayerDestroyedList = gameLayerDestroyedList
    //var behaviorList = behaviorList
    //var velocityInterface = velocityInterface
    //var remoteInfo = remoteInfo
    //var groupInterface = groupInterface
    //var gdName = gdName
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray
    //var proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray
    //var layerInfo = layerInfo
    //var rectangleArrayOfArrays = rectangleArrayOfArrays
    //var viewPosition = viewPosition
    //var gdObject = gdObject
    //var animationBehavior = animationBehavior
    //var rotationAdjustment = rotationAdjustment


                            //For kotlin this is before the body of the constructor.
                    
this.primitiveDrawing= primitiveDrawing
this.gameLayerList= gameLayerList
this.gameLayerDestroyedList= gameLayerDestroyedList
this.behaviorList= behaviorList
this.gdObject= gdObject
this.velocityInterface= velocityInterface
this.initPositionXYZ(this.gdObject!!.x, this.gdObject!!.y, this.gdObject!!.zOrder)
this.initPosition()

    var size: Int = animationInterfaceFactoryInterfaceArray!!.size
                





                        for (index in 0 until size)

        {

    var animationName: String = this.gdObject!!.getAnimationFromIndex(index)!!


    var scaleProperties: ScaleProperties = ScaleProperties()

scaleProperties!!.scaleX= this.gdObject!!.initScaleX *this.gdObject!!.customScale
scaleProperties!!.scaleY= this.gdObject!!.initScaleY *this.gdObject!!.customScale
scaleProperties!!.scaleWidth= this.gdObject!!.Width(
                            null)
scaleProperties!!.scaleHeight= this.gdObject!!.Height(
                            null)

    
                        if(animationName != StringUtil.getInstance()!!.EMPTY_STRING && animationName!!.indexOf(GDGameLayer.HACK_ANIMATION_NAME) >= 0)
                        
                                    {
                                    scaleProperties!!.shouldScale= true

                                    }
                                
animationInterfaceFactoryInterfaceArray[index]!!.setInitialScale(scaleProperties)
}

this.initIndexedAnimationInterfaceArray= animationBehavior!!.init(this.gdObject, animationInterfaceFactoryInterfaceArray)
this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray)

    
                        if(this.initIndexedAnimationInterfaceArray[0]!!.getSize() >= 90 && rotationAdjustment)
                        
                                    {
                                    this.resetAnimationBehavior= ResetRotationAnimationBehavior.getInstance()

                                    }
                                
                        else {
                            this.resetAnimationBehavior= ResetAnimationBehavior.getInstance()

                        }
                            
animationBehavior!!.add(this)

    
                        if(this.initIndexedAnimationInterfaceArray!!.size > 0 && this.initIndexedAnimationInterfaceArray[0]!!.isThreed())
                        
                                    {
                                    this.dimensionalBehavior= GDThreedBehavior(animationBehavior, this.initIndexedAnimationInterfaceArray as Array<RotationAnimation?>)

                                    }
                                
                        else {
                            this.dimensionalBehavior= GDTwodBehavior(animationBehavior)

                        }
                            
this.combatBaseBehavior= CombatBaseBehavior(DamageableBaseBehavior.getInstance(), GDDestroyableSimpleBehavior(this))
this.dimensionalBehavior!!.reset(this, gdObject)
this.rectangleArrayOfArrays= rectangleArrayOfArrays
}


    open fun hasCollisionMask()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    
                        if(this.rectangleArrayOfArrays != 
                                    null
                                 && this.rectangleArrayOfArrays!!.size > 0 && this.rectangleArrayOfArrays[0]!!.size > 0)
                        
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
            
    open fun setGDObject(gdObject: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject

    var size: Int = this.initIndexedAnimationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.initIndexedAnimationInterfaceArray[index]!!.setFrame(this.frameUtil!!.getFrameForAngle(0.toShort(), 1))
}

gdObject!!.angle= this.gdObject!!.angle
this.dimensionalBehavior!!.getAnimationBehavior()!!.setAnimationArray(this.initIndexedAnimationInterfaceArray)
this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray)
this.dimensionalBehavior!!.reset(this, gdObject)
this.gdObject= gdObject
this.initPositionXYZ(this.gdObject!!.x, this.gdObject!!.y, this.gdObject!!.zOrder)
this.initPosition()
this.setDestroyed(false)
}


                @Throws(Exception::class)
            
    override fun set(gl: GL)
        //nullable = true from not(false or (false and false)) = true
{
    //var gl = gl

    var size: Int = this.initIndexedAnimationInterfaceArray!!.size
                


    var openGLSurfaceChangedInterface: OpenGLSurfaceChangedInterface





                        for (index in 0 until size)

        {
openGLSurfaceChangedInterface= this.initIndexedAnimationInterfaceArray[index]!! as OpenGLSurfaceChangedInterface
openGLSurfaceChangedInterface!!.set(gl)
}

}


    open fun getVelocityProperties()
        //nullable = true from not(false or (false and true)) = true
: VelocityProperties{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.velocityInterface
}


    open fun setRotation(angleAdjustment: Short)
        //nullable = true from not(false or (false and false)) = true
{
    //var angleAdjustment = angleAdjustment
this.dimensionalBehavior!!.getAnimationBehavior()!!.setRotation(this, angleAdjustment)
}


    open fun getInitIndexedAnimationInterfaceArray()
        //nullable = true from not(false or (false and true)) = true
: Array<IndexedAnimation?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.initIndexedAnimationInterfaceArray
}


    open fun setIndexedAnimationInterfaceArray(animationInterface: Array<IndexedAnimation?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var animationInterface = animationInterface
this.indexedAnimationInterfaceArray= animationInterface
}


    open fun getIndexedAnimationInterfaceArray()
        //nullable = true from not(false or (false and true)) = true
: Array<IndexedAnimation?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.indexedAnimationInterfaceArray
}


    open fun getIndexedAnimationInterface()
        //nullable = true from not(false or (false and true)) = true
: IndexedAnimation{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.indexedAnimationInterfaceArray[this.gdObject!!.animation]!!
}


    open fun getCombatBaseBehavior()
        //nullable = true from not(false or (false and true)) = true
: CombatBaseBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.combatBaseBehavior
}


                @Throws(Exception::class)
            
    override fun damage(damage: Int, damageType: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var damage = damage
    //var damageType = damageType
this.combatBaseBehavior!!.getDamageableBaseBehavior()!!.damage(damage, damageType)
}


                @Throws(Exception::class)
            
    override fun getDamage(damageType: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var damageType = damageType



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.combatBaseBehavior!!.getDamageableBaseBehavior()!!.getDamage(damageType)
}


                @Throws(Exception::class)
            
    override fun isDestroyed()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.combatBaseBehavior!!.getDestroyableBaseBehavior()!!.isDestroyed()
}


                @Throws(Exception::class)
            
    open fun setDestroyed(destroyed: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var destroyed = destroyed
this.gameLayerList!!.remove(this)
this.gameLayerDestroyedList!!.add(this)
this.combatBaseBehavior!!.getDestroyableBaseBehavior()!!.setDestroyed(destroyed)
}


    override fun move()
        //nullable = true from not(false or (false and true)) = true
{

    var velocityX: Long = this.velocityInterface!!.getVelocityXBasicDecimalP()!!.getUnscaled()!!


    var velocityY: Long = this.velocityInterface!!.getVelocityYBasicDecimalP()!!.getUnscaled()!!

this.realX= this.realX +velocityX
this.realY= this.realY +velocityY

    var scaleFactorValue: Int = this.scaleFactorFactory!!.DEFAULT_SCALE_VALUE


    var x: Int = (this.realX /scaleFactorValue).toInt()


    var y: Int = (this.realY /scaleFactorValue).toInt()

super.setPosition(x, y, this.z)
}


    open fun isMovingX()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.velocityInterface!!.getVelocityXBasicDecimalP()!!.getScaled() /this.SCALE_FACTOR).toInt()
}


    open fun isMovingY()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.velocityInterface!!.getVelocityYBasicDecimalP()!!.getScaled() /this.SCALE_FACTOR).toInt()
}


    override fun setPosition(x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var z = z
super.setPosition(x, y, z)

    var scaleFactorValue: Int = ScaleFactorFactory.getInstance()!!.DEFAULT_SCALE_VALUE

this.realX= x *scaleFactorValue
this.realY= y *scaleFactorValue
}


    open fun AddForceUsingPolarCoordinates(angle: Float, length: Float, clearing: Float)
        //nullable = true from not(false or (false and false)) = true
{
    //var angle = angle
    //var length = length
    //var clearing = clearing

    var adjustedAngle: Short = angle.toShort()


        while(adjustedAngle > 359)
        {
adjustedAngle -= 360
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360
}

this.gdObject!!.forceAngle= adjustedAngle.toShort()
this.velocityInterface!!.setVelocityi(length.toLong() *this.SCALE_FACTOR2, adjustedAngle.toShort(), 0.toShort())

    
                        if(clearing == 1)
                        
                                    {
                                    
    
                        if(this.processor == this.moveProcessor)
                        
                                    {
                                    this.processor= object: Processor()
                                {
                                
                @Throws(Exception::class)
            
    override fun processt(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
move()
updateGDObject(timeDelta)
}

                                }
                            

                                    }
                                

                                    }
                                
}


    open fun StopForce()
        //nullable = true from not(false or (false and true)) = true
{
this.velocityInterface!!.setVelocityi(0, 0.toShort(), 0.toShort())
}


    open fun AddForce(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
this.velocityInterface!!.getVelocityXBasicDecimalP()!!.setint(x *this.SCALE_FACTOR2)
this.velocityInterface!!.getVelocityYBasicDecimalP()!!.setint(y *this.SCALE_FACTOR2)
}


    open fun updatePosition()
        //nullable = true from not(false or (false and true)) = true
{
this.setPosition(this.gdObject!!.x, this.gdObject!!.y, this.gdObject!!.zOrder)
}


    open fun updateSize()
        //nullable = true from not(false or (false and true)) = true
{
this.setWidth(this.gdObject!!.width)
this.setHeight(this.gdObject!!.height)
}


                @Throws(Exception::class)
            
    open fun process(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
this.processor.processt(timeDelta)
}


    open fun updateGDObject(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
this.gdObject!!.setX(this.x)
this.gdObject!!.setY(this.y)
this.updateRotation(timeDelta)

    var opacity: Int = this.gdObject!!.opacity.toInt()


    
                        if(opacity < 0)
                        
                                    {
                                    opacity= 0

                                    }
                                

    var size: Int = this.initIndexedAnimationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.initIndexedAnimationInterfaceArray[index]!!.setAlpha(opacity)
this.scalableProcessor!!.process(this, this.initIndexedAnimationInterfaceArray[index]!!)

    
                        if(this.gdObject!!.basicColor != 
                                    null
                                )
                        
                                    {
                                    this.initIndexedAnimationInterfaceArray[index]!!.changeBasicColor(this.gdObject!!.basicColor)

                                    }
                                
}

}


    open fun resetAnimation()
        //nullable = true from not(false or (false and true)) = true
{
this.resetAnimationBehavior!!.resetAnimation(this.indexedAnimationInterfaceArray, this.gdObject!!.animation)
}


                @Throws(Exception::class)
            
    open fun animate(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
this.velocityBehavior!!.reduce(this.velocityInterface, 30, 100)
this.dimensionalBehavior!!.getAnimationBehavior()!!.animate(this.gdObject, this.initIndexedAnimationInterfaceArray, timeDelta)
this.primitiveDrawing!!.nextFrame()
}


    open fun updateRotation(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
this.dimensionalBehavior!!.updateRotation(this, timeDelta)
}


    open fun setScalable()
        //nullable = true from not(false or (false and true)) = true
{

    
                        if(this.scalableProcessor == ScalableBaseProcessor.getInstance())
                        
                                    {
                                    
    var size: Int = this.initIndexedAnimationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.initIndexedAnimationInterfaceArray[index]!!.setMaxScale(5, 5)
}


                                    }
                                
this.scalableProcessor= ScalableProcessor.getInstance()
}


                @Throws(Exception::class)
            
    open fun isDestination(gdGameLayer: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gdGameLayer = gdGameLayer



                            throw RuntimeException()
}


                @Throws(Exception::class)
            
    open fun AnimationFrameCount()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.getIndexedAnimationInterface()!!.getSize()
}


    override fun paint(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics

        try {
            super.paintFirst(graphics)

    var viewPosition: ViewPositionBase = this.getViewPosition()!!


    var x: Int = viewPosition!!.getX()!!


    var y: Int = viewPosition!!.getY()!!

this.indexedAnimationInterfaceArray[this.gdObject!!.animation]!!.paintXY(graphics, x, y)
this.primitiveDrawing!!.paintXY(graphics, x, y)
this.paintDebug(graphics)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "paint", e)
}

}


    override fun paintThreed(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics

        try {
            
    var viewPosition: ViewPositionBase = this.getViewPosition()!!


    var x: Int = viewPosition!!.getX()!!


    var y: Int = viewPosition!!.getY()!!


    var z: Int = viewPosition!!.getZ()!!

this.indexedAnimationInterfaceArray[this.gdObject!!.animation]!!.paintThreedXYZ(graphics, x, y, z)
this.primitiveDrawing!!.paintThreedXYZ(graphics, x, y, z)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "paintThreed", e)
}

}


    open fun paintPoints(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
}


    open fun paintAngle(angle: Short, graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var angle = angle
    //var graphics = graphics

    var adjustedAngle: Int = angle

}


    override fun paintDebug(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
super.paintDebug(graphics)
this.getCollidableInferface()!!.paint(this, graphics)
}


    open fun setBasicColor(basicColor: BasicColor)
        //nullable = true from not(false or (false and false)) = true
{
    //var basicColor = basicColor
this.initIndexedAnimationInterfaceArray[0]!!.setBasicColorP(basicColor)
}


    open fun setBackgroundBasicColor(basicColor: BasicColor)
        //nullable = true from not(false or (false and false)) = true
{
    //var basicColor = basicColor
this.initIndexedAnimationInterfaceArray[0]!!.setBackgroundBasicColorP(basicColor)
}


    open fun setText(value: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var value = value
this.setText(value.toString())
}


    open fun setText(text: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var text = text

    var textInterface: TextInterface = (this.initIndexedAnimationInterfaceArray[0]!! as TextInterface)


    
                        if(text == 
                                    null
                                )
                        
                                    {
                                    textInterface!!.setTextWithOnMeasure(this.stringUtil!!.EMPTY_STRING, this.textChangeListener)

                                    }
                                
                        else {
                            textInterface!!.setTextWithOnMeasure(text, this.textChangeListener)

                        }
                            
}


    open fun onMeasure()
        //nullable = true from not(false or (false and true)) = true
{



                            throw RuntimeException()
}


    open fun Text()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 
                                    ( as TextInterface).getText()
}


    open fun getDimensionalBehavior()
        //nullable = true from not(false or (false and true)) = true
: GDTwodBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.dimensionalBehavior
}


    open fun setValue(value: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var value = value



                            throw RuntimeException()
}


    open fun Value()
        //nullable = true from not(false or (false and true)) = true
: Int{



                            throw RuntimeException()
}


    override fun toStringAppend(stringBuffer: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringBuffer = stringBuffer
super.toStringAppend(stringBuffer)

    
                        if(this.dimensionalBehavior != 
                                    null
                                )
                        
                                    {
                                    this.dimensionalBehavior!!.getAnimationBehavior()!!.toString(this.gdObject, stringBuffer)

                                    }
                                
stringBuffer!!.append(this.gdObject!!.toString())
}


    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

    var stringBuffer: StringMaker = StringMaker()

this.toStringAppend(stringBuffer)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!!.toString()
}


}
                
            

