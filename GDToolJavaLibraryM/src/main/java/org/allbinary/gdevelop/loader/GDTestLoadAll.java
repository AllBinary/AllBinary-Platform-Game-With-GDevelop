/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.util.Vector;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor;
import org.allbinary.logic.io.file.filter.VisitorFileFilter;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDTestLoadAll
{
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    public GDTestLoadAll()
    {
    }

    public void process() throws Exception
    {

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        //final Vector files = FileListFetcher.getInstance().getFiles(gdToolStrings.ROOT_PATH, "json");
        final String includeExtension = "json";
        final Vector includeExtensionVector = new Vector();
        includeExtensionVector.add(includeExtension);
        final VisitorFileFilter visitorFileFilter = new VisitorFileFilter(
                new DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionVector));
        
        final AbFile[] files = FileWrapperUtil.wrapFiles(new AbFile(gdToolStrings.ROOT_PATH).listFiles(visitorFileFilter));
        //final int size = files.size();
        final int size = files.length;
        String jsonFileName = gdToolStrings.ROOT_PATH + "game.json";
        AbFile abFile;

        for(int index = 0; index < size; index++) {
            //abFile = ((AbFile) files.get(index));
            abFile = ((AbFile) files[index]);
            jsonFileName = abFile.getAbsolutePath();
            if(!abFile.isDirectory() && jsonFileName.indexOf(".git") < 0) {
                LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + jsonFileName, this, CommonStrings.getInstance().CONSTRUCTOR));

                final FileInputStream inputStream = new FileInputStream(jsonFileName);
                outputStream.reset();
                final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, outputStream, byteArray));

                final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
                final JSONObject gameAsConfigurationJSONObject = (JSONObject) jsonTokener.nextValue();

                final String xml = "<game>" + XML.toString(gameAsConfigurationJSONObject) + "<variables><value>movement_angle</value><value>angle</value></variables></game>\n";
                final String formattedXml = XmlDocumentHelper.getInstance().format(xml);
                final Replace replace = new Replace("\"", "&quot;");
                final Replace replace2 = new Replace("'", "&apos;");
                String fixQuotes = replace.all(formattedXml);
                fixQuotes = replace2.all(fixQuotes);
                
                if(gameAsConfigurationJSONObject.has(GDProjectStrings.getInstance().TYPE) && gameAsConfigurationJSONObject.getString(GDProjectStrings.getInstance().TYPE).compareTo("map") == 0) {
                    LogUtil.put(LogFactory.getInstance("Was a map and not a game", this, CommonStrings.getInstance().CONSTRUCTOR, new Exception()));
                    break;
                }

                //final String fileName = gdToolStrings.GAME_XML_PATH;
                //LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, CommonStrings.getInstance().CONSTRUCTOR));
                //this.bufferedWriterUtil.overwrite(fileName, fixQuotes);
                //this.bufferedWriterUtil.overwrite(fileName, xml);
                final GDProject gdProject = new GDProject();
                gdProject.load(gameAsConfigurationJSONObject);
            }
        }
    }

    public static void main(String[] args) throws Exception
    {
        new GDTestLoadAll().process();
    }

}
