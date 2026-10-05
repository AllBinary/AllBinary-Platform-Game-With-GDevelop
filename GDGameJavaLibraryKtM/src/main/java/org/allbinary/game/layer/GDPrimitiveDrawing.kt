
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.animation.Animation
import org.allbinary.animation.vector.ARectangleFilledAnimation
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.util.CircularIndexUtil

open public class GDPrimitiveDrawing : Animation {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val animationListArray: Array<BasicArrayList?> = arrayOf(BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD(),BasicArrayListD())

    private val circularIndexUtil: CircularIndexUtil = CircularIndexUtil.createInstance(this.animationListArray!!.size)!!

    val colorAnimationInUseList: BasicArrayList = BasicArrayListD()

    val colorAnimationCacheList: BasicArrayList = BasicArrayListD()

    val aRetangleFilledAnimationInUseList: BasicArrayList = BasicArrayListD()

    val aRetangleFilledAnimationCacheList: BasicArrayList = BasicArrayListD()

    var animationList: BasicArrayList = this.animationListArray[this.animationListArray!!.size -1]!!

    override fun nextFrame()
        //nullable = true from not(false or (false and true)) = true
{
this.animationList= this.animationListArray[this.circularIndexUtil!!.getIndex()]!!
this.circularIndexUtil!!.next()
this.animationListArray[this.circularIndexUtil!!.getIndex()]!!.clear()
this.colorAnimationCacheList!!.addAllList(this.colorAnimationInUseList)
this.colorAnimationInUseList!!.clear()
this.aRetangleFilledAnimationCacheList!!.addAllList(this.aRetangleFilledAnimationInUseList)
this.aRetangleFilledAnimationInUseList!!.clear()
}


    open fun addFillColor(basicColor: BasicColor)
        //nullable = true from not(false or (false and false)) = true
{
    //var basicColor = basicColor

    
                        if(this.colorAnimationCacheList!!.size() == 0)
                        
                                    {
                                    
    var colorAnimation: Animation = Animation()

colorAnimation!!.setBasicColorP(basicColor)
this.animationListArray[this.circularIndexUtil!!.getIndex()]!!.add(colorAnimation)
this.colorAnimationInUseList!!.add(colorAnimation)

                                    }
                                
                        else {
                            
    var colorAnimation: Animation = this.colorAnimationCacheList!!.removeAt(this.colorAnimationCacheList!!.size() -1) as Animation

colorAnimation!!.setBasicColorP(basicColor)
this.animationListArray[this.circularIndexUtil!!.getIndex()]!!.add(colorAnimation)
this.colorAnimationInUseList!!.add(colorAnimation)

                        }
                            
}


    open fun addFillRectangle(x: Int, y: Int, x2: Int, y2: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var x2 = x2
    //var y2 = y2

    
                        if(this.aRetangleFilledAnimationCacheList!!.size() == 0)
                        
                                    {
                                    
    var rectangleFilledAnimation: ARectangleFilledAnimation = ARectangleFilledAnimation()

rectangleFilledAnimation!!.x= x
rectangleFilledAnimation!!.y= y
rectangleFilledAnimation!!.setWidth(x2 -x)
rectangleFilledAnimation!!.setHeight(y2 -y)
this.animationListArray[this.circularIndexUtil!!.getIndex()]!!.add(rectangleFilledAnimation)
this.aRetangleFilledAnimationInUseList!!.add(rectangleFilledAnimation)

                                    }
                                
                        else {
                            
    var rectangleFilledAnimation: ARectangleFilledAnimation = this.aRetangleFilledAnimationCacheList!!.removeAt(this.aRetangleFilledAnimationCacheList!!.size() -1) as ARectangleFilledAnimation

rectangleFilledAnimation!!.x= x
rectangleFilledAnimation!!.y= y
rectangleFilledAnimation!!.setWidth(x2 -x)
rectangleFilledAnimation!!.setHeight(y2 -y)
this.animationListArray[this.circularIndexUtil!!.getIndex()]!!.add(rectangleFilledAnimation)
this.aRetangleFilledAnimationInUseList!!.add(rectangleFilledAnimation)

                        }
                            
}


    override fun paintXY(graphics: Graphics, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y

    var animationList: BasicArrayList = this.animationList


    var size: Int = animationList!!.size()!!





                        for (index in 0 until size)

        {
get = animationList!!.get(index)get as Animation
get.
                    paintXY(graphics, x, y)
}

}


    override fun paintThreedXYZ(graphics: Graphics, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y
    //var z = z

    var animationList: BasicArrayList = this.animationList


    var size: Int = animationList!!.size()!!


    var animation: Animation





                        for (index in 0 until size)

        {
animation= animationList!!.get(index) as Animation
animation.paintThreedXYZ(graphics, x, y, z)
}

}


}
                
            

