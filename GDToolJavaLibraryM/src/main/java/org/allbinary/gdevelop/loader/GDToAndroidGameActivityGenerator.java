/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.File;
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
public class GDToAndroidGameActivityGenerator extends GDNameGenerator
{
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    public GDToAndroidGameActivityGenerator() {
    }
    
    @Override
    public void process() throws Exception {
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();
        final String name = camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase();
        
        final String R_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameAndroidActivity.original";
        stringMaker.delete(0, stringMaker.length());
        stringMaker.append(gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\").append(name);
        final File directoryFile = new File(stringMaker.toString());
        directoryFile.mkdirs();
        final String R = stringMaker.append("\\GDGameAndroidActivity.java").toString();
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(GD_KEY, name);
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + R, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
