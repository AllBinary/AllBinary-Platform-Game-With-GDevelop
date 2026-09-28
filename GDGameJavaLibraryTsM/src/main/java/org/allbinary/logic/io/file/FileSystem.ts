
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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
        
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { AbPathData } 
const AbPathData = globalThis.org.allbinary.logic.io.path.AbPathData;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

//not plain js import { SystemProperties } 
const SystemProperties = globalThis.org.allbinary.logic.system.os.SystemProperties;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { AbFileSystem } from './AbFileSystem.js';
//not GWT import - same folder const AbFileSystem
//not plain js - same folder import { FilePathData } 
const FilePathData = globalThis.org.allbinary.logic.io.file.FilePathData;

export class FileSystem
            extends Object
         {
        

    public static PathExists(path: string): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AbFileSystem.getInstance()!.isDirectoryOrFile(path);;
    
}


    public static LoadStringFromFileSync(path: string): string{

    var logUtil: LogUtil = LogUtil.getInstance()!;;
    

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
logUtil!.putF(path, commonStrings, commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AbFileSystem.getInstance()!.readAsString(path);;
    
}


    public static DirectoryName(currentDirPath: string): string{

    var name: string = AbPathData.getInstance()!.removeNameFromPath(currentDirPath)!;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return name;
    
}


    public static ReadDirectory(currentDirPath: string, fileList: string[]): string[]{

    var PAGE_SIZE: number = 15;;
    

    var logUtil: LogUtil = LogUtil.getInstance()!;;
    

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    

    var stringUtil: StringUtil = StringUtil.getInstance()!;;
    

    var path: string = FixPath(currentDirPath)!;;
    

    var realFilePathAsStringArray: string[] = AbFileSystem.getInstance()!.getFilesAsStringArrayForPath(path)!;;
    

                        if(realFilePathAsStringArray == 
                                    null
                                )
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new Array(PAGE_SIZE);
    

                                    }
                                

    var totalPages: number = (realFilePathAsStringArray!.length /PAGE_SIZE) +1;;
    
fileList= new Array(totalPages *PAGE_SIZE);
    

    var size: number = realFilePathAsStringArray!.length
                ;;
    
logUtil!.putF(new StringMaker().append("FileSystem::ReadDirectory - total files: ")!.appendint(size)!.toString(), currentDirPath, commonStrings!.PROCESS);
    

    var remainingPageSize: number = fileList!.length -realFilePathAsStringArray!.length;;
    




                        for (
    var index: number = size;index < remainingPageSize; index++)
        {
fileList[index]= stringUtil!.EMPTY_STRING;
    
}





                        for (
    var index: number = 0;index < size; index++)
        {
fileList[index]= realFilePathAsStringArray[index]!;
    
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return fileList;
    
}


    static FixPath(path: string): string{

                        if(path.endsWith(CommonSeps.getInstance()!.COLON))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return path +FilePathData.getInstance()!.SEPARATORCHAR;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return path;
    
}


    public static UserHomePath(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SystemProperties.getInstance()!.getUserHomePath();;
    
}


    public static PathDelimiter(): string{

    var SEPARATOR: string = FilePathData.getInstance()!.SEPARATORCHAR;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SEPARATOR;
    
}


    public static ExtensionName(fullPath: string): string{

    var pathData: AbPathData = AbPathData.getInstance()!;;
    

    var name: string = pathData!.getNameFromPath(fullPath)!;;
    

                        if(name.startsWith(pathData!.EXTENSION_SEP))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!.EMPTY_STRING;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return pathData!.getExtensionWithDot(name);;
    

                        }
                            
}


    public static main(args: string[]){
}


}



