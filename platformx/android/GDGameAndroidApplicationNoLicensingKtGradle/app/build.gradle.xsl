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
    alias(libs.plugins.android.application)&#13;
    alias(libs.plugins.kotlin.compose)&#13;
}&#13;
&#13;
android {&#13;
    namespace = "org.allbinary.game.gd.</xsl:text><xsl:value-of select="$name" /><xsl:text>"&#13;
    compileSdk = 37&#13;
&#13;
    defaultConfig {&#13;
        applicationId = "org.allbinary.game.gd.</xsl:text><xsl:value-of select="$name" /><xsl:text>"&#13;
        minSdk = 30&#13;
        targetSdk = 37&#13;
        versionCode = 52&#13;
        versionName = "1.2.18"&#13;
&#13;
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"&#13;
    }&#13;
&#13;
    buildTypes {&#13;
        release {&#13;
            optimization {&#13;
                enable = true&#13;
            }&#13;
            isMinifyEnabled = true&#13;
            isShrinkResources = true&#13;
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "G:/mnt/bc/mydev/work/j2me/games/All_Android.pro")&#13;
        }&#13;
    }&#13;
    compileOptions {&#13;
        sourceCompatibility = JavaVersion.VERSION_21&#13;
        targetCompatibility = JavaVersion.VERSION_21&#13;
    }&#13;
    //kotlin {&#13;
        //jvmToolchain(11) // Match the version number&#13;
    //}&#13;
    buildFeatures {&#13;
        compose = true&#13;
    }&#13;
}&#13;
&#13;
dependencies {&#13;
&#13;
    implementation(kotlin("reflect"))&#13;
    implementation(libs.androidx.core.ktx)&#13;
    implementation(libs.androidx.lifecycle.runtime.ktx)&#13;
    implementation(libs.androidx.activity.compose)&#13;
    implementation(platform(libs.androidx.compose.bom))&#13;
    implementation(libs.androidx.ui)&#13;
    implementation(libs.androidx.ui.graphics)&#13;
    implementation(libs.androidx.ui.tooling.preview)&#13;
    implementation(libs.androidx.material3)&#13;
    testImplementation(libs.junit)&#13;
    androidTestImplementation(libs.androidx.junit)&#13;
    androidTestImplementation(libs.androidx.espresso.core)&#13;
    androidTestImplementation(platform(libs.androidx.compose.bom))&#13;
    androidTestImplementation(libs.androidx.ui.test.junit4)&#13;
    debugImplementation(libs.androidx.ui.tooling)&#13;
    debugImplementation(libs.androidx.ui.test.manifest)&#13;
}</xsl:text></xsl:template>

</xsl:stylesheet>
