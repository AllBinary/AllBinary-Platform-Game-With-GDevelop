
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { GDEvent } from '../../../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDEventTypeFactory } from './GDEventTypeFactory.js';
//not GWT import - same folder const GDEventTypeFactory
import { GDWhileEvent } from './GDWhileEvent.js';
//not GWT import - same folder const GDWhileEvent
import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent
import { GDRepeatEvent } from './GDRepeatEvent.js';
//not GWT import - same folder const GDRepeatEvent
import { GDLinkEvent } from './GDLinkEvent.js';
//not GWT import - same folder const GDLinkEvent
import { GDGroupEvent } from './GDGroupEvent.js';
//not GWT import - same folder const GDGroupEvent
import { GDForEachChildVariableEvent } from './GDForEachChildVariableEvent.js';
//not GWT import - same folder const GDForEachChildVariableEvent
import { GDForEachEvent } from './GDForEachEvent.js';
//not GWT import - same folder const GDForEachEvent
import { GDCommentEvent } from './GDCommentEvent.js';
//not GWT import - same folder const GDCommentEvent

export class GDEventFactory
            extends Object
         {
        

    private static readonly instance: GDEventFactory = new GDEventFactory();

    public static getInstance(): GDEventFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDEventFactory.instance;
    
}


    public create(jsonObject: JSONObject): GDEvent{

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var eventTypeFactory: GDEventTypeFactory = GDEventTypeFactory.getInstance()!;;
    

    var type: string = jsonObject!.getString(gdProjectStrings!.TYPE)!;;
    
type= eventTypeFactory!.get(type);
    

                        if(type == eventTypeFactory!.COMMENT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDCommentEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.FOR_EACH)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDForEachEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.FOR_EACH_CHILD)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDForEachChildVariableEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.GROUP)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDGroupEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.LINK)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDLinkEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.REPEAT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDRepeatEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.STANDARD)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDStandardEvent(type, jsonObject);
    

                                    }
                                
                             else 
                        if(type == eventTypeFactory!.WHILE)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDWhileEvent(type, jsonObject);
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null;
    
}


}



