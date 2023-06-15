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
public class GDToThreedAndroidManifestGenerator extends GDNameFileGenerator
{       
    public GDToThreedAndroidManifestGenerator() {
        
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.original",
                GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.xml");

    }

}
