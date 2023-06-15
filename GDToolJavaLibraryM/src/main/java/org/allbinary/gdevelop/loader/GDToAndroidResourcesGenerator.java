/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

/**
 *
 * @author User
 */
public class GDToAndroidResourcesGenerator extends GDNameFileGenerator
{
    public GDToAndroidResourcesGenerator() {
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameAndroidM\\src\\main\\other\\org\\allbinary\\AndroidResources.original",
                GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameAndroidM\\src\\main\\other\\org\\allbinary\\AndroidResources.java");
    }

}
