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

import java.io.File;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDPaths {

    public static final String DEFAULT_PATH = "..\\";
    
    private static Object instance = NullUtil.getInstance().NULL_OBJECT;

    /**
     * @return the instance
     */
    public static GDPaths getInstance() {
        return (GDPaths) GDPaths.instance;
    }

    public static void init() {
        GDPaths.init(GDLanguageFactory.getInstance().JAVA);
    }

    public static void init(final GDLanguage language) {
        GDPaths.init(language, false);
    }

    /**
     * Selects the language and the test extension option from the command line or by prompting.
     */
    public static void init(final String[] args) throws Exception {
        final GDLanguageSelection gdLanguageSelection = GDLanguageSelection.getInstance();
        final GDLanguage language = gdLanguageSelection.select(args);
        final boolean testExtension = gdLanguageSelection.selectTestExtension(args);
        GDPaths.init(language, testExtension);
    }

    /**
     * @param testExtension when true generated files get a t added to the end of the extension for comparing with the existing files.
     */
    public static void init(final GDLanguage language, final boolean testExtension) {
        GDPaths.instance = new GDPaths(GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language, testExtension);
    }

    /**
     * Default paths except the generation output path. Useful for generating into a scratch directory.
     */
    public static void initGenPath(final String genPath, final GDLanguage language) {
        GDPaths.instance = new GDPaths(GDPaths.DEFAULT_PATH, genPath, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language);
    }

    public static void init(final String xslPath, final String genPath, final String projectPath) {
        GDPaths.init(xslPath, genPath, projectPath, GDLanguageFactory.getInstance().JAVA);
    }

    public static void init(final String xslPath, final String genPath, final String projectPath, final GDLanguage language) {
        GDPaths.instance = new GDPaths(xslPath, genPath, projectPath, "sounds\\", StringUtil.getInstance().EMPTY_STRING, "2d\\Resources\\2d\\res\\raw\\", "3d\\Resources\\3d\\res\\raw\\", language);
    }

    private final String XSL_EXTENSION = ".xsl";
    private final String JAVA_EXTENSION = ".java";
    private final String TEST_EXTENSION_SUFFIX = "t";
    private final String MODULE_PREFIX = "GDGame";
    private final String[] MODULE_SUFFIX_ARRAY = {"Gradle", "M"};

    public String ROOT_PATH;
    public String GEN_PATH;
    public String PROJECT_PATH;

    public final GDLanguage language;
    public final boolean testExtension;
    /**
     * The language source extensions of generated files. With testExtension .kt is .ktt.
     */
    public final String[] outputExtensionArray;

    public final String GAME_XML_PATH;

    public final String GAME_JSON_PATH;

    public final String TWOD_RESOURCES_PATH;
    public final String THREED_RESOURCES_PATH;
    public final String ASSETS_PATH;

    public final String ROTATION_ANIMATION_FILE_PATH;

    public final String SOUND_RESOURCES_ROOT_PATH;
    
    public GDPaths(final String xslPath, final String genPath, final String projectPath, final String soundResourcesDirectory, final String assetsDirectory, final String twodPath, final String threedPath) {
        this(xslPath, genPath, projectPath, soundResourcesDirectory, assetsDirectory, twodPath, threedPath, GDLanguageFactory.getInstance().JAVA);
    }

    public GDPaths(final String xslPath, final String genPath, final String projectPath, final String soundResourcesDirectory, final String assetsDirectory, final String twodPath, final String threedPath, final GDLanguage language) {
        this(xslPath, genPath, projectPath, soundResourcesDirectory, assetsDirectory, twodPath, threedPath, language, false);
    }

    public GDPaths(final String xslPath, final String genPath, final String projectPath, final String soundResourcesDirectory, final String assetsDirectory, final String twodPath, final String threedPath, final GDLanguage language, final boolean testExtension) {

        this.language = language;
        this.testExtension = testExtension;

        final int size = language.extensionArray.length;
        this.outputExtensionArray = new String[size];
        for (int index = 0; index < size; index++) {
            this.outputExtensionArray[index] = testExtension ? language.extensionArray[index] + this.TEST_EXTENSION_SUFFIX : language.extensionArray[index];
        }

        if (testExtension) {
            LogUtil.getInstance().putF(new StringBuilder().append("Test extension: generated files end with ").append(this.outputExtensionArray[0]).toString(), this, "GDPaths");
        }
        this.ROOT_PATH = xslPath;
        this.GEN_PATH = genPath;
        this.PROJECT_PATH = projectPath;

        this.GAME_XML_PATH = this.PROJECT_PATH + "game.xml";

        this.GAME_JSON_PATH = this.PROJECT_PATH + "game.json";

        this.SOUND_RESOURCES_ROOT_PATH = this.PROJECT_PATH + soundResourcesDirectory;
        this.TWOD_RESOURCES_PATH = this.PROJECT_PATH + assetsDirectory + twodPath;
        this.THREED_RESOURCES_PATH = this.PROJECT_PATH + assetsDirectory + threedPath;
        this.ASSETS_PATH = this.PROJECT_PATH + assetsDirectory + "assets\\";

        this.ROTATION_ANIMATION_FILE_PATH = this.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
    }

    /**
     * file.xsl -> file<shortName>.xsl. For example GDGlobals.xsl -> GDGlobalsKt.xsl for Kotlin.
     */
    public String getXslPath(final String javaXslPath) {
        if (this.language.isJava() || !javaXslPath.endsWith(this.XSL_EXTENSION)) {
            return javaXslPath;
        }
        final String base = javaXslPath.substring(0, javaXslPath.length() - this.XSL_EXTENSION.length());
        return new StringBuilder().append(base).append(this.language.shortName).append(this.XSL_EXTENSION).toString();
    }

    /**
     * Uses the language version of a template (R.original -> RKt.original) when it exists, otherwise the Java template.
     */
    public String getTemplatePath(final String javaTemplatePath) {
        if (this.language.isJava()) {
            return javaTemplatePath;
        }
        final int separatorIndex = Math.max(javaTemplatePath.lastIndexOf('\\'), javaTemplatePath.lastIndexOf('/'));
        final int extensionIndex = javaTemplatePath.lastIndexOf('.');
        if (extensionIndex <= separatorIndex) {
            return javaTemplatePath;
        }
        final String languageTemplatePath = new StringBuilder().append(javaTemplatePath.substring(0, extensionIndex))
            .append(this.language.shortName).append(javaTemplatePath.substring(extensionIndex)).toString();
        if (new File(languageTemplatePath).exists()) {
            return languageTemplatePath;
        }
        LogUtil.getInstance().putF(new StringBuilder().append("No ").append(this.language.name).append(" template: ").append(languageTemplatePath).append(" using: ").append(javaTemplatePath).toString(), this, "getTemplatePath");
        return javaTemplatePath;
    }

    /**
     * Converts a Java generation output path to the selected language:
     * the module directory gets the language short name (GDGameGeneratedJavaLibraryM -> GDGameGeneratedJavaLibraryKtM,
     * GDGameAndroidApplicationNoLicensingGradle -> GDGameAndroidApplicationNoLicensingKtGradle)
     * and .java files get the language extension.
     * Parent directories are created for non Java languages since the language modules may not exist yet.
     * With testExtension a t is added to the end of the source extension (.kt -> .ktt) for comparing with the existing file.
     */
    public String getOutputPath(final String javaOutputPath) {
        final String result = this.getTestPath(this.getLanguagePath(javaOutputPath));

        if (!this.language.isJava()) {
            final File parentFile = new File(result).getParentFile();
            if (parentFile != null && !parentFile.exists()) {
                parentFile.mkdirs();
            }
        }

        return result;
    }

    /**
     * Adds a t to the end of a language source extension when testExtension is set.
     */
    public String getTestPath(final String languagePath) {
        if (!this.testExtension) {
            return languagePath;
        }
        final String[] extensionArray = this.language.extensionArray;
        final int size = extensionArray.length;
        for (int index = 0; index < size; index++) {
            if (languagePath.endsWith(extensionArray[index])) {
                return new StringBuilder().append(languagePath).append(this.TEST_EXTENSION_SUFFIX).toString();
            }
        }
        return languagePath;
    }

    /**
     * Same conversion as getOutputPath without creating directories or the test extension.
     */
    public String getLanguagePath(final String javaOutputPath) {
        if (this.language.isJava()) {
            return javaOutputPath;
        }

        String prefix = StringUtil.getInstance().EMPTY_STRING;
        String path = javaOutputPath;
        if (path.startsWith(this.GEN_PATH)) {
            prefix = this.GEN_PATH;
            path = path.substring(this.GEN_PATH.length());
        }

        final StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(prefix);

        boolean moduleFound = false;
        int start = 0;
        final int length = path.length();
        for (int index = 0; index <= length; index++) {
            if (index == length || path.charAt(index) == '\\' || path.charAt(index) == '/') {
                String segment = path.substring(start, index);
                if (!moduleFound && index < length && this.isModuleSegment(segment)) {
                    moduleFound = true;
                    segment = this.getLanguageModuleSegment(segment);
                }
                stringBuilder.append(segment);
                if (index < length) {
                    stringBuilder.append(path.charAt(index));
                }
                start = index + 1;
            }
        }

        String result = stringBuilder.toString();
        if (result.endsWith(this.JAVA_EXTENSION)) {
            result = new StringBuilder().append(result.substring(0, result.length() - this.JAVA_EXTENSION.length())).append(this.language.extension).toString();
        }

        return result;
    }

    private boolean isModuleSegment(final String segment) {
        if (!segment.startsWith(this.MODULE_PREFIX)) {
            return false;
        }
        final int size = this.MODULE_SUFFIX_ARRAY.length;
        for (int index = 0; index < size; index++) {
            if (segment.endsWith(this.MODULE_SUFFIX_ARRAY[index])) {
                return true;
            }
        }
        return false;
    }

    private String getLanguageModuleSegment(final String segment) {
        final int size = this.MODULE_SUFFIX_ARRAY.length;
        for (int index = 0; index < size; index++) {
            final String suffix = this.MODULE_SUFFIX_ARRAY[index];
            if (segment.endsWith(suffix)) {
                final String base = segment.substring(0, segment.length() - suffix.length());
                if (base.endsWith(this.language.shortName)) {
                    //Already a language module such as GDGameAndroidApplicationNoLicensingKtGradle
                    return segment;
                }
                return new StringBuilder().append(base).append(this.language.shortName).append(suffix).toString();
            }
        }
        return segment;
    }

}
