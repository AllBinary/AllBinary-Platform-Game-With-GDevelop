
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
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.AndroidUtil
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layer.behavior.GDBehavior
import org.allbinary.game.layer.behavior.GDBehaviorUtil
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.GraphicsStrings
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.string.CommonSeps
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.math.NoDecimalTrigTable
import org.allbinary.math.PositionStrings
import org.allbinary.string.CommonLabels

open public class GDObject
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val noDecimalTrigTable: NoDecimalTrigTable = NoDecimalTrigTable.getInstance()!!

    var initialVariables: GDInitialVariables = GDInitialVariables.getInstance()!!

    val name: String

    val type: String

    val behaviorArray: Array<GDBehavior?> = arrayOfNulls(GDBehaviorUtil.getInstance()!!.MAX)

    val isBehaviorEnabledArray: BooleanArray = BooleanArray(10)

    val hasBehaviorArray: BooleanArray = BooleanArray(10)

    private val offsetBehavior: BaseOffsetBehavior

    var x: Int= 0

    var y: Int= 0

    var zOrder: Int= 0

    var rotationP: Float= 0.0f

    var rotationZP: Float= 0.0f

    var angle: Short= 0

    var movement_angle: Int= 0

    var scaleX: Float = 1.0f

    var scaleY: Float = 1.0f

    var initScaleX: Float = 1.0f

    var initScaleY: Float = 1.0f

    var customScale: Float = 1.0f

    var animation: Int= 0

    var timeScale: Float = 1.0f

    var opacity: Float = 255

    var basicColor: BasicColor

    var widthAtInitialScale: Int= 0

    var heightAtInitialScale: Int= 0

    var width: Int= 0

    var height: Int= 0

    private var halfWidth: Int= 0

    private var halfHeight: Int= 0

    var updateSinceSetAngle: Boolean= false

    var forceAngle: Int = 0
public constructor (width: Int, height: Int, name: Object, type: Object)
            : super()
        {
    //var width = width
    //var height = height
    //var name = name
    //var type = type
this.name= name
this.type= type
this.updateSize(width, height)

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    
                        if(features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D))
                        
                                    {
                                    this.offsetBehavior= BaseOffsetBehavior.getInstance()

                                    }
                                
                        else {
                            this.offsetBehavior= OffsetBehavior.getInstance()

                        }
                            
}


    open fun set(unknown: String, x: Int, y: Int, zOrder: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var unknown = unknown
    //var x = x
    //var y = y
    //var zOrder = zOrder
this.x= x
this.y= y
this.zOrder= zOrder
}


    open fun updateScale(scaleX: Float, scaleY: Float)
        //nullable = true from not(false or (false and false)) = true
{
    //var scaleX = scaleX
    //var scaleY = scaleY
this.initScaleX= scaleX
this.initScaleY= scaleY
this.updateSize((this.width *scaleX).toInt(), (this.height *scaleY).toInt())
}


    open fun updateSize(width: Int, height: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var width = width
    //var height = height
this.width= width
this.height= height
this.halfWidth= width /2
this.halfHeight= height /2
}


    open fun ForceAngle()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.forceAngle
}


    open fun getAnimationFromIndex(index: Int)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var index = index



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.EMPTY_STRING
}


    open fun getAnimation(animationName: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var animationName = animationName



                            throw RuntimeException()
}


    open fun setAnimation(animationName: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var animationName = animationName



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun Width(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var graphics = graphics



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.width
}


    open fun Height(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var graphics = graphics



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height
}


    open fun setX(x: Double)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
this.setX(x.toInt())
}


    open fun setX(x: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
this.x= x
}


    open fun setY(y: Double)
        //nullable = true from not(false or (false and false)) = true
{
    //var y = y
this.setY(y.toInt())
}


    open fun setY(y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var y = y
this.y= y
}


    open fun X()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.x
}


    open fun Y()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.y
}


    open fun X2()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.x +this.width
}


    open fun Y2()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.y +this.height
}


    private val offsetX: Float = if(AndroidUtil.isAndroid()) {
                            
                            
                                        //Otherwise - thenExpr - DoubleLiteralExpr

                        
                            } else {
                            
                                        //Otherwise - expression - elseExpr - DoubleLiteralExpr

                            }
    

    private val offsetY: Float = 1.00f

    open fun PointX(point: GPoint)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var point = point

    var adjustedAngle: Int = this.angle


        while(adjustedAngle > 359)
        {
adjustedAngle -= 360
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360
}


    var x: Int = (this.noDecimalTrigTable!!.cos(adjustedAngle.toShort()) *(point.getX() -this.halfWidth -(this.halfWidth /2))).toInt() /this.noDecimalTrigTable!!.SCALE




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.x +(x *this.offsetX) +this.offsetBehavior!!.PointX(this.halfWidth)).toInt()
}


    open fun PointY(point: GPoint)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var point = point

    var adjustedAngle: Int = this.angle


        while(adjustedAngle > 359)
        {
adjustedAngle -= 360
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360
}


    
                        if(point.getX() > this.halfWidth)
                        
                                    {
                                    
    var y: Int = (this.noDecimalTrigTable!!.sin(adjustedAngle.toShort()) *(point.getY() -(this.halfHeight /2))).toInt() /this.noDecimalTrigTable!!.SCALE




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.y +(y *this.offsetY) +this.offsetBehavior!!.PointY(this.halfHeight)).toInt()

                                    }
                                
                        else {
                            
    var y: Int = (this.noDecimalTrigTable!!.sin(adjustedAngle.toShort()) * -(point.getY() -(this.halfHeight /2))).toInt() /this.noDecimalTrigTable!!.SCALE




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.y +(y *this.offsetY) +this.offsetBehavior!!.PointY(this.halfHeight)).toInt()

                        }
                            
}


    open fun setAngle(angle: Short)
        //nullable = true from not(false or (false and false)) = true
{
    //var angle = angle
this.angle= angle
}


    open fun setAngle(angle: Short, gameLayer: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var angle = angle
    //var gameLayer = gameLayer
this.updateSinceSetAngle= false

    var adjustedAngle: Short = angle


        while(adjustedAngle > 359)
        {
adjustedAngle -= 360
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360
}

this.angle= adjustedAngle
gameLayer!!.setRotation(adjustedAngle)
}


    open fun Angle(gameLayer: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
: Short{
    //var gameLayer = gameLayer



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.angle
}


    open fun Angle()
        //nullable = true from not(false or (false and true)) = true
: Short{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.angle
}


    open fun Variable(value: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var value = value



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value
}


    open fun Variable(value: Float)
        //nullable = true from not(false or (false and false)) = true
: Float{
    //var value = value



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value
}


    open fun VariableChildCount(array: IntArray)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var array = array



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.size
}


    open fun VariableChildCount(array: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var array = array



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.size
}


    open fun ObjectName()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name
}


    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun getBehavior(index: Int)
        //nullable = true from not(false or (false and false)) = true
: GDBehavior{
    //var index = index



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.behaviorArray[index]!! as GDBehavior
}


    open fun toShortString()
        //nullable = true from not(false or (false and true)) = true
: String{

    var commonSeps: CommonSeps = CommonSeps.getInstance()!!


    var gdObjectStrings: GDObjectStrings = GDObjectStrings.getInstance()!!


    var positionStrings: PositionStrings = PositionStrings.getInstance()!!


    var commonLabels: CommonLabels = CommonLabels.getInstance()!!


    var stringBuilder: StringMaker = StringMaker()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.append(gdObjectStrings!!.GDOBJECT)!!.append(CommonSeps.getInstance()!!.COLON)!!.append(this.name)!!.append(commonSeps!!.SPACE)!!.append(positionStrings!!.X_LABEL)!!.appendint(this.x)!!.append(positionStrings!!.Y_LABEL)!!.appendint(this.y)!!.append(commonLabels!!.WIDTH_LABEL)!!.appendint(this.width)!!.append(commonLabels!!.HEIGHT_LABEL)!!.appendint(this.height)!!.toString()
}


    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

    var commonSeps: CommonSeps = CommonSeps.getInstance()!!


    var graphicsStrings: GraphicsStrings = GraphicsStrings.getInstance()!!


    var positionStrings: PositionStrings = PositionStrings.getInstance()!!


    var commonLabels: CommonLabels = CommonLabels.getInstance()!!


    var gdObjectStrings: GDObjectStrings = GDObjectStrings.getInstance()!!


    var stringBuilder: StringMaker = StringMaker()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.append(gdObjectStrings!!.GDOBJECT)!!.append(CommonSeps.getInstance()!!.COLON)!!.append(this.name)!!.appendint(this.hashCode())!!.append(commonSeps!!.SPACE)!!.append(positionStrings!!.X_LABEL)!!.appendint(this.x)!!.append(positionStrings!!.Y_LABEL)!!.appendint(this.y)!!.append(commonSeps!!.SPACE)!!.append(positionStrings!!.Z_LABEL)!!.appendint(this.zOrder)!!.append(commonSeps!!.SPACE)!!.append(commonLabels!!.WIDTH_LABEL)!!.appendint(this.width)!!.append(commonSeps!!.SPACE)!!.append(commonLabels!!.HEIGHT_LABEL)!!.appendint(this.height)!!.append(commonSeps!!.SPACE)!!.append(commonLabels!!.WIDTH_LABEL)!!.appendint(this.halfWidth)!!.append(commonSeps!!.SPACE)!!.append(commonLabels!!.HEIGHT_LABEL)!!.appendint(this.halfHeight)!!.append(commonSeps!!.SPACE)!!.append(graphicsStrings!!.ANIMATION)!!.appendint(this.animation)!!.append(commonSeps!!.SPACE)!!.append(graphicsStrings!!.ANGLE)!!.append(commonSeps!!.COLON)!!.appendint(this.angle)!!.append(commonSeps!!.SPACE)!!.append(graphicsStrings!!.MOVEMENT_ANGLE)!!.append(commonSeps!!.COLON)!!.appendint(this.movement_angle)!!.append(commonSeps!!.SPACE)!!.append(graphicsStrings!!.ROTATION)!!.append(commonSeps!!.COLON)!!.appendfloat(this.rotationP)!!.append(commonSeps!!.SPACE)!!.append(graphicsStrings!!.OPACITY)!!.append(commonSeps!!.COLON)!!.appendfloat(this.opacity)!!.toString()
}


}
                
            

