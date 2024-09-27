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

import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDResourceSelection {
    
    protected static final GDResourceSelection instance = new GDResourceSelection();

    /**
     * @return the instance
     */
    public static GDResourceSelection getInstance() {
        return instance;
    }

    private final CommonSeps commonSeps = CommonSeps.getInstance();

    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final String BLANK = "BLANK";
    private final String TOUCH = "TOUCH";
    private final String UNDERSCORE_0 = commonSeps.UNDERSCORE + "0";
    private final String JSON = ".json";
    private final String T = ".t";
    
    private final String FOUND = "found";
    
    private final int SIZE = 100;

    public boolean appendCommentIfNeeded0(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;

        if (resource.toUpperCase().indexOf(BLANK) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(UNDERSCORE_0) && name.indexOf(TOUCH) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(JSON) >= 0 || resource.indexOf(T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (resource.toUpperCase().indexOf(BLANK) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(UNDERSCORE_0) && name.indexOf(TOUCH) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded2(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(JSON) >= 0 || resource.indexOf(T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(UNDERSCORE_0) && name.indexOf(TOUCH) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean hasRotationImages() {
        final FileUtil fileUtil = FileUtil.getInstance();
        final String filePath = gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
        final String fileAsString = fileUtil.readAsString(filePath);
        if(fileAsString.indexOf(FOUND) >= 0) {
            return true;
        }
        return false;
    }
    
}
