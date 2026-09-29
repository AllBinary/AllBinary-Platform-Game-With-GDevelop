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
export class FileSystem extends Object {
    static PathExists(path) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return AbFileSystem.getInstance().isDirectoryOrFile(path);
        ;
    }
    static LoadStringFromFileSync(path) {
        var logUtil = LogUtil.getInstance();
        ;
        var commonStrings = CommonStrings.getInstance();
        ;
        logUtil.putF(path, commonStrings, commonStrings.PROCESS);
        //if statement needs to be on the same line and ternary does not work the same way.
        return AbFileSystem.getInstance().readAsString(path);
        ;
    }
    static DirectoryName(currentDirPath) {
        var name = AbPathData.getInstance().removeNameFromPath(currentDirPath);
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return name;
    }
    static ReadDirectory(currentDirPath, fileList) {
        var PAGE_SIZE = 15;
        ;
        var logUtil = LogUtil.getInstance();
        ;
        var commonStrings = CommonStrings.getInstance();
        ;
        var stringUtil = StringUtil.getInstance();
        ;
        var path = FileSystem.FixPath(currentDirPath);
        ;
        var realFilePathAsStringArray = AbFileSystem.getInstance().getFilesAsStringArrayForPath(path);
        ;
        if (realFilePathAsStringArray ==
            null) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new Array(PAGE_SIZE);
        }
        var totalPages = (realFilePathAsStringArray.length / PAGE_SIZE) + 1;
        ;
        fileList = new Array(totalPages * PAGE_SIZE);
        var size = realFilePathAsStringArray.length;
        ;
        logUtil.putF(new StringMaker().append("FileSystem::ReadDirectory - total files: ").appendint(size).toString(), currentDirPath, commonStrings.PROCESS);
        var remainingPageSize = fileList.length - realFilePathAsStringArray.length;
        ;
        for (var index = size; index < remainingPageSize; index++) {
            fileList[index] = stringUtil.EMPTY_STRING;
        }
        for (var index = 0; index < size; index++) {
            fileList[index] = realFilePathAsStringArray[index];
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return fileList;
    }
    static FixPath(path) {
        if (path.endsWith(CommonSeps.getInstance().COLON)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return path + FilePathData.getInstance().SEPARATORCHAR;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return path;
    }
    static UserHomePath() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return SystemProperties.getInstance().getUserHomePath();
        ;
    }
    static PathDelimiter() {
        var SEPARATOR = FilePathData.getInstance().SEPARATORCHAR;
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return SEPARATOR;
    }
    static ExtensionName(fullPath) {
        var pathData = AbPathData.getInstance();
        ;
        var name = pathData.getNameFromPath(fullPath);
        ;
        if (name.startsWith(pathData.EXTENSION_SEP)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return StringUtil.getInstance().EMPTY_STRING;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return pathData.getExtensionWithDot(name);
            ;
        }
    }
    static main(args) {
    }
}
