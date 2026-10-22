<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2026 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<!-- File generation template (was build.gradle.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>plugins {&#13;
    id 'com.android.application'&#13;
}&#13;
&#13;
android {&#13;
    compileSdkVersion 37&#13;
    buildToolsVersion = "37.0.0"&#13;
&#13;
    defaultConfig {&#13;
        //needs template&#13;
        applicationId "org.allbinary.game.gd.</xsl:text><xsl:value-of select="$name" /><xsl:text>"&#13;
        minSdkVersion 4&#13;
        targetSdkVersion 37&#13;
        versionCode 1&#13;
        versionName "0.0.2100"&#13;
&#13;
        //testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"&#13;
    }&#13;
&#13;
    buildTypes {&#13;
        debug {&#13;
            //debuggable false //APKs seems to not run correctly without debug info&#13;
            //buildConfigField "boolean", "DEBUG_MODE", "false"&#13;
            //shrinkResources true&#13;
            //minifyEnabled true&#13;
            //proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'&#13;
            //proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro', 'G:/mnt/bc/mydev/work/j2me/games/All_Android.pro'&#13;
        }&#13;
        release {&#13;
            optimization {&#13;
                enable = true&#13;
            }&#13;
            shrinkResources true&#13;
            //minifyEnabled true (used before 9.3.0 for R8)&#13;
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'G:/mnt/bc/mydev/work/j2me/games/All_Android.pro'        &#13;
        }&#13;
    }&#13;
    compileOptions {&#13;
        sourceCompatibility JavaVersion.VERSION_21&#13;
        targetCompatibility JavaVersion.VERSION_21&#13;
    }&#13;
    namespace 'org.allbinary.game.gd.</xsl:text><xsl:value-of select="$name" /><xsl:text>'&#13;
}&#13;
&#13;
dependencies {&#13;
    //implementation "androidx.core:core:1.17.0"&#13;
&#13;
}</xsl:text></xsl:template>

</xsl:stylesheet>
