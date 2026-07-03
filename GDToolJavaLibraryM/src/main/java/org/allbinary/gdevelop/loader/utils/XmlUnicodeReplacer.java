package org.allbinary.gdevelop.loader.utils;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Detects and replaces U+0015 in XML files.
 *
 * Usage:
 * java XmlUnicodeReplacer <inputXmlPath> [outputXmlPath] [charsetName]
 *
 * If outputXmlPath is omitted, replacement is done in place.
 * If charsetName is omitted, UTF-8 is used.
 */
public class XmlUnicodeReplacer {

    private static final int ASCII_MAX = 0x7F;
    private static final String REPLACEMENT = "foundUNICODEchar";
    private static final String EMPTY = "";
    private static final String INPUT_FILE_NOT_FOUND_PREFIX = "Input file not found: ";
    private static final String OUTPUT_WRITTEN_PREFIX = "Output written to: ";
    private static final String TARGET_UNICODE_RANGE = "Target Unicode range: non-ASCII characters (U+0080 and above)";
    private static final String FOUND_NON_ASCII_PREFIX = "Found non-ASCII occurrences: ";
    private static final String FIRST_PREFIX = "First ";
    private static final String FIRST_SUFFIX = " occurrence(s):";
    private static final String POSITION_PREFIX = "  ";
    private static final String REPLACED_PREFIX = "Replaced all non-ASCII characters with: ";
    private static final String NO_NON_ASCII = "No non-ASCII characters were found. File content unchanged.";
    private static final String UNICODE_FORMAT = "U+%04X";
    private static final String POSITION_LINE_PREFIX = "line ";
    private static final String POSITION_COLUMN_PREFIX = ", column ";
    private static final String POSITION_INDEX_PREFIX = ", index ";
    private static final String POSITION_UNICODE_PREFIX = ", ";
    private static final String USAGE = "Usage: java XmlUnicodeReplacer <inputXmlPath> [outputXmlPath] [charsetName]";
    private static final String EXAMPLES = "Examples:";
    private static final String EXAMPLE_1 = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml";
    private static final String EXAMPLE_2 = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml g:/mnt/bc/mydev/GDGamesP/game.cleaned.xml";
    private static final String EXAMPLE_3 = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml g:/mnt/bc/mydev/GDGamesP/game.cleaned.xml UTF-8";

    private XmlUnicodeReplacer() {
    }

    public static void main(String[] args) throws IOException {
        if (args.length < 1 || args.length > 3) {
            XmlUnicodeReplacer.printUsageAndExit();
            return;
        }

        final Path inputPath = Paths.get(args[0]);
        final Path outputPath = (args.length >= 2) ? Paths.get(args[1]) : inputPath;
        final Charset charset = (args.length == 3) ? Charset.forName(args[2]) : StandardCharsets.UTF_8;

        if (!Files.exists(inputPath)) {
            final StringBuilder messageBuilder = new StringBuilder();
            messageBuilder.append(XmlUnicodeReplacer.INPUT_FILE_NOT_FOUND_PREFIX);
            messageBuilder.append(inputPath);
            System.err.println(messageBuilder.toString());
            System.exit(2);
            return;
        }

        final String content = Files.readString(inputPath, charset);
        final String replaced = XmlUnicodeReplacer.sanitize(content);
        
        Files.writeString(outputPath, replaced, charset);

        final StringBuilder messageBuilder = new StringBuilder();
        messageBuilder.append(XmlUnicodeReplacer.OUTPUT_WRITTEN_PREFIX);
        messageBuilder.append(outputPath.toAbsolutePath());
        System.out.println(messageBuilder.toString());
        
    }

    public static String sanitize(final String content) {

        final List<String> positions = XmlUnicodeReplacer.findNonAsciiPositions(content, 20);
        final int totalCount = XmlUnicodeReplacer.countNonAsciiOccurrences(content);

        System.out.println(XmlUnicodeReplacer.TARGET_UNICODE_RANGE);
        final StringBuilder foundCountBuilder = new StringBuilder();
        foundCountBuilder.append(XmlUnicodeReplacer.FOUND_NON_ASCII_PREFIX);
        foundCountBuilder.append(totalCount);
        System.out.println(foundCountBuilder.toString());

        if (!positions.isEmpty()) {
            final StringBuilder firstBuilder = new StringBuilder();
            firstBuilder.append(XmlUnicodeReplacer.FIRST_PREFIX);
            firstBuilder.append(positions.size());
            firstBuilder.append(XmlUnicodeReplacer.FIRST_SUFFIX);
            System.out.println(firstBuilder.toString());
            for (String position : positions) {
                final StringBuilder positionBuilder = new StringBuilder();
                positionBuilder.append(XmlUnicodeReplacer.POSITION_PREFIX);
                positionBuilder.append(position);
                System.out.println(positionBuilder.toString());
            }
        }

        final String replaced = XmlUnicodeReplacer.replaceNonAscii(content);

        if (totalCount > 0) {
            final StringBuilder replacedBuilder = new StringBuilder();
            replacedBuilder.append(XmlUnicodeReplacer.REPLACED_PREFIX);
            replacedBuilder.append(XmlUnicodeReplacer.REPLACEMENT);
            System.out.println(replacedBuilder.toString());
            throw new RuntimeException();
        } else {
            System.out.println(XmlUnicodeReplacer.NO_NON_ASCII);
        }
        
        return replaced;
    }

    private static int countNonAsciiOccurrences(final String content) {
        int count = 0;
        for (int i = 0; i < content.length(); i++) {
            if (content.charAt(i) > XmlUnicodeReplacer.ASCII_MAX) {
                count++;
            }
        }
        return count;
    }

    private static String replaceNonAscii(final String content) {
        final StringBuilder stringBuilder = new StringBuilder(content.length());
        for (int i = 0; i < content.length(); i++) {
            final char current = content.charAt(i);
            if (current > XmlUnicodeReplacer.ASCII_MAX) {
                stringBuilder.append(XmlUnicodeReplacer.REPLACEMENT);
            } else {
                stringBuilder.append(current);
            }
        }
        return stringBuilder.toString();
    }

    private static List<String> findNonAsciiPositions(final String content, final int limit) {
        final List<String> positions = new ArrayList<>();
        int line = 1;
        int column = 1;

        for (int i = 0; i < content.length(); i++) {
            final char current = content.charAt(i);
            if (current > XmlUnicodeReplacer.ASCII_MAX) {
                final String unicode = String.format(XmlUnicodeReplacer.UNICODE_FORMAT, (int) current);
                final StringBuilder positionBuilder = new StringBuilder();
                positionBuilder.append(XmlUnicodeReplacer.POSITION_LINE_PREFIX);
                positionBuilder.append(line);
                positionBuilder.append(XmlUnicodeReplacer.POSITION_COLUMN_PREFIX);
                positionBuilder.append(column);
                positionBuilder.append(XmlUnicodeReplacer.POSITION_INDEX_PREFIX);
                positionBuilder.append(i);
                positionBuilder.append(XmlUnicodeReplacer.POSITION_UNICODE_PREFIX);
                positionBuilder.append(unicode);
                positions.add(positionBuilder.toString());
                if (positions.size() >= limit) {
                    break;
                }
            }

            if (current == '\n') {
                line++;
                column = 1;
            } else {
                column++;
            }
        }

        return positions;
    }

    private static void printUsageAndExit() {
        System.err.println(XmlUnicodeReplacer.USAGE);
        System.err.println(XmlUnicodeReplacer.EXAMPLES);
        System.err.println(XmlUnicodeReplacer.EXAMPLE_1);
        System.err.println(XmlUnicodeReplacer.EXAMPLE_2);
        System.err.println(XmlUnicodeReplacer.EXAMPLE_3);
        System.exit(1);
    }
}