/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.gdevelop.json.GDProject;

/**
 *
 * @author User
 */
public class GDToAndroidResourceStringsXmlGradleGenerator extends GDNameFileGenerator
{
    public GDToAndroidResourceStringsXmlGradleGenerator() {
        super("G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidApplicationNoLicensingGradle\\strings.xml.original",
                "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidApplicationNoLicensingGradle\\app\\src\\main\\res\\values\\strings.xml");
    }

    public void process(final GDProject gdProject) {
        this.packageName = gdProject.name;
    }    

}
