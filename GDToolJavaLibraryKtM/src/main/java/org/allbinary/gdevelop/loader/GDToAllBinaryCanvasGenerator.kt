
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
        
import org.allbinary.data.CamelCaseUtil
import org.allbinary.gdevelop.json.GDLayout
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace

open public class GDToAllBinaryCanvasGenerator : GDTransformGenerator {
        

    private val camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!

    private val stringMaker: StringMaker = StringMaker()

    private val xslPath: String

    private val path: String

    private var index: Int= 0

    private var name: String

    private var className: String

    private var origXslPath: String
public constructor (xslPath: String, path: String){
    //var xslPath = xslPath
    //var path = path
this.xslPath= xslPath
this.path= path
}


                @Throws(Exception::class)
            
    open fun loadLayout(layout: GDLayout, index: Int, size: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var layout = layout
    //var index = index
    //var size = size
this.index= index
this.name= this.camelCaseUtil!!.getAsCamelCase(layout.name, this.stringMaker)
this.stringMaker!!.delete(0, this.stringMaker!!.length())
this.className= this.stringMaker!!.append("GDGame")!!.append(this.name)!!.append("Canvas")!!.toString()
this.origXslPath= this.xslPath
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{
this.stringMaker!!.delete(0, this.stringMaker!!.length())

    var canvasJavaFile: String = this.stringMaker!!.append(this.gdPaths!!.GEN_PATH)!!.append(this.path)!!.append(this.className)!!.append(".java")!!.toString()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!


    var androidRFileAsString: String = this.gdData!!.getAsString(this.origXslPath, sharedBytes)!!


    var replace2: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, this.index.toString())


    var updatedXslDocumentStr: String = replace2.all(androidRFileAsString)!!

this.process(updatedXslDocumentStr, canvasJavaFile, sharedBytes)
}


}
                
            

