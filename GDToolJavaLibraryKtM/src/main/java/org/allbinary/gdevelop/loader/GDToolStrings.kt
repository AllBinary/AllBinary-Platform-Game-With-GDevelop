
        /*
                *  
                *  Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license  Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.string.StringUtil
import org.allbinary.string.CommonSeps
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDToolStrings
            : Object
         {
        
companion object {
            
    private val instance: GDToolStrings = GDToolStrings()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDToolStrings{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDToolStrings.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    val FILENAME: String = "fileName: "

    val ASSET_PREFIX: String = "assets\\"

    val JSON: String = "json"

    val JAVA: String = "java"

    val PNG: String = "png"

    val DAT: String = "dat"

    val OGG: String = "ogg"

    val TXT: String = "txt"

    val HTML: String = "html"

    val _GLSL: String = "_glsl"

    val XML: String = "xml"

    val _XML: String = ".xml"

    val _JSON: String = ".json"

    val _SVG: String = ".svg"

    val _T: String = ".t"

    val _BLANK_: String = "BLANK"

    val _TOUCH_: String = "TOUCH"

    val BUTTON: String = "button"

    val _OBJ: String = "_obj"

    val _MTL: String = "_mtl"

    val _MD2: String = "_md2"

    val BLANK: String = "blank"

    val UNDERSCORE_0: String = CommonSeps.getInstance()!!.UNDERSCORE +"0"

    val RESOURCE_0: String = "        resourceUtil.addResource("

    val GD_RESOURCE: String = "gdResources."

    val _RESOURCE: String = ", "

    val RESOURCE_1: String = "Integer.valueOf(androidResources.raw."

    val RESOURCE_2: String = "));"

    val SOUND_RESOURCE: String = ".getInstance().getResource(), "

    val GD_CURRENT_LAYOUT_INDEX: String = "<GD_CURRENT_INDEX>"

    val GD_EXTERNAL_LAYOUT_INDEX: String = "<GD_EXTERNAL_LAYOUT_INDEX>"

    val GD_CREATE_INSTANCE_INDEX: String = "<GD_CREATE_INSTANCE_INDEX>"

    val GD_NODE_IDS: String = "<GD_NODE_IDS>"

    val NOT_USED_FOR_THREED_GAMES: String = "Not Used For Threed Games "

    val LESS_THAN_ESCAPE_CODE: String = "&lt;"

    val LESS_THAN: String = "<"

    private val stringUtil: StringUtil = StringUtil.getInstance()!!

    open fun getExtensions(threedFileList: BasicArrayList, resource: String)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var threedFileList = threedFileList
    //var resource = resource

    var stringList: BasicArrayList = BasicArrayListD()


    var size: Int = threedFileList!!.size()!!


    var file: AbFile


    var startIndex: Int= 0


    var path: String





                        for (index in 0 until size)

        {
file= threedFileList!!.get(index) as AbFile
path= file.getPath()
startIndex= path.indexOf(resource)

    
                        if(startIndex >= 0)
                        
                                    {
                                    
    
                        if(path.indexOf(this._OBJ) >= 0)
                        
                                    {
                                    stringList!!.add(_OBJ)

                                    }
                                
                             else 
    
                        if(path.indexOf(this._MTL) >= 0)
                        
                                    {
                                    stringList!!.add(_MTL)

                                    }
                                
                             else 
    
                        if(path.indexOf(this._MD2) >= 0)
                        
                                    {
                                    stringList!!.add(this._MD2)

                                    }
                                
                             else 
    
                        if(path.endsWith(this._GLSL))
                        
                                    {
                                    stringList!!.add(this._GLSL)

                                    }
                                
                             else 
    
                        if(path.endsWith(this.PNG))
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.EMPTY_STRING)

                                    }
                                
                             else 
    
                        if(resource.indexOf(this._T) >= 0)
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.NULL_STRING)

                                    }
                                
                             else 
    
                        if(path.endsWith(this.DAT))
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.NULL_STRING)

                                    }
                                
                             else 
    
                        if(path.endsWith(this.OGG))
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.NULL_STRING)

                                    }
                                
                             else 
    
                        if(path.endsWith(this.TXT))
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.NULL_STRING)

                                    }
                                
                             else 
    
                        if(path.endsWith(this.HTML))
                        
                                    {
                                    stringList!!.add(this.stringUtil!!.NULL_STRING)

                                    }
                                
                        else {
                            stringList!!.add(this.stringUtil!!.NULL_STRING)

                        }
                            

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringList
}


}
                
            

