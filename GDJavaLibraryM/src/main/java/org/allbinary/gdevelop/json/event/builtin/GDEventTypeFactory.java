/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

/**
 *
 * @author User
 */
public class GDEventTypeFactory
{
    private static final GDEventTypeFactory instance = new GDEventTypeFactory();

    /**
     * @return the instance
     */
    public static GDEventTypeFactory getInstance()
    {
        return instance;
    }
    
    public final String COMMENT = "BuiltinCommonInstructions::Comment";
    public final String FOR_EACH = "BuiltinCommonInstructions::ForEach";
    public final String FOR_EACH_CHILD = "BuiltinCommonInstructions::ForEachChild";
    public final String GROUP = "BuiltinCommonInstructions::Group";
    public final String LINK = "BuiltinCommonInstructions::Link";
    public final String REPEAT = "BuiltinCommonInstructions::Repeat";
    public final String STANDARD = "BuiltinCommonInstructions::Standard";
    public final String WHILE = "BuiltinCommonInstructions::While";
    
    public String get(final String type) {
        
        if(type.compareTo(this.COMMENT) == 0) {
            return this.COMMENT;
        } else if(type.compareTo(this.FOR_EACH) == 0) {
            return this.FOR_EACH;
        } else if(type.compareTo(this.FOR_EACH_CHILD) == 0) {
            return this.FOR_EACH_CHILD;
        } else if(type.compareTo(this.GROUP) == 0) {
            return this.GROUP;
        } else if(type.compareTo(this.LINK) == 0) {
            return this.LINK;
        } else if(type.compareTo(this.REPEAT) == 0) {
            return this.REPEAT;
        } else if(type.compareTo(this.STANDARD) == 0) {
            return this.STANDARD;
        } else if(type.compareTo(this.WHILE) == 0) {
            return this.WHILE;
        }
        return null;
    }
    
}
