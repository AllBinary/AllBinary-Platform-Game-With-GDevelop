
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDIncludeConfigFactory
            extends Object
         {
        

    private static readonly instance: GDIncludeConfigFactory = new GDIncludeConfigFactory();

    public static getInstance(): GDIncludeConfigFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDIncludeConfigFactory.instance;
    
}


    public readonly INCLUDE_ALL: number = 0;

    public readonly INCLUDE_EVENTS_GROUP: number = 1;

}



