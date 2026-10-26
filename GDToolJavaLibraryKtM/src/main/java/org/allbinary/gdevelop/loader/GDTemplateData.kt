
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.w3c.dom.Element

open public class GDTemplateData
            : Object
         {
        

    private val TEMPLATE: String = "template"

    private val document: Document

    private val rootElement: Element
public constructor ()
            : super()
        {

        try {
            this.document= DocumentBuilderFactory.newInstance()!!.newDocumentBuilder()!!.newDocument()!!
} catch(e: Exception)
            {



                            throw RuntimeException(e)
}

this.rootElement= this.document.createElement(this.TEMPLATE)!!
this.document.appendChild(this.rootElement)
}


    open fun add(name: String, attributeNameArray: Array<String?>, valueArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Element{
    //var name = name
    //var attributeNameArray = attributeNameArray
    //var valueArray = valueArray

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.add(this.rootElement, name, attributeNameArray, valueArray)
}


    open fun add(parentElement: Element, name: String, attributeNameArray: Array<String?>, valueArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Element{
    //var parentElement = parentElement
    //var name = name
    //var attributeNameArray = attributeNameArray
    //var valueArray = valueArray

    var element: Element = this.document.createElement(name)!!


    var size: Int = attributeNameArray!!.size
                





                        for (index in 0 until size)

        {
element.setAttribute(attributeNameArray[index]!!, valueArray[index]!!)
}

parentElement!!.appendChild(element)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return element
}


    open fun getDocument()
        //nullable = true from not(false or (false and true)) = true
: Document{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.document
}


}
                
            

