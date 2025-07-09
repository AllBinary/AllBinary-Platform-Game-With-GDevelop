/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToThreedAndroidResourceStringsXmlGradleGenerator extends GDNameFileGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private String name;
    
    private static final String OUTPUT_PATH = GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\src\\main\\res\\values\\";

    public GDToThreedAndroidResourceStringsXmlGradleGenerator() {
        super(GDToolStrings.getInstance().ROOT_PATH + "platform\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\strings.xml.original",
                OUTPUT_PATH + "strings.xml");
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

        logUtil.put(this.gdToolStrings.FILENAME + this.newFilePath, this, commonStrings.PROCESS);

        final File directoryFile = new File(OUTPUT_PATH);
        directoryFile.mkdirs();
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
    
}
