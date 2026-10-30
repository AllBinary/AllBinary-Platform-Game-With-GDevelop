
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
import { AndroidResources } from '../../../../org/allbinary/AndroidResources.js';
//not GWT import const AndroidResources

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;
type ResourceUtil<T = any, U = any> = typeof ResourceUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ResourceUtil;

import { GameYouLoseSound } from '../../../../org/allbinary/media/audio/GameYouLoseSound.js';
//not GWT import const GameYouLoseSound

import { GameYouWinSound } from '../../../../org/allbinary/media/audio/GameYouWinSound.js';
//not GWT import const GameYouWinSound

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameBaseAndroidResources
            extends Object
         {
        

protected constructor (){

            super();
        }

init(...args: any[]): any {
   
    if (args.length === 0) return this.init$overload1();
   
    if (args.length === 2) return this.init$overload2(args[0], args[1]);
   
   throw new TypeError('No matching overload: init'); }
  
                //@Throws(Exception.constructor)
            
    public init$overload1(){

    let resourceUtil: ResourceUtil = ResourceUtil.getInstance()!;;
    

    let androidResources: AndroidResources = AndroidResources.getInstance()!;;
    
}


                //@Throws(Exception.constructor)
            
    initImages(RESOURCES: string[]){



                            throw new Exception("No Impl");
                    
}


    init$overload2(RESOURCES: string[], ANDROID_RESOURCES: number[]){

    let resourceUtil: ResourceUtil = ResourceUtil.getInstance()!;;
    




                        for (
    let index: number = 0;index < RESOURCES.length; index++)
        {
resourceUtil!.addResource(RESOURCES[index]!, Integer.valueOf(ANDROID_RESOURCES[index]!));
    
}

}


}

