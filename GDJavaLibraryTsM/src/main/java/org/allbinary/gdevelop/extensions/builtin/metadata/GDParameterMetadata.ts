
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDParameterMetadata
            extends Object
         {
        

    public readonly type: string;

    public readonly supplementaryInformation: string;

    public readonly optional: boolean;

    public readonly description: string;

    public readonly codeOnly: boolean;

    private longDescription: string;

    private defaultValue: string;

    private name: string;

public constructor (type: string, supplementaryInformation: string, optional: boolean, description: string, codeOnly: boolean){

            super();
        this.type= type;
    
this.supplementaryInformation= supplementaryInformation;
    
this.optional= optional;
    
this.description= description;
    
this.codeOnly= codeOnly;
    
}


    public setLongDescription(longDescription: string): GDParameterMetadata{
this.longDescription= longDescription;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public setDefaultValue(defaultValue: string): GDParameterMetadata{
this.defaultValue= defaultValue;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


}



