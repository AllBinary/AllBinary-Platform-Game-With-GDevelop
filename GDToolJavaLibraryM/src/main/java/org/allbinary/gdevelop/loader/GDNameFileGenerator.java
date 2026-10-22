/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.string.StringMaker;
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
        final GDPaths gdPaths = GDPaths.getInstance();
        this.originalFilePath = gdPaths.getTemplatePath(originalFilePath);
        this.newFilePath = gdPaths.getOutputPath(newFilePath);
    }
    
    @Override
    public void process() throws Exception {
                
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();
        final String newFileAsString = GDTemplateUtil.getInstance().process(this.originalFilePath, this.GD_KEY, this.NAME, camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase());

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(this.newFilePath).toString(), this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(this.newFilePath, newFileAsString);
    }
}
