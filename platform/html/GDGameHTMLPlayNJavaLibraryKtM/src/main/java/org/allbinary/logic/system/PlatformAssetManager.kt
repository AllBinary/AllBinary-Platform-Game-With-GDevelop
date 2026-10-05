
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
        package org.allbinary.logic.system




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.ByteArrayInputStream
import java.io.InputStream
import java.util.HashMap
import java.util.Map
import com.google.gwt.resources.client.TextResource
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import gd.res.GD0GamePlaynResources
import gd.res.GD1GamePlaynResources

open public class PlatformAssetManager
            : Object
         {
        
companion object {
            
    private val instance: PlatformAssetManager = PlatformAssetManager()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: PlatformAssetManager{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PlatformAssetManager.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

                @Throws(Exception::class)
            
    open fun getResourceAsStream(resource: String)
        //nullable = true from not(false or (false and false)) = true
: InputStream{
    //var resource = resource

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!


    var inputStream: InputStream = resourceUtil!!.getResourceAsStream(resource)!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.getText(resource, inputStream)
}


    private val GET_TEXT: String = "getText"

    private var textToResource: Map = HashMap<Any, Any>()
//private Map requestToResource = new HashMap();
open public inner class RequestedText
            : Object
         {
        
/*Static stuff is not allowed for Kotlin inner classescompanion object {
            *//*
        }
            */


            //Auto Generated
            public constructor() : super()
            {
            }            
        
    var text: String

}
                
            
    open fun getTextResource(resource: String)
        //nullable = true from not(false or (false and false)) = true
: TextResource{
    //var resource = resource


                            {
                            


                            throw RuntimeException(resource)

                            }
                    
}


    open fun getText(resource: String, inputStream: InputStream)
        //nullable = true from not(false or (false and false)) = true
: InputStream{
    //var resource = resource
    //var inputStream = inputStream

    var requestedText2: RequestedText = textToResource!!.get(resource) as RequestedText


    
                        if(requestedText2 != 
                                    null
                                 && requestedText2!!.text != 
                                    null
                                )
                        
                                    {
                                    logUtil!!.putF("Text already loaded: " +resource, this, GET_TEXT)

    var byteArray: ByteArray = requestedText2!!.text.encodeToByteArray()!!


    var byteArrayInputStream: ByteArrayInputStream = ByteArrayInputStream(byteArray)




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return byteArrayInputStream

                                    }
                                
                        else {
                            
    
                        if(requestedText2 != 
                                    null
                                )
                        
                                    {
                                    logUtil!!.putF("Already Loading Text: " +resource, this, GET_TEXT)

                                    }
                                
                        else {
                            logUtil!!.putF("Loading Text: " +resource, this, GET_TEXT)

    var text: String = this.getTextResource(resource)!!.getText()!!


    var requestedText: RequestedText = RequestedText()

requestedText!!.text= text
textToResource!!.put(resource, requestedText)
logUtil!!.putF("Loaded Text: " +text.length, this, GET_TEXT)

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                        }
                            
}


}
                
            

