/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.regex.replace.Replace;

/**
 *
 * @author User
 */
public class GDToAllBinaryCanvasGenerator
{

    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();

    private final String GD_LAYOUT = "<GDLayout>";
    private final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";

    private final StringBuilder stringBuilder = new StringBuilder();

    private int index;
    private String name;
    private String className;
    private String orig;

    public void loadLayout(final GDLayout layout, final int index)
    {
        this.index = index;
        name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
        stringBuilder.delete(0, stringBuilder.length());
        if (index == 1)
        {
            className = stringBuilder.append("GDGame").append(name).append("Canvas").toString();
            this.orig = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\GDGameGDLayoutCanvas.xsl";
        } else
        {
            className = stringBuilder.append("GDGameStart").append(name).append("Canvas").toString();
            this.orig = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\GDGameStartGDLayoutCanvas.xsl";
        }
    }

    public void process() throws Exception
    {

        stringBuilder.delete(0, stringBuilder.length());
        final String CANVAS = stringBuilder.append("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\").append(this.className).append(".java").toString();

        final StreamUtil streamUtil = StreamUtil.getInstance();

        final FileInputStream fileInputStream = new FileInputStream(this.orig);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_LAYOUT, this.className);
        final Replace replace2 = new Replace(GD_CURRENT_LAYOUT_INDEX, Integer.toString(this.index));

        String updatedXslDocumentStr = replace.all(androidRFileAsString);
        updatedXslDocumentStr = replace2.all(updatedXslDocumentStr);

        final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
        String xmlDocumentStr = streamUtil.getAsString(gameInputStream);

        final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

        final AbFile abFile = new AbFile(CANVAS);
        if (abFile.exists())
        {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, result);
    }

}
