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
public class GDToThreedAndroidManifestGenerator extends GDSimpleTransformGenerator
{       
    public GDToThreedAndroidManifestGenerator() {
        
        super(GDPaths.getInstance().ROOT_PATH + "platformx\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.xsl",
                GDPaths.getInstance().ROOT_PATH + "platformx\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.xml");

    }

}
