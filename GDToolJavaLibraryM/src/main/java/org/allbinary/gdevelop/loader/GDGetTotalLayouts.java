/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDGetTotalLayouts
{
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    public GDGetTotalLayouts()
    {
    }

    public int process()
    {
        try
        {
            final StreamUtil streamUtil = StreamUtil.getInstance();
            final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
            final byte[] byteArray = new byte[16384];

            final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
            final String gameXmlAsString = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));

            final String xslPath = gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutCount.xsl";
            LogUtil.put(LogFactory.getInstance(xslPath, this, CommonStrings.getInstance().PROCESS));
            final FileInputStream fileInputStream = new FileInputStream(xslPath);
            outputStream.reset();
            final String xslAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));

            final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(xslAsString)),
                    new StreamSource(new StringBufferInputStream(gameXmlAsString)));

            
            LogUtil.put(LogFactory.getInstance("result: " + result, this, CommonStrings.getInstance().PROCESS));
            return Integer.parseInt(result);

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, CommonStrings.getInstance().PROCESS, e));
        }

        throw new RuntimeException();
    }

    public static void main(String[] args) throws Exception
    {
        //System.setProperty("jdk.xml.xpathExprGrpLimit", "0");
        //System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        //System.setProperty("jdk.xml.xpathTotalOpLimit", "0");
        new GDGetTotalLayouts().process();
    }

}
