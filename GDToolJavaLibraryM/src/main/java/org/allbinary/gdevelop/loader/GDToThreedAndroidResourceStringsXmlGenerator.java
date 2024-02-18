/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToThreedAndroidResourceStringsXmlGenerator extends GDNameFileGenerator
{
    private String name;
    
    public GDToThreedAndroidResourceStringsXmlGenerator() {
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationM\\strings.xml.original",
                GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationM\\src\\main\\res\\values\\strings.xml");
    }

    public void process(final GDProject gdProject) {
        this.name = gdProject.name;
    }    

    @Override
    public void process() throws Exception {
                
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(this.originalFilePath);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        final Replace replace = new Replace(GD_KEY, this.name);
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + this.newFilePath, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
    
}
