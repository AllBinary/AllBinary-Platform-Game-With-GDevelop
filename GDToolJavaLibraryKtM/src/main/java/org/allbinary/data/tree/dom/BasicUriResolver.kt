
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
        package org.allbinary.data.tree.dom




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.xml.transform.Source
import javax.xml.transform.TransformerException
import javax.xml.transform.URIResolver
import org.allbinary.logic.io.path.AbFilePath
import org.allbinary.logic.io.path.AbPath
import org.allbinary.logic.communication.log.LogUtil

open public class BasicUriResolver
            : Object
        
                , URIResolver {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!
public constructor ()
            : super()
        {
}


                @Throws(TransformerException::class)
            
    open fun resolve(href: String, base: String)
        //nullable = true from not(false or (false and false)) = true
: Source{
var href = href
var base = base

        try {
            
    var stringBuffer: StringBuffer = StringBuffer()

stringBuffer!!.append(href)

    var abPath: AbPath = AbFilePath(stringBuffer!!.toString()) as AbPath

stringBuffer!!.delete(0, stringBuffer!!.length())
stringBuffer!!.append("attempt to use xsl:import: href=")
stringBuffer!!.append(href)
stringBuffer!!.append("\nBase= ")
stringBuffer!!.append(base)
stringBuffer!!.append("\nNew path= ")
stringBuffer!!.append(abPath!!.toString())
stringBuffer!!.append(" is a urlglobal")
this.logUtil!!.putF(stringBuffer!!.toString(), this, "resolve")



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
} catch(e: TransformerException)
            {



                            throw e
}
 catch(e: Exception)
            {



                            throw TransformerException(e)
}

}


    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

        try {
            
    var stringBuffer: StringBuffer = StringBuffer()

stringBuffer!!.append("/{import url}")



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!!.toString()
} catch(e: Exception)
            {



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return "BasicUriResolver - Does not work without webapp path should be changed"
}

}


}
                
            

