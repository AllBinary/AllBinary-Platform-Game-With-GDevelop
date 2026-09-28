
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDParameterFactory } from './GDParameterFactory.js';
//not GWT import - same folder const GDParameterFactory
import { GDParameterMetadata } from './GDParameterMetadata.js';
//not GWT import - same folder const GDParameterMetadata

export class GDExpressionMetadata
            extends Object
         {
        

    private readonly stringUtil: StringUtil = StringUtil.getInstance()!;

    private readonly parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!;

    public readonly returnType: string;

    public readonly fullname: string;

    public readonly description: string;

    public readonly group: string;

    public readonly smallIconFilename: string;

    public readonly extensionNamespace: string;

    public readonly isPrivate: boolean;

    public readonly parameterMetadataList: BasicArrayList = new BasicArrayListD();

    public shown: boolean;

    public helpPath: string;

public constructor (returnType: string, extensionNamespace: string, name: string, fullname: string, description: string, group: string, smallicon: string){

            super();
        this.returnType= returnType;
    
this.extensionNamespace= extensionNamespace;
    
this.fullname= fullname;
    
this.description= description;
    
this.group= group;
    
this.shown= true;
    
this.smallIconFilename= smallicon;
    
this.isPrivate= false;
    
}


    public addParameter(type: string, description: string, optionalObjectType: string, parameterIsOptional: boolean): GDExpressionMetadata{

    var supplementaryInformation: string = (this.parameterFactory!.isObject(type) || this.parameterFactory!.isBehavior(type))
                        ?       
                                (optionalObjectType!.isEmpty()
                        ?       
                                this.stringUtil!.EMPTY_STRING
                                :

                            this.extensionNamespace +optionalObjectType;

    )
                                :

                            optionalObjectType;

    ;;
    

    var parameterMetadata: GDParameterMetadata = new GDParameterMetadata(type, supplementaryInformation, parameterIsOptional, description, false);;
    
this.parameterMetadataList!.add(parameterMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public addCodeOnlyParameter(type: string, supplementaryInformation: string): GDExpressionMetadata{

    var parameterMetadata: GDParameterMetadata = new GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil!.EMPTY_STRING, true);;
    
this.parameterMetadataList!.add(parameterMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public setHidden(): GDExpressionMetadata{
this.shown= false;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


}



