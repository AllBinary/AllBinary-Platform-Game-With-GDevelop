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
public class GDToThreedAndroidManifestGradleGenerator extends GDSimpleTransformGenerator
{       
    public GDToThreedAndroidManifestGradleGenerator() {
        
        super(GDData.getInstance().GD_THREED_ANDROID_GRADLE_MANIFEST,
                GDPaths.getInstance().GEN_PATH + "platformx\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\src\\main\\AndroidManifest.xml");

    }

}
