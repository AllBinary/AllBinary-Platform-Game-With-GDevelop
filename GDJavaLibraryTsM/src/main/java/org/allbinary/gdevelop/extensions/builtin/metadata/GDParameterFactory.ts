
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
            import { RuntimeException } from '../../../../../../java/lang/RuntimeException.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDParameterFactory
            extends Object
         {
        

    private static readonly instance: GDParameterFactory = new GDParameterFactory();

    public static getInstance(): GDParameterFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDParameterFactory.instance;
    
}


    public readonly OBJECT: string = "anyType";

    public readonly OBJECT_PTR: string = "objectPtr";

    public readonly OBJECT_LIST: string = "objectList";

    public readonly OBJECT_LIST_WITHOUT_PICKING: string = "objectListWithoutPicking";

    public readonly BEHAVIOR: string = "behavior";

    public readonly NUMBER: string = "number";

    public readonly EXPRESSION: string = "expression";

    public readonly CAMERA: string = "camera";

    public readonly FORCE_MULTIPLIER: string = "forceMultiplier";

    public readonly STRING: string = "string";

    public readonly LAYER: string = "layer";

    public readonly COLOR: string = "color";

    public readonly FILE: string = "file";

    public readonly JOY_AXIS: string = "joyaxis";

    public readonly STRING_WITH_SELECTOR: string = "stringWithSelector";

    public readonly SCENE_NAME: string = "sceneName";

    public readonly OBJECT_POINT_NAME: string = "objectPointName";

    public readonly OBJECT_ANIMATION_NAME: string = "objectAnimationName";

    public readonly VARIABLE: string = "variable";

    public readonly OBJECT_VAR: string = "objectvar";

    public readonly GLOBAL_VAR: string = "globalvar";

    public readonly SCENE_VAR: string = "scenevar";

    public readonly RELATIONAL_OPERATOR: string = "relationalOperator";

    public readonly OPERATOR: string = "operator";

    public readonly TRUE_OR_FALSE: string = "trueorfale";

    public readonly YES_OR_NO: string = "yesorno";

    public get(parameterType: string): string{

                        if(parameterType!.compareTo(this.OBJECT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_PTR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_PTR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_LIST) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_LIST;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_LIST_WITHOUT_PICKING) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_LIST_WITHOUT_PICKING;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.BEHAVIOR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.BEHAVIOR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.NUMBER) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.NUMBER;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.EXPRESSION) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.EXPRESSION;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.CAMERA) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.CAMERA;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.FORCE_MULTIPLIER) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FORCE_MULTIPLIER;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.STRING) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRING;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.LAYER) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.LAYER;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.COLOR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.COLOR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.FILE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FILE;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.JOY_AXIS) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.JOY_AXIS;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.STRING_WITH_SELECTOR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRING_WITH_SELECTOR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.SCENE_NAME) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.SCENE_NAME;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_POINT_NAME) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_POINT_NAME;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_ANIMATION_NAME) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_ANIMATION_NAME;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.VARIABLE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.VARIABLE;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.OBJECT_VAR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.OBJECT_VAR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.GLOBAL_VAR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.GLOBAL_VAR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.SCENE_VAR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.SCENE_VAR;
    

                                    }
                                
                             else 
                        if(parameterType!.compareTo(this.RELATIONAL_OPERATOR) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.RELATIONAL_OPERATOR;
    

                                    }
                                
                        else {
                            


                            throw new RuntimeException();
                    

                        }
                            
}


    public isObject(parameterType: string): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return parameterType == this.OBJECT || parameterType == this.OBJECT_PTR || parameterType == this.OBJECT_LIST || parameterType == this.OBJECT_LIST_WITHOUT_PICKING;
    
}


    public isBehavior(parameterType: string): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return parameterType == this.BEHAVIOR;
    
}


    public isExpression(type: string, parameterType: string): boolean{

                        if(type == this.NUMBER)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return parameterType == this.EXPRESSION || parameterType == this.CAMERA || parameterType == this.FORCE_MULTIPLIER;
    

                                    }
                                
                             else 
                        if(type == "string")
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return parameterType == this.STRING || parameterType == this.LAYER || parameterType == this.COLOR || parameterType == this.FILE || parameterType == this.JOY_AXIS || parameterType == this.STRING_WITH_SELECTOR || parameterType == this.SCENE_NAME || parameterType == this.OBJECT_POINT_NAME || parameterType == this.OBJECT_ANIMATION_NAME;
    

                                    }
                                
                             else 
                        if(type == this.VARIABLE)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return parameterType == this.OBJECT_VAR || parameterType == this.GLOBAL_VAR || parameterType == this.SCENE_VAR;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


}



