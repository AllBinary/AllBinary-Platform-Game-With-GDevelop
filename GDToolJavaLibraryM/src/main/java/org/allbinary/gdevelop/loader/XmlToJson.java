package org.allbinary.gdevelop.loader;

import org.json.JSONObject;
import org.json.XML;

import java.nio.file.Files;
import java.nio.file.Paths;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;

public class XmlToJson {
    
    private static final XmlToJson instance = new XmlToJson();

    /**
     * @return the instance
     */
    public static XmlToJson getInstance() {
        return instance;
    }
    
    private final Directory directory = Directory.getInstance();
    protected final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    public void processAll(final String path, final String extension) throws Exception {
        final BasicArrayList list = this.directory.search(extension, AbFile.createAbFile(path), true);
        
        final int size = list.size();
        System.out.println(new StringMaker().append("total ").append(extension).append(": ").appendint(size).toString());
        AbFile abFile;
        for(int index = 0; index < size; index++) {
            abFile = (AbFile) list.get(index);
            this.process(abFile.getAbsolutePath(), extension);
        }
    }
    
    public void process(final String xmlFilePath, final String extension) {
        try {
            final String svgContent = new String(Files.readAllBytes(Paths.get(xmlFilePath)));
            final JSONObject jsonObject = XML.toJSONObject(svgContent);
            final String jsonString = jsonObject.toString(4); 
            
            final String jsonFilePath = xmlFilePath.replace(extension, gdToolStrings._JSON);

            this.bufferedWriterUtil.overwrite(jsonFilePath, jsonString);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception {
        String svgPath = "G:\\mnt\\bc\\mydev\\abgdgames2\\action\\SnakeGame\\assets\\";
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        XmlToJson.getInstance().processAll(svgPath, gdToolStrings._SVG);
    }
}
