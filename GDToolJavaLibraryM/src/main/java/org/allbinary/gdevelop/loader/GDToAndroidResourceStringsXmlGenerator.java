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
public class GDToAndroidResourceStringsXmlGenerator extends GDNameFileGenerator
{
    private String name;
    
    public GDToAndroidResourceStringsXmlGenerator() {
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameAndroidApplicationM\\strings.xml.original",
                GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameAndroidApplicationM\\src\\main\\res\\values\\strings.xml");
    }

    public void process(final GDProject gdProject) {
        this.name = gdProject.name;
    }    

    @Override
    public void process() throws Exception {
                
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(this.originalFilePath);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(GD_KEY, this.name);
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + this.newFilePath, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
    
}
