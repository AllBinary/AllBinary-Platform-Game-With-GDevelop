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
package org.allbinary.gdevelop.loader;

/**
 * A target language for generation.
 * 
 * shortName is appended to xsl file names (fileKt.xsl) and inserted into module directory names
 * (GDGameGeneratedJavaLibraryKtM). Java has an empty shortName.
 *
 * @author User
 */
public class GDLanguage {

    public final String name;
    public final String shortName;
    public final String extension;
    public final String[] aliasArray;
    /**
     * All source extensions the language generates such as .cpp and .h for C++. The first is always extension.
     */
    public final String[] extensionArray;

    public GDLanguage(final String name, final String shortName, final String extension, final String[] aliasArray) {
        this(name, shortName, extension, aliasArray, new String[] {});
    }

    public GDLanguage(final String name, final String shortName, final String extension, final String[] aliasArray, final String[] additionalExtensionArray) {
        this.name = name;
        this.shortName = shortName;
        this.extension = extension;
        this.aliasArray = aliasArray;

        final int size = additionalExtensionArray.length;
        this.extensionArray = new String[size + 1];
        this.extensionArray[0] = extension;
        for (int index = 0; index < size; index++) {
            this.extensionArray[index + 1] = additionalExtensionArray[index];
        }
    }

    public boolean isJava() {
        return this.shortName.length() == 0;
    }

    public boolean matches(final String value) {
        if (value.equalsIgnoreCase(this.name)) {
            return true;
        }
        if (this.shortName.length() > 0 && value.equalsIgnoreCase(this.shortName)) {
            return true;
        }
        if (value.equalsIgnoreCase(this.extension) || value.equalsIgnoreCase(this.extension.substring(1))) {
            return true;
        }
        final int size = this.aliasArray.length;
        for (int index = 0; index < size; index++) {
            if (value.equalsIgnoreCase(this.aliasArray[index])) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        return this.name;
    }
}
