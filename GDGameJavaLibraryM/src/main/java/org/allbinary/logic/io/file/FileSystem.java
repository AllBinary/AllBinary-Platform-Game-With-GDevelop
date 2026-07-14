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
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

/**
 *
 * @author User
 */
public class FileSystem {
    
    public static boolean PathExists(final String path) {
        return AbFileSystem.getInstance().isDirectoryOrFile(path);
    }

    public static String LoadStringFromFileSync(final String path) {
        final LogUtil logUtil = LogUtil.getInstance();
        final CommonStrings commonStrings = CommonStrings.getInstance();
        logUtil.putF(path, commonStrings, commonStrings.PROCESS);
        return AbFileSystem.getInstance().readAsString(path);
    }
    
    public static String DirectoryName(final String currentDirPath) {
//        final LogUtil logUtil = LogUtil.getInstance();
//        final CommonStrings commonStrings = CommonStrings.getInstance();
        final String name = AbPathData.getInstance().removeNameFromPath(currentDirPath);
//        logUtil.putF(new StringMaker().append(currentDirPath).append(" FileSystem::DirectoryName: ").append(name).toString(), currentDirPath, commonStrings.PROCESS);
        return name;
    }
    
    public static String[] ReadDirectory(final String currentDirPath, String[] fileList) {
        final int PAGE_SIZE = 15; //This should be app specific.
        final LogUtil logUtil = LogUtil.getInstance();
        final CommonStrings commonStrings = CommonStrings.getInstance();
        
        final StringUtil stringUtil = StringUtil.getInstance();
        final String path = FixPath(currentDirPath);
        final String[] realFilePathAsStringArray = AbFileSystem.getInstance().getFilesAsStringArrayForPath(path);
        if(realFilePathAsStringArray == null) {
            return new String[PAGE_SIZE];
        }
        
        final int totalPages = (realFilePathAsStringArray.length / PAGE_SIZE) + 1;
//        logUtil.putF(new StringMaker().append("FileSystem::ReadDirectory totalPages: ").appendint(totalPages).toString(), currentDirPath, commonStrings.PROCESS);

        fileList = new String[totalPages * PAGE_SIZE];
        
        final int size = realFilePathAsStringArray.length;
        
        logUtil.putF(new StringMaker().append("FileSystem::ReadDirectory - total files: ").appendint(size).toString(), currentDirPath, commonStrings.PROCESS);
        
        final int remainingPageSize = fileList.length - realFilePathAsStringArray.length;
//        logUtil.putF(new StringMaker().append("FileSystem::ReadDirectory size: ").appendint(size).append(" remainingPageSize: ").appendint(remainingPageSize).toString(), currentDirPath, commonStrings.PROCESS);
        for(int index = size; index < remainingPageSize; index++) {
            fileList[index] = stringUtil.EMPTY_STRING;
        }
        
        for(int index = 0; index < size; index++) {
            fileList[index] = realFilePathAsStringArray[index];
        }

        return fileList;
    }
    
    private static String FixPath(String path) {
        if(path.endsWith(CommonSeps.getInstance().COLON)) {
            return path + FilePathData.getInstance().SEPARATORCHAR;
        }
        return path;
    }

    public static String UserHomePath() {
        return SystemProperties.getInstance().getUserHomePath();
    }
    
    public static char PathDelimiter() {
//        final LogUtil logUtil = LogUtil.getInstance();
//        final CommonStrings commonStrings = CommonStrings.getInstance();
        final char SEPARATOR = FilePathData.getInstance().SEPARATORCHAR;
//        logUtil.putF(new StringMaker().appendchar(SEPARATOR).append(" FileSystem::PathDelimiter").toString(), SEPARATOR, commonStrings.PROCESS);
        return SEPARATOR;
    }
    
    public static String ExtensionName(final String fullPath) {
//        final LogUtil logUtil = LogUtil.getInstance();
//        final CommonStrings commonStrings = CommonStrings.getInstance();
        final AbPathData pathData = AbPathData.getInstance();
        final String name = pathData.getNameFromPath(fullPath);
//        logUtil.putF(new StringMaker().append(fullPath).append(" directory?").append(name).toString(), commonStrings, commonStrings.PROCESS);        
        if(name.startsWith(pathData.EXTENSION_SEP)) {
//            logUtil.putF(new StringMaker().append(fullPath).append(" directory?").toString(), commonStrings, commonStrings.PROCESS);
            return StringUtil.getInstance().EMPTY_STRING;
        } else {
//            logUtil.putF(pathData.getExtension(name), commonStrings, commonStrings.PROCESS);            
            return pathData.getExtensionWithDot(name);
        }
    }
}
