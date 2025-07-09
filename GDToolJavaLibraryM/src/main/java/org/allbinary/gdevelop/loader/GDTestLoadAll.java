/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor;
import org.allbinary.logic.io.file.filter.VisitorFileFilter;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;

import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDTestLoadAll
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    public GDTestLoadAll()
    {
    }

    public void process() throws Exception
    {
        final CommonStrings commonStrings = CommonStrings.getInstance();
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final StringMaker stringMaker = new StringMaker();
        
        //final BasicArrayList files = FileListFetcher.getInstance().getFiles(gdToolStrings.ROOT_PATH, "json");
        final String includeExtension = "json";
        final BasicArrayList includeExtensionBasicArrayList = new BasicArrayList();
        includeExtensionBasicArrayList.add(includeExtension);
        final VisitorFileFilter visitorFileFilter = new VisitorFileFilter(
                new DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionBasicArrayList));
        
        final AbFile[] files = FileWrapperUtil.wrapFiles(new AbFile(gdToolStrings.ROOT_PATH).listFiles(visitorFileFilter));
        //final int size = files.size();
        final int size = files.length;
        String jsonFileName = gdToolStrings.GAME_JSON_PATH;
        AbFile abFile;

        final String GIT = ".git";

        for(int index = 0; index < size; index++) {
            //abFile = ((AbFile) files.get(index));
            abFile = ((AbFile) files[index]);
            jsonFileName = abFile.getAbsolutePath();
            if(!abFile.isDirectory() && jsonFileName.indexOf(GIT) < 0) {
                logUtil.put(this.gdToolStrings.FILENAME + jsonFileName, this, commonStrings.PROCESS);

                final FileInputStream inputStream = new FileInputStream(jsonFileName);
                sharedBytes.outputStream.reset();
                final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, sharedBytes.outputStream, sharedBytes.byteArray));

                final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
                final JSONObject gameAsConfigurationJSONObject = (JSONObject) jsonTokener.nextValue();

                stringMaker.delete(0, stringMaker.length());
                final String xml = stringMaker.append("<game>").append(XML.toString(gameAsConfigurationJSONObject)).append("<variables><value>movement_angle</value><value>angle</value></variables></game>\n").toString();
                final String formattedXml = XmlDocumentHelper.getInstance().format(xml);
                final Replace replace = new Replace("\"", "&quot;");
                final Replace replace2 = new Replace("'", "&apos;");
                String fixQuotes = replace.all(formattedXml);
                fixQuotes = replace2.all(fixQuotes);
                
                if(gameAsConfigurationJSONObject.has(GDProjectStrings.getInstance().TYPE) && gameAsConfigurationJSONObject.getString(GDProjectStrings.getInstance().TYPE).compareTo("map") == 0) {
                    logUtil.put("Was a map and not a game", this, commonStrings.PROCESS, new Exception());
                    break;
                }

                //final String fileName = gdToolStrings.GAME_XML_PATH;
                //logUtil.put(this.gdToolStrings.FILENAME + fileName, this, commonStrings.PROCESS);
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
