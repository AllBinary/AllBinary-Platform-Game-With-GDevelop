
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


import { FlagGameResources } from '../../../../org/allbinary/game/layer/waypoint/FlagGameResources.js';
//not GWT import const FlagGameResources

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDFlagResources extends FlagGameResources {
        

    private static readonly SINGLETON: FlagGameResources = new GDFlagResources();

    public static getInstance(): FlagGameResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFlagResources.SINGLETON;
    
}


private constructor (){

            super();
        
    var ROOT: string = "/gd_flag";;
    

    var SMALL: string = "_64_by_64.png";;
    

    var MEDIUM: string = SMALL;;
    

    var SIZE_FOUR: string = SMALL;;
    

    var SIZE_FIVE: string = SMALL;;
    

    var SIZE_SIX: string = SMALL;;
    

    var SIZE: string[] = 
                                                        [
                                                            SMALL,MEDIUM,SIZE_FOUR,SIZE_FIVE,SIZE_SIX
                                                        ];;
    
super.init(ROOT, SIZE);
    
this.NAME= "Player Waypoint";
    
}


}



