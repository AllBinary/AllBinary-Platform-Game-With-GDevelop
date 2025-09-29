/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;

/**
 *
 * @author User
 */
public class GDSimpleTransformGenerator extends GDTransformGenerator {
 
    private final String xslFile;
    private final String outputFile;
    
    public GDSimpleTransformGenerator(final String xslFile, final String outputFile) {

        this.xslFile = xslFile;
        this.outputFile = outputFile;

    }

    @Override
    public void process() throws Exception
    {

        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream fileInputStream = new FileInputStream(this.xslFile);
        final String xslFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        this.process(xslFileAsString, this.outputFile, sharedBytes);
        
    }
    
    public String format(String result) throws Exception {
        try {
            return XmlDocumentHelper.getInstance().format(result);
        } catch(Exception e) {
            logUtil.put("Unable to format XML", this, commonStrings.PROCESS, e);
            throw e;
            //return result;
        }
        
    }
    
}
