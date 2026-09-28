package org.allbinary.gdevelop.loader;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.StringWriter;
import java.io.File;

//Manual standalone test, run from the GDGamesP workspace root, to inspect GDGameInfo.xsl output
public class TestXslTransform {
    public static void main(String[] args) throws Exception {
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(
            new StreamSource(new File("GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGameInfo.xsl")));
        StringWriter writer = new StringWriter();
        transformer.transform(new StreamSource(new File("game.xml")), new StreamResult(writer));
        String result = writer.toString();
        System.out.println("RESULT=[" + result + "]");
        System.out.println("LENGTH=" + result.length());
    }
}
