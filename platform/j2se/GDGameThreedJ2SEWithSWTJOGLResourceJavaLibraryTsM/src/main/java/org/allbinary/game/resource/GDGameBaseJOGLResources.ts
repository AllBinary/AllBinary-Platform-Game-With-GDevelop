
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { GameYouLoseSound } from '../../../../org/allbinary/media/audio/GameYouLoseSound.js';
//not GWT import const GameYouLoseSound

import { GameYouWinSound } from '../../../../org/allbinary/media/audio/GameYouWinSound.js';
//not GWT import const GameYouWinSound

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameBaseJOGLResources
            extends Object
         {
        

protected constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public init(){
}


                //@Throws(Exception.constructor)
            
    initImages(RESOURCES: string[]){



                            throw new Exception("No Impl");
                    
}


    init(RESOURCES: string[], ANDROID_RESOURCES: number[]){

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!;;
    




                        for (
    var index: number = 0;index < RESOURCES.length; index++)
        {
resourceUtil!.addResource(RESOURCES[index]!, Integer.valueOf(ANDROID_RESOURCES[index]!));
    
}

}


}



