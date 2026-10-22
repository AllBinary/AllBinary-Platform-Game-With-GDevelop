/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;


import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToAndroidResourceStringsXmlGenerator extends GDNameFileGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private String name;
    
    public GDToAndroidResourceStringsXmlGenerator() {
        super(GDPaths.getInstance().ROOT_PATH + "platformx\\android\\GDGameAndroidApplicationM\\strings.xml.xsl",
                GDPaths.getInstance().GEN_PATH + "platformx\\android\\GDGameAndroidApplicationM\\src\\main\\res\\values\\" + "strings.xml");
    }

    @Override
    public void process(final GDProject gdProject) {
        this.name = gdProject.name;
    }    

    @Override
    public void process() throws Exception {
                
        final String newFileAsString = GDTemplateUtil.getInstance().process(this.originalFilePath, this.GD_KEY, this.NAME, this.name);
        
        this.logUtil.putF(this.gdToolStrings.FILENAME + this.newFilePath, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
    
}
