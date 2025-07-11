/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final StringMaker stringMaker = new StringMaker();
        
    private final XslHelper xslHelper = XslHelper.getInstance();

    private final String xslPath;
    private final String start;
    private final String end;
    
    public GDLayoutsToAllBinaryGenerator(final String xslPath, final String start, final String end)
    {
        this.xslPath = xslPath;
        this.start = start;
        this.end = end;
    }

    private BasicArrayList nameList = new BasicArrayList();
    
    
    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, stringMaker);
        stringMaker.delete(0, stringMaker.length());
                
        this.nameList.add(name);
    }
    
    public void process() throws Exception
    {
        try
        {
            timeDelayHelper.setStartTime();
            
            final String RESULT = "result: ";

            final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
            final StringMaker stringMaker = new StringMaker();
            final StringUtil stringUtil = StringUtil.getInstance();
            
            final StreamUtil streamUtil = StreamUtil.getInstance();
            final SharedBytes sharedBytes = SharedBytes.getInstance();
            sharedBytes.outputStream.reset();

            final String xslPath = gdToolStrings.ROOT_PATH + this.xslPath;
            logUtil.put(xslPath, this, commonStrings.PROCESS);
            
            final InputStream inputStream = new FileInputStream(xslPath);
            final String xslDocumentStr = new String(streamUtil.getByteArray(inputStream, sharedBytes.outputStream, sharedBytes.byteArray));
            
            final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
            
            sharedBytes.outputStream.reset();
            final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

            //final Replace replace2 = new Replace(".Width()", ".Width(graphics)");
            //xmlDocumentStr = replace2.all(xmlDocumentStr);
            //final Replace replace3 = new Replace(".Height()", ".Height(graphics)");
            //xmlDocumentStr = replace3.all(xmlDocumentStr);

            final String START = gdToolStrings.ROOT_PATH + start;
            final String END = end;
            
            final int size = this.nameList.size();
            for (int index = 0; index < size; index++)
            {
                final Replace replace2 = new Replace(this.gdToolStrings.GD_LAYOUT, (String) this.nameList.get(index));
                final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, Integer.toString(index));
                final String updatedXslDocumentStr2 = replace.all(xslDocumentStr);
                final String updatedXslDocumentStr = replace2.all(updatedXslDocumentStr2);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START).append(stringUtil.toString(this.nameList.get(index))).append(END).toString();

                logUtil.put(this.gdToolStrings.FILENAME + fileName, this, commonStrings.PROCESS);

                this.bufferedWriterUtil.overwrite(fileName, result);

                logUtil.put(RESULT + result, this, commonStrings.PROCESS);
            }

        } catch (Exception e)
        {
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
            throw e;
        }

        stringMaker.delete(0, stringMaker.length());
        logUtil.put(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
    }

//    public static void main(String[] args) throws Exception
//    {
//        new GDLayoutsToAllBinaryRunnableGenerator().process(3);
//    }

}

