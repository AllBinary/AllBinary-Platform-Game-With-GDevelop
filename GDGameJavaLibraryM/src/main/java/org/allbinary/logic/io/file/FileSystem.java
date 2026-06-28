/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.logic.io.file;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.os.SystemProperties;
import org.allbinary.string.CommonStrings;

/**
 *
 * @author User
 */
public class FileSystem {
    
    public static String DirectoryName(final String currentDirPath) {
        return AbPathData.getInstance().removeNameFromPath(currentDirPath, FileSystem.PathDelimiter());
    }
    
    public static String[] ReadDirectory(final String currentDirPath, String[] fileList) {
        final StringUtil stringUtil = StringUtil.getInstance();
        final String[] realFilePathAsStringArray = AbFileSystem.getFilesAsStringArrayForPath(currentDirPath);
        final int totalPages = (realFilePathAsStringArray.length / 15) + 1;

        fileList = new String[totalPages * 15];
        
        final int size = realFilePathAsStringArray.length;
        
//        final LogUtil logUtil = LogUtil.getInstance();
//        final CommonStrings commonStrings = CommonStrings.getInstance();
//        logUtil.putF(new StringMaker().append("total files in directory: ").appendint(size).toString(), currentDirPath, commonStrings.PROCESS);
        
        final int remainingPageSize = fileList.length - realFilePathAsStringArray.length;
        for(int index = size; index < remainingPageSize; index++) {
            fileList[index] = stringUtil.EMPTY_STRING;
        }
        
        for(int index = 0; index < size; index++) {
            fileList[index] = realFilePathAsStringArray[index];
        }

        return fileList;
    }
    
    public static String UserHomePath() {
        return SystemProperties.getInstance().getUserHomePath();
    }
    
    public static String PathDelimiter() {
        return FilePathData.getInstance().SEPARATOR;
    }
    
    public static String ExtensionName(final String fullPath) {
        return AbPathData.getInstance().getExtension(fullPath);
    }
}
