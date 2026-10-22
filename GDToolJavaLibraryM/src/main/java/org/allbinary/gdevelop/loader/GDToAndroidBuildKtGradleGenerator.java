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
public class GDToAndroidBuildKtGradleGenerator extends GDNameFileGenerator
{
    public GDToAndroidBuildKtGradleGenerator() {
        super(GDPaths.getInstance().ROOT_PATH + "platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\build.gradle.xsl",
                GDPaths.getInstance().GEN_PATH + "platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\build.gradle.kts");
    }

}
