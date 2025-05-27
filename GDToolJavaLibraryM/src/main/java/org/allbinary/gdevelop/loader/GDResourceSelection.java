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

import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

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

    private final String FOUND = "found";
    
    private final int SIZE = 100;

    public boolean appendCommentIfNeeded0(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        
        if (resource.toUpperCase().indexOf(gdToolStrings._BLANK_) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(gdToolStrings.UNDERSCORE_0) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(gdToolStrings._JSON) >= 0 || resource.indexOf(gdToolStrings._T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (resource.toUpperCase().indexOf(gdToolStrings._BLANK_) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(gdToolStrings.UNDERSCORE_0) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded2(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(gdToolStrings._JSON) >= 0 || resource.indexOf(gdToolStrings._T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(gdToolStrings.UNDERSCORE_0) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < SIZE; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(gdToolStrings._TOUCH_) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }

    private boolean hasRead;
    private boolean hasRotationImages;
    public boolean hasRotationImages() {
        
        if(!hasRead) {
            hasRead = true;
            final FileUtil fileUtil = FileUtil.getInstance();
            final String fileAsString = fileUtil.readAsString(gdToolStrings.ROTATION_ANIMATION_FILE_PATH);
            if (fileAsString.indexOf(FOUND) >= 0) {

                hasRotationImages = true;
            } else {
                hasRotationImages = false;
            }

            final StringMaker stringMaker = new StringMaker();
            final CommonStrings commonStrings = CommonStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(stringMaker.append("hasRotationImages: ").append(hasRotationImages).toString(), this, commonStrings.PROCESS));
        }

        return hasRotationImages;
    }
    
}
