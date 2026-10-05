
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.FileInputStream
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonLabels
import org.allbinary.string.CommonSeps
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONObject
import org.json.JSONTokener

open public class GDToAllBinaryResourcesGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdResources: GDResources = GDResources.getInstance()!!

    private val timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)

    private val resourceStringMaker: StringMaker = StringMaker()

    private val gdResourceSelection: GDResourceSelection = GDResourceSelection.getInstance()!!

    private val GD_KEY: String = "//GD"

    private val INDENT: String = "        "

    private val SPACING: String = "    "

    private val PUBLIC_FINAL_STRING: String = "    public final String "

    private val VALUE_RESOURCE_START: String = " = \""

    private val VALUE_RESOURCE_END: String = "\";\n"

    private val TSJ: String = ".tsj"

    private val IMAGE: String = "image"

    private val DASH_ICON_DASH: String = "-icon-"

    private val WINDOWS_ICON: String = "windowsplashscreenanimatedicon"
public constructor ()
            : super()
        {
this.resourceStringMaker!!.append(this.GD_KEY)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


    open fun processResource(nameAsString: String, resourceString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var nameAsString = nameAsString
    //var resourceString = resourceString
this.gdResources!!.androidResourceList!!.add(nameAsString)

    var name: String = nameAsString!!.uppercase()!!

this.gdResources!!.resourceNameList!!.add(name)

    var resource: String = resourceString!!.lowercase()!!

this.gdResources!!.resourceList!!.add(resource)
}


    open fun appendResource(hasRotationImages: Boolean, name: String, resource: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var hasRotationImages = hasRotationImages
    //var name = name
    //var resource = resource
this.gdResourceSelection!!.appendCommentIfNeeded0(name, resource, this.resourceStringMaker, hasRotationImages)

    
                        if(resource.indexOf(this.DASH_ICON_DASH) >= 0 || resource.indexOf(this.WINDOWS_ICON) >= 0)
                        
                                    {
                                    
                                    }
                                
                        else {
                            this.resourceStringMaker!!.append(this.PUBLIC_FINAL_STRING)
this.resourceStringMaker!!.append(name)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_START)
this.resourceStringMaker!!.append(resource)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_END)

                        }
                            
}


    open fun appendResources(hasRotationImages: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var hasRotationImages = hasRotationImages

    var size: Int = this.gdResources!!.resourceNameList!!.size()!!





                        for (index in 0 until size)

        {
this.appendResource(hasRotationImages, this.gdResources!!.resourceNameList!!.get(index) as String, this.gdResources!!.resourceList!!.get(index) as String)
}

}


    open fun appendResourceStringArray(hasRotationImages: Boolean, usedList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var hasRotationImages = hasRotationImages
    //var usedList = usedList
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append("    public final String[] resourceStringArray = {\nBLANK,\n")

    var size: Int = this.gdResources!!.resourceNameList!!.size()!!


    var name: String


    var resource: String


    var arrayIndex: Int = 1


    var used: Boolean= false





                        for (index in 0 until size)

        {
name= this.gdResources!!.resourceNameList!!.get(index) as String
resource= this.gdResources!!.resourceList!!.get(index) as String

    
                        if(resource.indexOf(this.DASH_ICON_DASH) >= 0 || resource.indexOf(this.WINDOWS_ICON) >= 0)
                        
                                    {
                                    
                                    }
                                
                        else {
                            this.resourceStringMaker!!.append(this.INDENT)
used= this.gdResourceSelection!!.appendCommentIfNeeded(name, resource, this.resourceStringMaker, hasRotationImages)
this.resourceStringMaker!!.append(name)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMA)
this.resourceStringMaker!!.append(this.commonSeps!!.SPACE)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMENT)
this.resourceStringMaker!!.appendint(arrayIndex)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)

    
                        if(used)
                        
                                    {
                                    usedList!!.add(name)
arrayIndex++

                                    }
                                

                        }
                            
}

this.resourceStringMaker!!.append(this.SPACING)
this.resourceStringMaker!!.append(this.commonSeps!!.BRACE_CLOSE)
this.resourceStringMaker!!.append(this.commonSeps!!.SEMICOLON)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


    open fun appendResourceWidthArray(gdResourceList: BasicArrayList, usedList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdResourceList = gdResourceList
    //var usedList = usedList
this.resourceStringMaker!!.append("    public final int[] imageResourceWidthArray = {\n32,\n")

    var size: Int = usedList!!.size()!!


    var name: String


    var gdResource: GDResource


    var arrayIndex: Int = 1





                        for (index in 0 until size)

        {
name= usedList!!.get(index) as String
gdResource= this.getGDResourceForName(name, gdResourceList)

    
                        if(gdResource != 
                                    null
                                )
                        
                                    {
                                    this.resourceStringMaker!!.append(this.INDENT)
this.resourceStringMaker!!.appendint(gdResource!!.width)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMA)
this.resourceStringMaker!!.append(this.commonSeps!!.SPACE)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMENT)
this.resourceStringMaker!!.append(name)
this.resourceStringMaker!!.append(this.commonSeps!!.SPACE)
this.resourceStringMaker!!.appendint(arrayIndex)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)

                                    }
                                
                        else {
                            


                            throw RuntimeException(name +" not in " +this.listGDResources(gdResourceList))

                        }
                            
}

this.resourceStringMaker!!.append(this.SPACING)
this.resourceStringMaker!!.append(this.commonSeps!!.BRACE_CLOSE)
this.resourceStringMaker!!.append(this.commonSeps!!.SEMICOLON)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
arrayIndex++
}


    open fun appendResourceHeightArray(gdResourceList: BasicArrayList, usedList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdResourceList = gdResourceList
    //var usedList = usedList
this.resourceStringMaker!!.append("    public final int[] imageResourceHeightArray = {\n32,\n")

    var size: Int = usedList!!.size()!!


    var name: String


    var gdResource: GDResource


    var arrayIndex: Int = 1





                        for (index in 0 until size)

        {
name= usedList!!.get(index) as String
gdResource= this.getGDResourceForName(name, gdResourceList)

    
                        if(gdResource != 
                                    null
                                )
                        
                                    {
                                    this.resourceStringMaker!!.append(this.INDENT)
this.resourceStringMaker!!.appendint(gdResource!!.height)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMA)
this.resourceStringMaker!!.append(this.commonSeps!!.SPACE)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMENT)
this.resourceStringMaker!!.append(name)
this.resourceStringMaker!!.append(this.commonSeps!!.SPACE)
this.resourceStringMaker!!.appendint(arrayIndex)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)

                                    }
                                
                        else {
                            


                            throw RuntimeException(name)

                        }
                            
arrayIndex++
}

this.resourceStringMaker!!.append(this.SPACING)
this.resourceStringMaker!!.append(this.commonSeps!!.BRACE_CLOSE)
this.resourceStringMaker!!.append(this.commonSeps!!.SEMICOLON)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


    open fun getGDResourceForName(name: String, gdResourceList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: GDResource{
    //var name = name
    //var gdResourceList = gdResourceList

    var size: Int = gdResourceList!!.size()!!


    var gdResource: GDResource





                        for (index in 0 until size)

        {
gdResource= gdResourceList!!.get(index) as GDResource

    
                        if(name.compareTo(gdResource!!.name) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gdResource

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
}


    open fun listGDResources(gdResourceList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var gdResourceList = gdResourceList

    var stringMaker: StringMaker = StringMaker()


    var size: Int = gdResourceList!!.size()!!

stringMaker!!.appendint(size)!!.append(this.commonSeps!!.COLON)

    var gdResource: GDResource





                        for (index in 0 until size)

        {
gdResource= gdResourceList!!.get(index) as GDResource
stringMaker!!.append(gdResource!!.name)!!.append(this.commonSeps!!.COMMA)
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringMaker!!.toString()
}


    private val SLIDER: String = "_slider_"

    private val BATTERY: String = "battery_"

    private val HEART: String = "heart_"

    private val _1: String = "_1."

    private val BUTTON: String = "button"

                @Throws(Exception::class)
            
    open fun appendImmediatelyLoadedImages()
        //nullable = true from not(false or (false and true)) = true
{
this.resourceStringMaker!!.append("    public final String[] requiredResourcesBeforeLoadingArray = {\n")

    var size: Int = this.gdResources!!.resourceNameList!!.size()!!


    var resource: String





                        for (index in 0 until size)

        {
resource= this.gdResources!!.resourceList!!.get(index) as String

    
                        if(resource.endsWith(this.TSJ))
                        
                                    {
                                    this.logUtil!!.putF(StringMaker().
                            append(this.gdToolStrings!!.FILENAME)!!.append(resource)!!.toString(), this, this.commonStrings!!.PROCESS)
this.appendImmediatelyLoadedImages(resource)

                                    }
                                
                             else 
    
                        if(resource.indexOf(this.BUTTON) >= 0)
                        
                                    {
                                    this.appendImmediatelyLoadedImage(resource)

                                    }
                                
                             else 
    
                        if(resource.indexOf(this.SLIDER) >= 0)
                        
                                    {
                                    this.appendImmediatelyLoadedImage(resource)

                                    }
                                
                             else 
    
                        if(resource.indexOf(this.BATTERY) >= 0 && resource.contains(this._1))
                        
                                    {
                                    this.appendImmediatelyLoadedImage(resource)

                                    }
                                
                             else 
    
                        if(resource.indexOf(this.HEART) >= 0 && resource.contains(this._1))
                        
                                    {
                                    this.appendImmediatelyLoadedImage(resource)

                                    }
                                
}

this.resourceStringMaker!!.append("    };\n")
}


                @Throws(Exception::class)
            
    open fun appendImmediatelyLoadedImages(path: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var path = path

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var inputStream: FileInputStream = FileInputStream(this.gdPaths!!.TWOD_RESOURCES_PATH +path)

sharedBytes!!.outputStream!!.reset()

    var gameAsConfiguration: String = streamUtil!!.getByteArray.toCharArray()


    var jsonTokener: JSONTokener = JSONTokener(gameAsConfiguration)


    var jsonObject: JSONObject = jsonTokener!!.nextValue() as JSONObject


    var imagePath: String = jsonObject!!.getString(this.IMAGE)!!

this.logUtil!!.putF(StringMaker().
                            append(this.gdToolStrings!!.FILENAME)!!.append(imagePath)!!.toString(), this, this.commonStrings!!.PROCESS)
this.appendImmediatelyLoadedImage(imagePath)
}


    open fun appendImmediatelyLoadedImage(imagePath: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var imagePath = imagePath

    var endIndex: Int = imagePath!!.lastIndexOf('.')!!


    var imageName: String = imagePath!!.substring(0, endIndex)!!


    var name: String = imageName!!.uppercase()!!

this.resourceStringMaker!!.append("gdResources.")
this.resourceStringMaker!!.append(name)
this.resourceStringMaker!!.append(this.commonSeps!!.COMMA)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


                @Throws(Exception::class)
            
    open fun process1()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{

    var stringMaker: StringMaker = StringMaker()


    var hasRotationImages: Boolean = this.gdResourceSelection!!.hasRotationImages()!!

this.appendResources(hasRotationImages)
this.timeDelayHelper!!.setStartTimeTNT()

    var RESOURCE_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.origin"


    var RESOURCE: String = this.gdPaths!!.GEN_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.java"


    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(RESOURCE_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var usedList: BasicArrayList = BasicArrayListD()

this.appendResourceStringArray(hasRotationImages, usedList)

    var replace: Replace = Replace(this.GD_KEY, this.resourceStringMaker!!.toString())


    var newFileAsString: String = replace.all(androidRFileAsString)!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(RESOURCE)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE, newFileAsString)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(this.timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return usedList
}


                @Throws(Exception::class)
            
    open fun process2(files: BasicArrayList, usedList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var files = files
    //var usedList = usedList

    var stringMaker: StringMaker = StringMaker()

this.resourceStringMaker!!.delete(0, this.resourceStringMaker!!.length())
this.resourceStringMaker!!.append(this.GD_KEY)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append("final GDResources gdResources = GDResources.getInstance();")
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)

    var gdImageSizeGenerator: GDImageSizeGenerator = GDImageSizeGenerator()


    var gdResourceList: BasicArrayList = gdImageSizeGenerator!!.process(files)!!

this.timeDelayHelper!!.setStartTimeTNT()

    var LAZY_RESOURCE_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDLazyResources.origin"


    var LAZY_RESOURCE: String = this.gdPaths!!.GEN_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDLazyResources.java"

stringMaker!!.delete(0, stringMaker!!.length())

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(LAZY_RESOURCE_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()

this.appendResourceWidthArray(gdResourceList, usedList)
this.appendResourceHeightArray(gdResourceList, usedList)
this.appendImmediatelyLoadedImages()

    var replace: Replace = Replace(this.GD_KEY, this.resourceStringMaker!!.toString())


    var newFileAsString: String = replace.all(androidRFileAsString)!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +LAZY_RESOURCE, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(LAZY_RESOURCE, newFileAsString)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(this.timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}


                @Throws(Exception::class)
            
    open fun process(twoDFileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var twoDFileList = twoDFileList

    var usedList: BasicArrayList = this.process1()!!

this.process2(twoDFileList, usedList)
}


}
                
            

