
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDTypeFactory
            extends Object
         {
        

    private static readonly instance: GDTypeFactory = new GDTypeFactory();

    public static getInstance(): GDTypeFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDTypeFactory.instance;
    
}


    public readonly STRING: string = "String";

    public readonly NUMBER: string = "Number";

    public readonly BOOLEAN: string = "Boolean";

    public readonly STRUCTURE: string = "Structure";

    public readonly ARRAY: string = "Array";

    public get(type: string): string{

                        if(this.STRING.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRING;
    

                                    }
                                
                             else 
                        if(this.NUMBER.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.NUMBER;
    

                                    }
                                
                             else 
                        if(this.BOOLEAN.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.BOOLEAN;
    

                                    }
                                
                             else 
                        if(this.STRUCTURE.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRUCTURE;
    

                                    }
                                
                             else 
                        if(this.ARRAY.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.ARRAY;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null;
    
}


    public isPrimitive(type: string): boolean{

                        if(this.STRING == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                             else 
                        if(this.NUMBER == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                             else 
                        if(this.BOOLEAN == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


}



