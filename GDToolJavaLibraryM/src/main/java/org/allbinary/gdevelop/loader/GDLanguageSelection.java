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
package org.allbinary.gdevelop.loader;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.allbinary.logic.NullUtil;

/**
 * Selects the generation language from the command line (-language=Kotlin, --language Kotlin, -l Kt)
 * or by prompting on the console when no language argument was given.
 *
 * @author User
 */
public class GDLanguageSelection {

    private static final GDLanguageSelection instance = new GDLanguageSelection();

    /**
     * @return the instance
     */
    public static GDLanguageSelection getInstance() {
        return instance;
    }

    private final String[] ARG_PREFIX_ARRAY = {"-language=", "--language=", "-l="};
    private final String[] ARG_NAME_ARRAY = {"-language", "--language", "-l"};

    private final String[] TEST_ARG_ARRAY = {"-test", "--test", "-t"};
    private final String YES = "y";
    private final String YES_LONG = "yes";

    private final GDLanguageFactory gdLanguageFactory = GDLanguageFactory.getInstance();

    private BufferedReader bufferedReader;

    private BufferedReader getBufferedReader() {
        if (this.bufferedReader == null) {
            this.bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        }
        return this.bufferedReader;
    }

    /**
     * @return true when generated files should get a t added to the end of the extension (GDGlobals.kt -> GDGlobals.ktt)
     * so they can be compared with the existing files. Uses -test, --test, or -t. Only prompts when the language was also prompted.
     */
    public boolean selectTestExtension(final String[] args) throws Exception {
        final int size = args.length;
        for (int index = 0; index < size; index++) {
            for (int index2 = 0; index2 < this.TEST_ARG_ARRAY.length; index2++) {
                if (args[index].equalsIgnoreCase(this.TEST_ARG_ARRAY[index2])) {
                    return true;
                }
            }
        }

        if (this.getFromArgs(args) != NullUtil.getInstance().NULL_OBJECT) {
            return false;
        }
        return this.promptTestExtension();
    }

    public boolean promptTestExtension() throws Exception {
        System.out.print("Add t to the end of the file extension for testing (y/N)?\n> ");
        System.out.flush();

        final String line = this.getBufferedReader().readLine();
        if (line == null) {
            return false;
        }
        final String trimmed = line.trim();
        return trimmed.equalsIgnoreCase(this.YES) || trimmed.equalsIgnoreCase(this.YES_LONG);
    }

    public GDLanguage select(final String[] args) throws Exception {
        final Object argLanguage = this.getFromArgs(args);
        if (argLanguage != NullUtil.getInstance().NULL_OBJECT) {
            return (GDLanguage) argLanguage;
        }
        return this.prompt();
    }

    public Object getFromArgs(final String[] args) throws Exception {
        final int size = args.length;
        String value = null;
        for (int index = 0; index < size; index++) {
            final String arg = args[index];
            for (int index2 = 0; index2 < this.ARG_PREFIX_ARRAY.length; index2++) {
                if (arg.toLowerCase().startsWith(this.ARG_PREFIX_ARRAY[index2])) {
                    value = arg.substring(this.ARG_PREFIX_ARRAY[index2].length());
                }
            }
            for (int index2 = 0; index2 < this.ARG_NAME_ARRAY.length; index2++) {
                if (arg.equalsIgnoreCase(this.ARG_NAME_ARRAY[index2]) && index + 1 < size) {
                    value = args[index + 1];
                }
            }
        }

        if (value == null) {
            return NullUtil.getInstance().NULL_OBJECT;
        }

        final Object language = this.gdLanguageFactory.get(value);
        if (language == NullUtil.getInstance().NULL_OBJECT) {
            throw new Exception("Unknown language: " + value + "\n" + this.getLanguageListAsString());
        }
        return language;
    }

    public GDLanguage prompt() throws Exception {
        final BufferedReader bufferedReader = this.getBufferedReader();
        while (true) {
            System.out.print("Select the language to generate (Enter for Java):\n" + this.getLanguageListAsString() + "> ");
            System.out.flush();

            final String line = bufferedReader.readLine();
            if (line == null || line.trim().length() == 0) {
                return this.gdLanguageFactory.JAVA;
            }

            final Object language = this.gdLanguageFactory.get(line);
            if (language != NullUtil.getInstance().NULL_OBJECT) {
                return (GDLanguage) language;
            }
            System.out.println("Unknown language: " + line);
        }
    }

    public String getLanguageListAsString() {
        final StringBuilder stringBuilder = new StringBuilder();
        final GDLanguage[] languageArray = this.gdLanguageFactory.LANGUAGE_ARRAY;
        final int size = languageArray.length;
        for (int index = 0; index < size; index++) {
            final GDLanguage language = languageArray[index];
            stringBuilder.append("  ").append(index + 1).append(") ").append(language.name)
                .append(" [").append(language.shortName.length() == 0 ? "-" : language.shortName)
                .append(", ").append(language.extension).append("]\n");
        }
        return stringBuilder.toString();
    }

}
