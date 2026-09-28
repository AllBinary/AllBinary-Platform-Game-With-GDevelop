
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDEventTypeFactory
            extends Object
         {
        

    private static readonly instance: GDEventTypeFactory = new GDEventTypeFactory();

    public static getInstance(): GDEventTypeFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDEventTypeFactory.instance;
    
}


    public readonly COMMENT: string = "BuiltinCommonInstructions::Comment";

    public readonly FOR_EACH: string = "BuiltinCommonInstructions::ForEach";

    public readonly FOR_EACH_CHILD: string = "BuiltinCommonInstructions::ForEachChild";

    public readonly GROUP: string = "BuiltinCommonInstructions::Group";

    public readonly LINK: string = "BuiltinCommonInstructions::Link";

    public readonly REPEAT: string = "BuiltinCommonInstructions::Repeat";

    public readonly STANDARD: string = "BuiltinCommonInstructions::Standard";

    public readonly WHILE: string = "BuiltinCommonInstructions::While";

    public get(type: string): string{

                        if(type.compareTo(this.COMMENT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.COMMENT;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.FOR_EACH) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FOR_EACH;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.FOR_EACH_CHILD) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FOR_EACH_CHILD;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.GROUP) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.GROUP;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.LINK) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.LINK;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.REPEAT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.REPEAT;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.STANDARD) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STANDARD;
    

                                    }
                                
                             else 
                        if(type.compareTo(this.WHILE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.WHILE;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null;
    
}


}



