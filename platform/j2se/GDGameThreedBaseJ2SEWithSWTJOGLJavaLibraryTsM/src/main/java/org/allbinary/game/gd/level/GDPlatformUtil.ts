
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { Image } from '../../../../../javax/microedition/lcdui/Image.js';
//not GWT import const Image

import { CameraLayer } from '../../../../../org/allbinary/game/layer/CameraLayer.js';
//not GWT import const CameraLayer

import { ImageCache } from '../../../../../org/allbinary/image/ImageCache.js';
//not GWT import const ImageCache

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDPlatformUtil
            extends Object
         {
        

    private static readonly instance: GDPlatformUtil = new GDPlatformUtil();

    public static getInstance(): GDPlatformUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDPlatformUtil.instance;
    
}


    public getRange(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 9;
    
}


    public updateCamera(cameraLayer: CameraLayer){
cameraLayer!.setRotationY(18);
    
}


    public updateResource(imageCache: ImageCache, image: Image, resource: string){
}


}



