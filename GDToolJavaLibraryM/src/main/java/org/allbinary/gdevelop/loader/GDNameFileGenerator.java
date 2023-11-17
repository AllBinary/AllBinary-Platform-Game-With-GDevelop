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
import org.allbinary.logic.string.CommonStrings;
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
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(this.originalFilePath);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        final Replace replace = new Replace(GD_KEY, camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase());
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + this.newFilePath, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
}
