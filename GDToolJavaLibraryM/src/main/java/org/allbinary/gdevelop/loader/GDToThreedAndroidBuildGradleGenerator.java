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
public class GDToThreedAndroidBuildGradleGenerator extends GDNameFileGenerator
{
    public GDToThreedAndroidBuildGradleGenerator() {
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\build.gradle.original",
                GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\build.gradle");
    }

}
