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

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

public class GDCopy {
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();

    public void copy() throws Exception {
        
        try {
            final GDPaths gdPaths = GDPaths.getInstance();
            final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
            final FileUtil fileUtil = FileUtil.getInstance();
            
            final BasicArrayList files = FileListFetcher.getInstance().getFiles(
                    gdPaths.TWOD_RESOURCES_PATH, gdToolStrings.JSON);

            final StringMaker stringMaker = new StringMaker();
            final String PATH = stringMaker.append(gdPaths.ROOT_PATH).append("platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\").toString();

            final int size = files.size();
            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append("Total Files for Copying: ").appendint(size).toString(), this, this.commonStrings.PROCESS);
            AbFile file;
            AbPath toAbPath;
            AbPath fromAbPath;
            for (int index = 0; index < size; index++) {
                file = (AbFile) files.get(index);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append("Copying From File: ").append(file.getPath()).toString(), this, this.commonStrings.PROCESS);
                //logUtil.put("File: " + file.isFile(), this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append("Copying To File: ").append(PATH).append(file.getName()).toString(), this, this.commonStrings.PROCESS);
                fromAbPath = new AbPath(file.getPath(), StringUtil.getInstance().EMPTY_STRING);
                toAbPath = new AbPath(PATH + file.getName(), StringUtil.getInstance().EMPTY_STRING);
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
