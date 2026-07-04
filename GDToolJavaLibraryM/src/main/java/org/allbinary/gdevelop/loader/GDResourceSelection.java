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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFileSystem;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

/**
 *
 * @author User
 */
public class GDResourceSelection {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    protected static final GDResourceSelection instance = new GDResourceSelection();

    /**
     * @return the instance
     */
    public static GDResourceSelection getInstance() {
        return GDResourceSelection.instance;
    }

    private final CommonSeps commonSeps = CommonSeps.getInstance();

    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String FOUND = "found";
    
    private final int SIZE = 100;

    public boolean appendCommentIfNeeded0(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        
        if (resource.toUpperCase().indexOf(this.gdToolStrings._BLANK_) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(this.gdToolStrings.UNDERSCORE_0) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < this.SIZE; index2++) {
                if (name.endsWith(this.commonSeps.UNDERSCORE + index2) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(this.gdToolStrings._JSON) >= 0 || resource.indexOf(this.gdToolStrings._T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (resource.toUpperCase().indexOf(this.gdToolStrings._BLANK_) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(this.gdToolStrings.UNDERSCORE_0) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < this.SIZE; index2++) {
                if (name.endsWith(this.commonSeps.UNDERSCORE + index2) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
                    used = false;
                    resourceStringMaker.append(this.commonSeps.COMMENT);
                }
            }
        }
        
        return used;
    }
    
    public boolean appendCommentIfNeeded2(final String name, final String resource, final StringMaker resourceStringMaker, final boolean hasRotationImages) {
                
        boolean used = true;
        if (resource.indexOf(this.gdToolStrings._JSON) >= 0 || resource.indexOf(this.gdToolStrings._T) >= 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (name.endsWith(this.gdToolStrings.UNDERSCORE_0) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
            used = false;
            resourceStringMaker.append(this.commonSeps.COMMENT);
        }

        if (!hasRotationImages) {
            for (int index2 = 2; index2 < this.SIZE; index2++) {
                if (name.endsWith(this.commonSeps.UNDERSCORE + index2) && name.indexOf(this.gdToolStrings._TOUCH_) < 0) {
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
        
        if(!this.hasRead) {
            this.hasRead = true;
            final AbFileSystem fileUtil = AbFileSystem.getInstance();
            final String fileAsString = fileUtil.readAsString(this.gdToolStrings.ROTATION_ANIMATION_FILE_PATH);
            if (fileAsString.indexOf(this.FOUND) >= 0) {

                this.hasRotationImages = true;
            } else {
                this.hasRotationImages = false;
            }

            final StringMaker stringMaker = new StringMaker();
            final CommonStrings commonStrings = CommonStrings.getInstance();
            this.logUtil.putF(stringMaker.append("hasRotationImages: ").appendboolean(this.hasRotationImages).toString(), this, commonStrings.PROCESS);
        }

        return this.hasRotationImages;
    }
    
}
