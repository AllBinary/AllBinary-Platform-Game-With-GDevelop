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

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.xml.transform.ErrorListener;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.tree.dom.BasicUriResolver;

/**
 * Compiles every xsl ending with the given suffix (for example Kt.xsl) so all syntax errors are reported at once.
 * The generator placeholders such as &lt;GD_CURRENT_INDEX&gt; are replaced with 0 before compiling like the generator does.
 * Run from GDToolJavaLibraryM since xsl imports are relative to it.
 *
 * Usage: GDXslCompileCheck suffix directory...
 */
public class GDXslCompileCheck {

    private static final String[] PLACEHOLDER_ARRAY = {"<GD_CURRENT_INDEX>", "<GD_EXTERNAL_LAYOUT_INDEX>", "<GD_CREATE_INSTANCE_INDEX>"};

    public static void main(final String[] args) throws Exception {
        if (args.length < 2) {
            System.out.println("Usage: GDXslCompileCheck suffix directory...");
            System.exit(1);
        }
        final String suffix = args[0];
        final List<File> fileList = new ArrayList<File>();
        for (int index = 1; index < args.length; index++) {
            collect(new File(args[index]), suffix, fileList);
        }
        Collections.sort(fileList);

        int failed = 0;
        for (final File file : fileList) {
            final List<String> errorList = compile(file);
            if (!errorList.isEmpty()) {
                //Component xsl files are not always standalone so ignore errors the Java xsl also has
                final String name = file.getName();
                final File javaFile = new File(file.getParentFile(), name.substring(0, name.length() - suffix.length()) + ".xsl");
                if (javaFile.exists() && !javaFile.equals(file)) {
                    final List<String> javaErrorList = compile(javaFile);
                    final List<String> javaMessageList = new ArrayList<String>();
                    for (final String error : javaErrorList) {
                        javaMessageList.add(getMessage(error));
                    }
                    final List<String> newErrorList = new ArrayList<String>();
                    for (final String error : errorList) {
                        if (!javaMessageList.contains(getMessage(error).replace(suffix, ".xsl"))) {
                            newErrorList.add(error);
                        }
                    }
                    errorList.clear();
                    errorList.addAll(newErrorList);
                }
            }
            if (!errorList.isEmpty()) {
                failed++;
                System.out.println("FAILED " + file.getPath());
                for (final String error : errorList) {
                    System.out.println("    " + error);
                }
            }
        }
        System.out.println("checked=" + fileList.size() + " failed=" + failed);
        System.exit(failed > 0 ? 2 : 0);
    }

    private static String getMessage(final String error) {
        String message = error.replaceFirst("^line [0-9]+: ", "");
        message = message.replaceAll("[0-9]+", "#");
        return message;
    }

    private static List<String> compile(final File file) {
        final List<String> errorList = new ArrayList<String>();
        try {
            String xsl = read(file);
            for (final String placeholder : PLACEHOLDER_ARRAY) {
                xsl = xsl.replace(placeholder, "0");
            }
            final TransformerFactory transformerFactory = TransformerFactory.newInstance();
            transformerFactory.setURIResolver(new BasicUriResolver());
            transformerFactory.setErrorListener(new ErrorListener() {
                public void warning(final TransformerException exception) {
                }

                public void error(final TransformerException exception) {
                    errorList.add(exception.getMessageAndLocation());
                }

                public void fatalError(final TransformerException exception) {
                    errorList.add(exception.getMessageAndLocation());
                }
            });
            final StreamSource streamSource = new StreamSource(new ByteArrayInputStream(xsl.getBytes("UTF-8")));
            transformerFactory.newTemplates(streamSource);
        } catch (Exception e) {
            if (errorList.isEmpty()) {
                errorList.add(e.toString());
            }
        }
        return errorList;
    }

    private static void collect(final File directory, final String suffix, final List<File> fileList) {
        final File[] fileArray = directory.listFiles();
        if (fileArray == null) {
            return;
        }
        for (final File file : fileArray) {
            if (file.isDirectory()) {
                if (!file.getName().equals("target")) {
                    collect(file, suffix, fileList);
                }
            } else if (file.getName().endsWith(suffix)) {
                fileList.add(file);
            }
        }
    }

    private static String read(final File file) throws Exception {
        final FileInputStream inputStream = new FileInputStream(file);
        try {
            final byte[] byteArray = new byte[(int) file.length()];
            int offset = 0;
            while (offset < byteArray.length) {
                final int read = inputStream.read(byteArray, offset, byteArray.length - offset);
                if (read < 0) {
                    break;
                }
                offset += read;
            }
            return new String(byteArray, 0, offset, "UTF-8");
        } finally {
            inputStream.close();
        }
    }

}
