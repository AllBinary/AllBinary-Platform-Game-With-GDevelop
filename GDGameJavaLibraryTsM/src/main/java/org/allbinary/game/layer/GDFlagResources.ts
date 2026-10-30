
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


import { FlagGameResources } from '../../../../org/allbinary/game/layer/waypoint/FlagGameResources.js';
//not GWT import const FlagGameResources

//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
type NullUtil<T = any, U = any> = typeof NullUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof NullUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDFlagResources extends FlagGameResources {
        

    private static instance: any = NullUtil.getInstance()!.NULL_OBJECT;

    public static getInstance(): FlagGameResources{

                        if(GDFlagResources.instance == NullUtil.getInstance()!.NULL_OBJECT)
                        
                                    {
                                    GDFlagResources.instance= new GDFlagResources();
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFlagResources.instance as GDFlagResources;
    
}


private constructor (){

            super();
        
    let ROOT: string = "/gd_flag";;
    

    let SMALL: string = "_64_by_64.png";;
    

    let MEDIUM: string = SMALL;;
    

    let SIZE_FOUR: string = SMALL;;
    

    let SIZE_FIVE: string = SMALL;;
    

    let SIZE_SIX: string = SMALL;;
    

    let SIZE: string[] = 
                                                        [
                                                            SMALL,MEDIUM,SIZE_FOUR,SIZE_FIVE,SIZE_SIX
                                                        ];;
    
super.init(ROOT, SIZE);
    
this.NAME= "Player Waypoint";
    
}


}

