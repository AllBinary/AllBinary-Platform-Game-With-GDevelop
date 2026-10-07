
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event.builtin




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.gdevelop.json.event.GDEvent
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringUtil
import org.json.JSONObject

open public class GDLinkEvent : GDEvent {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val target: String

    val includeConfig: Int

    val eventsGroupName: String

    val includeStart: Int

    val includeEnd: Int

    val linkWasInvalid: Boolean
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var includeConfigFactory: GDIncludeConfigFactory = GDIncludeConfigFactory.getInstance()!!


    var includeJSONObject: JSONObject = jsonObject!!.getJSONObject(gdProjectStrings!!.INCLUDE)!!

this.includeConfig= includeJSONObject!!.getInt(gdProjectStrings!!.INCLUDE_CONFIG)
this.target= jsonObject!!.getString(gdProjectStrings!!.TARGET)

    
                        if(this.includeConfig == includeConfigFactory!!.INCLUDE_ALL)
                        
                                    {
                                    this.eventsGroupName= StringUtil.getInstance()!!.NULL_STRING

                                    }
                                
                             else 
    
                        if(this.includeConfig == includeConfigFactory!!.INCLUDE_EVENTS_GROUP)
                        
                                    {
                                    this.eventsGroupName= includeJSONObject!!.getString(gdProjectStrings!!.EVENTS_GROUP)

                                    }
                                
                        else {
                            this.eventsGroupName= StringUtil.getInstance()!!.NULL_STRING

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.CONSTRUCTOR, Exception())

                        }
                            
this.includeStart= 0
this.includeEnd= 0
this.linkWasInvalid= false
}


}
                
            

