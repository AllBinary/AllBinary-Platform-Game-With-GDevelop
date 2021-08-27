/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.gdevelop.json;

/**
 *
 * @author User
 */
public class GDTypeFactory
{
    private static final GDTypeFactory instance = new GDTypeFactory();

    /**
     * @return the instance
     */
    public static GDTypeFactory getInstance()
    {
        return instance;
    }

    public final String STRING = "String";
    public final String NUMBER = "Number";
    public final String BOOLEAN = "Boolean";
    
    public final String STRUCTURE = "Structure";
    public final String ARRAY = "Array";

    public String get(final String type) {
        
        if(STRING.compareTo(type) == 0) {
            return STRING;
        } else if(NUMBER.compareTo(type) == 0) {
            return NUMBER;
        } else if(BOOLEAN.compareTo(type) == 0) {
            return BOOLEAN;
        } else if(STRUCTURE.compareTo(type) == 0) {
            return STRUCTURE;
        } else if(ARRAY.compareTo(type) == 0) {
            return ARRAY;
        }
        
        return null;
    }

    public boolean isPrimitive(final String type)
    {
        if (this.STRING == type)
        {
            return true;
        } else if (this.NUMBER == type)
        {
            return true;
        } else if (this.BOOLEAN == type)
        {
            return true;
        }
        return false;
    }
}
