/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.data.CamelCaseUtil;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDNameFileGenerator extends GDNameGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    protected final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    protected final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    protected final String originalFilePath;
    protected final String newFilePath;

    public GDNameFileGenerator(final String originalFilePath, final String newFilePath) {
        this.originalFilePath = originalFilePath;
        this.newFilePath = newFilePath;
    }
    
    @Override
    public void process() throws Exception {
                
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(this.originalFilePath);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(GD_KEY, camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase());
        final String newFileAsString = replace.all(androidRFileAsString);

        stringMaker.delete(0, stringMaker.length());
        logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(this.newFilePath).toString(), this, commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
}
