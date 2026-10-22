/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary.gdevelop.loader.comparison;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

/**
 * Converts a text file generation template (.original or .origin) to an xsl template used by GDTemplateUtil.
 * The text is kept in xsl:text (&#13; keeps the windows line endings) and each template key becomes an xsl parameter,
 * so filling the xsl template gives the same output as replacing the keys in the text template.
 *
 * Usage: GDTemplateToXslConverter templatePath...
 * Writes templatePath with the .original or .origin extension replaced by .xsl.
 */
public class GDTemplateToXslConverter {

    //Template keys and the xsl parameter names used for them by the generators
    private static final String[] KEY_ARRAY = {"<name>", "//GD", "<GDNAME>", "<GD_FILE_NAME>", "<GD_DURATION>"};
    private static final String[] PARAMETER_NAME_ARRAY = {"name", "GD", "GDNAME", "GD_FILE_NAME", "GD_DURATION"};

    private static final String NEW_LINE = "\r\n";

    public static void main(final String[] args) throws Exception {
        if (args.length < 1) {
            System.out.println("Usage: GDTemplateToXslConverter templatePath...");
            System.exit(1);
        }
        final GDTemplateToXslConverter converter = new GDTemplateToXslConverter();
        for (int index = 0; index < args.length; index++) {
            converter.process(new File(args[index]));
        }
    }

    public void process(final File templateFile) throws Exception {
        final String name = templateFile.getName();
        final int extensionIndex = name.lastIndexOf('.');
        final String extension = name.substring(extensionIndex);
        if (!extension.equals(".original") && !extension.equals(".origin")) {
            throw new IllegalArgumentException("Not a .original or .origin template: " + templateFile);
        }

        final String text = new String(Files.readAllBytes(templateFile.toPath()), StandardCharsets.ISO_8859_1);
        final boolean[] usedArray = new boolean[KEY_ARRAY.length];
        final StringBuilder body = new StringBuilder();

        int index = 0;
        while (index < text.length()) {
            int foundIndex = -1;
            int foundKey = -1;
            for (int keyIndex = 0; keyIndex < KEY_ARRAY.length; keyIndex++) {
                final int nextIndex = text.indexOf(KEY_ARRAY[keyIndex], index);
                if (nextIndex >= 0 && (foundIndex < 0 || nextIndex < foundIndex)) {
                    foundIndex = nextIndex;
                    foundKey = keyIndex;
                }
            }
            if (foundIndex < 0) {
                this.appendText(body, text.substring(index));
                break;
            }
            this.appendText(body, text.substring(index, foundIndex));
            body.append("</xsl:text><xsl:value-of select=\"$").append(PARAMETER_NAME_ARRAY[foundKey]).append("\" /><xsl:text>");
            usedArray[foundKey] = true;
            index = foundIndex + KEY_ARRAY[foundKey].length();
        }

        final StringBuilder xsl = new StringBuilder();
        xsl.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("<!--").append(NEW_LINE);
        xsl.append("AllBinary Open License Version 1").append(NEW_LINE);
        xsl.append("Copyright (c) 2026 AllBinary").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("By agreeing to this license you and any business entity you represent are").append(NEW_LINE);
        xsl.append("legally bound to the AllBinary Open License Version 1 legal agreement.").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("You may obtain the AllBinary Open License Version 1 legal agreement from").append(NEW_LINE);
        xsl.append("AllBinary or the root directory of AllBinary's AllBinary Platform repository.").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("Created By: Travis Berthelot").append(NEW_LINE);
        xsl.append("-->").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("<!-- File generation template (was ").append(name).append("). The text is output as is: &#13; keeps the windows line endings.").append(NEW_LINE);
        xsl.append("     The generator fills the parameters. -->").append(NEW_LINE);
        xsl.append("<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("    <xsl:output method=\"text\" encoding=\"UTF-8\" />").append(NEW_LINE);
        xsl.append(NEW_LINE);
        for (int keyIndex = 0; keyIndex < KEY_ARRAY.length; keyIndex++) {
            if (usedArray[keyIndex]) {
                xsl.append("    <xsl:param name=\"").append(PARAMETER_NAME_ARRAY[keyIndex]).append("\" />").append(NEW_LINE);
            }
        }
        xsl.append(NEW_LINE);
        xsl.append("    <xsl:template match=\"/\"><xsl:text>").append(body).append("</xsl:text></xsl:template>").append(NEW_LINE);
        xsl.append(NEW_LINE);
        xsl.append("</xsl:stylesheet>").append(NEW_LINE);

        final File xslFile = new File(templateFile.getParentFile(), name.substring(0, extensionIndex) + ".xsl");
        final FileOutputStream fileOutputStream = new FileOutputStream(xslFile);
        try {
            fileOutputStream.write(xsl.toString().getBytes(StandardCharsets.UTF_8));
        } finally {
            fileOutputStream.close();
        }
        System.out.println("Converted: " + templateFile + " -> " + xslFile);
    }

    private void appendText(final StringBuilder body, final String text) {
        for (int index = 0; index < text.length(); index++) {
            final char c = text.charAt(index);
            switch (c) {
                case '&':
                    body.append("&amp;");
                    break;
                case '<':
                    body.append("&lt;");
                    break;
                case '>':
                    body.append("&gt;");
                    break;
                case '\r':
                    body.append("&#13;");
                    break;
                case '\n':
                    body.append(NEW_LINE);
                    break;
                default:
                    if (c > 127) {
                        body.append("&#").append((int) c).append(';');
                    } else {
                        body.append(c);
                    }
            }
        }
    }

}
