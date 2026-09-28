
        /* Generated Code Do Not Modify */

        


//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { Direction } from '../../../../org/allbinary/direction/Direction.js';
//not GWT import const Direction

import { DirectionFactory } from '../../../../org/allbinary/direction/DirectionFactory.js';
//not GWT import const DirectionFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { AdConfiguration } from './AdConfiguration.js';
//not GWT import - same folder const AdConfiguration

export class GDGameAdConfiguration extends AdConfiguration {
        

    private readonly directionArray: Direction[] = 
                                                        [
                                                            DirectionFactory.getInstance()!.DOWN,DirectionFactory.getInstance()!.UP
                                                        ];

public constructor (){
            super(
                                                [
                                                    "AllBinary_GDGame_Threed_Android","",StringUtil.getInstance()!.EMPTY_STRING
                                                ]);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


    public getValidAdSpots(): Direction[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return directionArray;
    
}


    public processDemo(state: number){
}


}



