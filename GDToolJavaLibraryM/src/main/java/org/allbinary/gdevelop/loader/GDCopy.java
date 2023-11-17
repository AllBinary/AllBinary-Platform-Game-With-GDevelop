/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.gdevelop.loader;

import java.util.Vector;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

public class GDCopy {

    private final CommonStrings commonStrings = CommonStrings.getInstance();

    public void copy() throws Exception {
        
        try {
            final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
            final FileUtil fileUtil = FileUtil.getInstance();

            final Vector files = FileListFetcher.getInstance().getFiles(
                    gdToolStrings.ROOT_PATH + "Resources\\2d\\images\\raw", "json");

            final String PATH = gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\";

            final int size = files.size();
            LogUtil.put(LogFactory.getInstance("Total Files for Copying: " + size, this, commonStrings.PROCESS));
            AbFile file;
            AbPath toAbPath;
            AbPath fromAbPath;
            for (int index = 0; index < size; index++) {
                file = (AbFile) files.get(index);
                LogUtil.put(LogFactory.getInstance("Copying From File: " + file.getPath(), this, commonStrings.PROCESS));
                //LogUtil.put(LogFactory.getInstance("File: " + file.isFile(), this, commonStrings.PROCESS));
                LogUtil.put(LogFactory.getInstance("Copying To File: " + PATH + file.getName(), this, commonStrings.PROCESS));
                fromAbPath = new AbPath(file.getPath());
                toAbPath = new AbPath(PATH + file.getName());
                fileUtil.copy(fromAbPath, toAbPath);
            }

        } catch(Exception e) {
            throw e;
        }
    }
    
    public static void main(final String[] args) throws Exception {
        new GDCopy().copy();
    }
    
}
