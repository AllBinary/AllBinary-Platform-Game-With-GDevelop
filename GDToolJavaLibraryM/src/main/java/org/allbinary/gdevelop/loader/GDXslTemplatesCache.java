/*
 * GDevelop to AllBinary Core
 * Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.StringBufferInputStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.transform.Templates;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

/**
 * Keeps compiled xsl between runs.
 * XSLTC only compiles one xsl at a time for the whole JVM so compiling is most of the generation time.
 * The compiled xsl (Templates) is saved to the cache directory and loaded by the next run instead of compiling again.
 * The cache file name is a hash of the Java version, the xsl and every xsl it imports so any change compiles again.
 *
 * The cache directory is java.io.tmpdir\gdxslcache or the gd.xsl.cache.dir system property. An empty gd.xsl.cache.dir does not use a cache.
 * Loading a saved Templates needs jdk.xml.enableTemplatesImplDeserialization=true which is set when a cached xsl is loaded.
 * Only use a cache directory that only you can write to.
 */
public class GDXslTemplatesCache
{
    private static final GDXslTemplatesCache instance = new GDXslTemplatesCache();

    public static GDXslTemplatesCache getInstance() {
        return instance;
    }

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final Charset BYTE_CHARSET = Charset.forName("ISO-8859-1");
    private final String CACHE_DIRECTORY_PROPERTY = "gd.xsl.cache.dir";
    private final String DEFAULT_CACHE_DIRECTORY = "gdxslcache";
    private final String DESERIALIZE_PROPERTY = "jdk.xml.enableTemplatesImplDeserialization";
    private final String TRUE = "true";
    private final String EXTENSION = ".templates";
    private final String TEMP_EXTENSION = ".tmp";
    private final String SHA_256 = "SHA-256";
    private final char[] HEX_ARRAY = "0123456789abcdef".toCharArray();
    private final String LOADED = "Loaded compiled xsl: ";
    private final String SAVED = "Saved compiled xsl: ";
    private final String NOT_LOADED = "Compiling xsl again since the cached xsl was not loaded: ";
    private final String NOT_SAVED = "Unable to save compiled xsl: ";

    private final Pattern IMPORT_PATTERN = Pattern.compile("<xsl:(?:import|include)\\s+href=\"([^\"]+)\"");
    private final Pattern COMMENT_PATTERN = Pattern.compile("<!--.*?-->", Pattern.DOTALL);

    private final File cacheDirectory;

    private GDXslTemplatesCache() {
        final String cacheDirectoryPath = System.getProperty(this.CACHE_DIRECTORY_PROPERTY);
        if (cacheDirectoryPath == null) {
            this.cacheDirectory = new File(System.getProperty("java.io.tmpdir"), this.DEFAULT_CACHE_DIRECTORY);
        } else if (cacheDirectoryPath.length() == 0) {
            this.cacheDirectory = null;
        } else {
            this.cacheDirectory = new File(cacheDirectoryPath);
        }
    }

    /**
     * @param xslDocumentAsString an xsl loaded from a string so imports are relative to the current directory
     */
    public Templates newTemplates(final String xslDocumentAsString) throws Exception {

        final File file = this.getCacheFile(xslDocumentAsString);

        if (file != null && file.isFile()) {
            try {
                System.setProperty(this.DESERIALIZE_PROPERTY, this.TRUE);
                final ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream(file));
                try {
                    final Templates templates = (Templates) objectInputStream.readObject();
                    this.logUtil.putF(new StringMaker().append(this.LOADED).append(file.getName()).toString(), this, this.commonStrings.PROCESS);
                    return templates;
                } finally {
                    objectInputStream.close();
                }
            } catch (Exception e) {
                this.logUtil.put(new StringMaker().append(this.NOT_LOADED).append(file.getPath()).toString(), this, this.commonStrings.PROCESS, e);
            }
        }

        final TransformerFactory transformerFactory = TransformerFactory.newInstance();
        transformerFactory.setURIResolver(new BasicUriResolver());
        final Templates templates = transformerFactory.newTemplates(new StreamSource(new StringBufferInputStream(xslDocumentAsString)));

        if (file != null) {
            this.save(templates, file);
        }
        return templates;
    }

    private void save(final Templates templates, final File file) {
        try {
            this.cacheDirectory.mkdirs();
            //Written to a temp file first so another run never loads part of a file
            final File tempFile = File.createTempFile(file.getName(), this.TEMP_EXTENSION, this.cacheDirectory);
            final ObjectOutputStream objectOutputStream = new ObjectOutputStream(new FileOutputStream(tempFile));
            try {
                objectOutputStream.writeObject(templates);
            } finally {
                objectOutputStream.close();
            }
            Files.move(tempFile.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            this.logUtil.putF(new StringMaker().append(this.SAVED).append(file.getName()).toString(), this, this.commonStrings.PROCESS);
        } catch (Exception e) {
            this.logUtil.put(new StringMaker().append(this.NOT_SAVED).append(file.getPath()).toString(), this, this.commonStrings.PROCESS, e);
        }
    }

    /**
     * @return null when there is no cache or an import is not found
     */
    private File getCacheFile(final String xslDocumentAsString) throws Exception {

        if (this.cacheDirectory == null) {
            return null;
        }

        final MessageDigest messageDigest = MessageDigest.getInstance(this.SHA_256);
        messageDigest.update(System.getProperty("java.version").getBytes(this.BYTE_CHARSET));
        messageDigest.update((byte) 0);
        messageDigest.update(xslDocumentAsString.getBytes(this.BYTE_CHARSET));

        final File currentDirectory = new File(".").getCanonicalFile();
        final List importList = new ArrayList();
        if (!this.addImports(null, xslDocumentAsString, currentDirectory, importList)) {
            return null;
        }

        final int size = importList.size();
        for (int index = 0; index < size; index++) {
            final File importFile = (File) importList.get(index);
            messageDigest.update((byte) 0);
            messageDigest.update(importFile.getPath().getBytes(this.BYTE_CHARSET));
            messageDigest.update((byte) 0);
            messageDigest.update(Files.readAllBytes(importFile.toPath()));
        }

        final byte[] hashArray = messageDigest.digest();
        final char[] hexCharArray = new char[hashArray.length * 2];
        for (int index = 0; index < hashArray.length; index++) {
            hexCharArray[index * 2] = this.HEX_ARRAY[(hashArray[index] >> 4) & 0xF];
            hexCharArray[index * 2 + 1] = this.HEX_ARRAY[hashArray[index] & 0xF];
        }
        return new File(this.cacheDirectory, new StringMaker().append(new String(hexCharArray)).append(this.EXTENSION).toString());
    }

    /**
     * An import is relative to the importing xsl or for the xsl loaded from a string relative to the current directory.
     * @return false when an import is not found
     */
    private boolean addImports(final File xslFile, final String xslDocumentAsString, final File currentDirectory, final List importList) throws Exception {
        final Matcher matcher = this.IMPORT_PATTERN.matcher(this.COMMENT_PATTERN.matcher(xslDocumentAsString).replaceAll(""));
        while (matcher.find()) {
            final String href = matcher.group(1);
            File file = null;
            if (xslFile != null) {
                file = new File(xslFile.getParentFile(), href);
            }
            if (file == null || !file.isFile()) {
                file = new File(currentDirectory, href);
            }
            if (!file.isFile()) {
                return false;
            }
            file = file.getCanonicalFile();
            if (!importList.contains(file)) {
                importList.add(file);
                if (!this.addImports(file, new String(Files.readAllBytes(file.toPath()), this.BYTE_CHARSET), currentDirectory, importList)) {
                    return false;
                }
            }
        }
        return true;
    }

}
