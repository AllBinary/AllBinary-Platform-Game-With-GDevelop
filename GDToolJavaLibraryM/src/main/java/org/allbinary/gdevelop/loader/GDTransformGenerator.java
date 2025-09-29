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
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;

/**
 *
 * @author User
 */
public class GDTransformGenerator extends GDNameGenerator {
    
    protected final LogUtil logUtil = LogUtil.getInstance();
    
    protected final CommonStrings commonStrings = CommonStrings.getInstance();
    protected final StreamUtil streamUtil = StreamUtil.getInstance();
    protected final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    protected final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final XslHelper xslHelper = XslHelper.getInstance();
    
    public void process(final String updatedXslDocumentStr, final String outputFile, final SharedBytes sharedBytes) throws Exception {

        final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
        sharedBytes.outputStream.reset();
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        String result = this.process(updatedXslDocumentStr, xmlDocumentStr);
        result = this.format(result);

        logUtil.put(this.gdToolStrings.FILENAME + outputFile, this, commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(outputFile, result);
        
    }

    public String process(final String updatedXslDocumentStr, final String xmlDocumentStr) throws Exception {
        return this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                new StreamSource(new StringBufferInputStream(xmlDocumentStr)));        
    }
    
    public String format(String result) throws Exception {
        return result;
    }

}
