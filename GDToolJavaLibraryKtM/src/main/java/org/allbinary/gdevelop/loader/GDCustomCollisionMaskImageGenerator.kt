
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.AbFileNativeUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.math.PositionStrings
import org.json.JSONArray
import org.json.JSONObject

open public class GDCustomCollisionMaskImageGenerator : GDCustomCollisionMaskRemoval {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdImageMaskGenerator: GDCustomCollisionMaskImageGenerator = GDCustomCollisionMaskImageGenerator()

gdImageMaskGenerator!!.process()
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val exclusionArray: Array<String?> = arrayOf("AdultRedDragon","Bat")

    private val positionStrings: PositionStrings = PositionStrings.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val LOAD_IMAGE: String = "Load Image: "

    private val LOAD_SPRITE: String = "Load Sprite: "

    private val ADJUSTING_HEIGHT: String = "Adjusting Height from Sprite: "

    private val SKIPPING_IMAGE: String = "Skipping Image: "

    override fun processObjects(name: Object)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var name = name

    var size: Int = this.inclusionExclusionArray!!.length





                        for (index in 0 until size)

        {

    
                        if(this.inclusionExclusionArray[index]!!.compareTo(name) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
}


    var size2: Int = this.exclusionArray!!.size
                





                        for (index in 0 until size2)

        {

    
                        if(this.exclusionArray[index]!!.compareTo(name) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


                @Throws(Exception::class)
            
    override fun updateSprite(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject
this.addOrReplaceCollisionMask(jsonObject)
}


    open fun getRectangle(bufferedImage: BufferedImage)
        //nullable = true from not(false or (false and false)) = true
: Rectangle{
    //var bufferedImage = bufferedImage

    var transparentColor: Int = BasicColorFactory.getInstance()!!.TRANSPARENT_COLOR.toInt()!!


    var width: Int = bufferedImage!!.getWidth()!!


    var height: Int = bufferedImage!!.getHeight()!!


    var minX: Int = width


    var maxX: Int = 0


    var minY: Int = height


    var maxY: Int = 0


    var rgb: Int= 0





                        for (indexX in 0 until width)

        {




                        for (indexY in 0 until height)

        {
rgb= bufferedImage!!.getRGB(indexX, indexY)

    
                        if(rgb != transparentColor)
                        
                                    {
                                    
    
                        if(indexX < minX)
                        
                                    {
                                    minX= indexX

                                    }
                                

    
                        if(indexY < minY)
                        
                                    {
                                    minY= indexY

                                    }
                                

    
                        if(indexX > maxX)
                        
                                    {
                                    maxX= indexX

                                    }
                                

    
                        if(indexY > maxY)
                        
                                    {
                                    maxY= indexY

                                    }
                                

                                    }
                                
}

}

maxX++
maxY++

    var rectangle: Rectangle = Rectangle(PointFactory.getInstance()!!.createXY(minX, minY), maxX -minX, maxY -minY)

System.out.println(rectangle.toString())



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return rectangle
}


    private val ONE: String = "1"

                @Throws(Exception::class)
            
    open fun addOrReplaceCollisionMask(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    var assetPath: String = jsonObject!!.getString(this.gdProjectStrings!!.IMAGE)!!


    var imagePath: String = assetPath!!.substring(this.gdToolStrings!!.ASSET_PREFIX.length(), assetPath!!.length)!!


    var abFile: AbFile = AbFile.createAbFileFromRawPath(this.gdPaths!!.ASSETS_PATH +imagePath)!!


    
                        if(abFile!!.isFile())
                        
                                    {
                                    System.out.println(this.LOAD_IMAGE +imagePath)

    var bufferedImage: BufferedImage = ImageIO.read(AbFileNativeUtil.get(abFile))!!


    var adjustMaxY: Int = bufferedImage!!.getHeight()!!


    var underScoreIndex: Int = imagePath!!.lastIndexOf('_')!!


    var imagePath2: String = 
                null
            


    
                        if(underScoreIndex >= 0)
                        
                                    {
                                    
    var periodIndex: Int = imagePath!!.lastIndexOf('.')!!

imagePath2= StringMaker().
                            append(imagePath!!.substring(0, underScoreIndex +1))!!.append(this.ONE)!!.append(imagePath!!.substring(periodIndex))!!.toString()

    var abFile2: AbFile = AbFile.createAbFileFromRawPath(this.gdPaths!!.TWOD_RESOURCES_PATH +imagePath2)!!


    
                        if(abFile2!!.isFile())
                        
                                    {
                                    
    var bufferedImage2: BufferedImage = ImageIO.read(AbFileNativeUtil.get(abFile2))!!


    
                        if(adjustMaxY > bufferedImage2!!.getHeight())
                        
                                    {
                                    adjustMaxY= bufferedImage2!!.getHeight()

                                    }
                                

                                    }
                                

                                    }
                                

    var rectangle: Rectangle = this.getRectangle(bufferedImage)!!


    var height: Int = adjustMaxY -rectangle.getPoint()!!.getY()


    
                        if(rectangle.getHeight() > height)
                        
                                    {
                                    System.out.println(this.ADJUSTING_HEIGHT +imagePath2)
rectangle.setHeight(height)

                                    }
                                

    var customCollisionMaskJSONArray: JSONArray = this.getCustomCollisionMask(rectangle)!!

jsonObject!!.put(this.gdProjectStrings!!.CUSTOM_COLLISION_MASK, customCollisionMaskJSONArray)

                                    }
                                
                        else {
                            System.out.println(this.SKIPPING_IMAGE +imagePath)

                        }
                            
}


    open fun getCustomCollisionMask(rectangle: Rectangle)
        //nullable = true from not(false or (false and false)) = true
: JSONArray{
    //var rectangle = rectangle

    var customCollisionMaskJSONArray: JSONArray = JSONArray()


    var firstCustomCollisionMaskJSONArray: JSONArray = JSONArray()

customCollisionMaskJSONArray!!.put(firstCustomCollisionMaskJSONArray)

    var topLeftJSONObject: JSONObject = JSONObject()


    var topRightJSONObject: JSONObject = JSONObject()


    var bottomLeftJSONObject: JSONObject = JSONObject()


    var bottomRightJSONObject: JSONObject = JSONObject()

topLeftJSONObject!!.put(this.positionStrings!!.X, rectangle.getPoint()!!.getX())
topLeftJSONObject!!.put(this.positionStrings!!.Y, rectangle.getPoint()!!.getY())
topRightJSONObject!!.put(this.positionStrings!!.X, rectangle.getMaxX())
topRightJSONObject!!.put(this.positionStrings!!.Y, rectangle.getPoint()!!.getY())
bottomLeftJSONObject!!.put(this.positionStrings!!.X, rectangle.getPoint()!!.getX())
bottomLeftJSONObject!!.put(this.positionStrings!!.Y, rectangle.getMaxY())
bottomRightJSONObject!!.put(this.positionStrings!!.X, rectangle.getMaxX())
bottomRightJSONObject!!.put(this.positionStrings!!.Y, rectangle.getMaxY())
firstCustomCollisionMaskJSONArray!!.put(topLeftJSONObject)
firstCustomCollisionMaskJSONArray!!.put(topRightJSONObject)
firstCustomCollisionMaskJSONArray!!.put(bottomRightJSONObject)
firstCustomCollisionMaskJSONArray!!.put(bottomLeftJSONObject)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return customCollisionMaskJSONArray
}


}
                
            

