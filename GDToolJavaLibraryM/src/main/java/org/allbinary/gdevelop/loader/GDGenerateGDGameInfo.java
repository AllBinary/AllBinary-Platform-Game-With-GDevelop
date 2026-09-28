/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDGenerateGDGameInfo
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    
    public GDGenerateGDGameInfo()
    {
    }

    public GDGameInfo process()
    {
        try
        {
            final GDGameInfo gdGameInfo = new GDGameInfo();
            
            final StreamUtil streamUtil = StreamUtil.getInstance();
            final SharedBytes sharedBytes = SharedBytes.getInstance();
            sharedBytes.outputStream.reset();

            final StringMaker stringMaker = new StringMaker();
            
            final FileInputStream gameInputStream = new FileInputStream(this.gdPaths.GAME_XML_PATH);
            final String gameXmlAsString = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

            final String xslPath = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameInfo.xsl";
            this.logUtil.putF(xslPath, this, this.commonStrings.PROCESS);
            final FileInputStream fileInputStream = new FileInputStream(xslPath);
            sharedBytes.outputStream.reset();
            final String xslAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

            final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(xslAsString)),
                    new StreamSource(new StringBufferInputStream(gameXmlAsString)));

            final BasicArrayList resultPartList = new Tokenizer(this.commonSeps.SPACE).getTokensFromString(result, new BasicArrayListD());

            gdGameInfo.layoutTotal = Integer.parseInt((String) resultPartList.get(0));

            final BasicArrayList externalLayoutsTotalAsStringList = new Tokenizer(this.commonSeps.COMMA).getTokensFromString((String) resultPartList.get(1), new BasicArrayListD());
            for (int index = 0; index < externalLayoutsTotalAsStringList.size(); index++) {
                gdGameInfo.externalLayoutsTotalPerLayoutPositionList.add(Integer.parseInt((String) externalLayoutsTotalAsStringList.get(index)));
            }

            final BasicArrayList externalLayoutsIndexGroupAsStringList = new Tokenizer(this.commonSeps.SEMICOLON).getTokensFromString((String) resultPartList.get(2), new BasicArrayListD());
            BasicArrayList externalLayoutsIndexAsStringList;
            BasicArrayList externalLayoutIndexList;
            for (int index = 0; index < externalLayoutsIndexGroupAsStringList.size(); index++) {
                externalLayoutIndexList = new BasicArrayListD();
                externalLayoutsIndexAsStringList = new Tokenizer(this.commonSeps.COMMA).getTokensFromString((String) externalLayoutsIndexGroupAsStringList.get(index), new BasicArrayListD());
                for (int indexListIndex = 0; indexListIndex < externalLayoutsIndexAsStringList.size(); indexListIndex++) {
                    externalLayoutIndexList.add(Integer.parseInt((String) externalLayoutsIndexAsStringList.get(indexListIndex)));
                }
                gdGameInfo.externalLayoutsIndexPerLayoutPositionList.add(externalLayoutIndexList);
            }

            final BasicArrayList instanceTotalPerLayoutAsStringList = new Tokenizer(this.commonSeps.COMMA).getTokensFromString((String) resultPartList.get(3), new BasicArrayListD());
            for (int index = 0; index < instanceTotalPerLayoutAsStringList.size(); index++) {
                gdGameInfo.instanceTotalPerLayoutPositionList.add(Integer.parseInt((String) instanceTotalPerLayoutAsStringList.get(index)));
            }

            final BasicArrayList instanceTotalPerExternalLayoutAsStringList = new Tokenizer(this.commonSeps.COMMA).getTokensFromString((String) resultPartList.get(4), new BasicArrayListD());
            for (int index = 0; index < instanceTotalPerExternalLayoutAsStringList.size(); index++) {
                gdGameInfo.instanceTotalPerExternalLayoutPositionList.add(Integer.parseInt((String) instanceTotalPerExternalLayoutAsStringList.get(index)));
            }

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append("result: ").append(result).toString(), this, this.commonStrings.PROCESS);

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append("gdGameInfo: ").append(gdGameInfo.toString()).toString(), this, this.commonStrings.PROCESS);
            
            return gdGameInfo;

        } catch (Exception e)
        {
            this.logUtil.put("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, this.commonStrings.PROCESS, e);
        }

        throw new RuntimeException();
    }

    public static void main(String[] args) throws Exception
    {
        DomDocumentHelper.init();
        GDPaths.init();
        new GDGenerateGDGameInfo().process();
    }

}
