<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

<xsl:text disable-output-escaping="yes" >&lt;</xsl:text>?xml version="1.0" encoding="utf-8"?<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
<xsl:text disable-output-escaping="yes" >&lt;</xsl:text>manifest xmlns:android="http://schemas.android.com/apk/res/android"
    android:versionName="1.2.12" android:versionCode="1" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&#10;</xsl:text><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!--
    //No soft keys
    //No Virtual Keyboard library (AndroidThroughAPI2JavaLibrary)
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="1" android:maxSdkVersion="2" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    //Anything beyond API2 that is API3+ needs:
    //Android Virtual Keyboard library (AndroidAPI3AndUpJavaLibrary)

    //No Multi-touch
    //Requires:
    //Android Fracture Helper (AndroidThroughAPI4JavaLibrary)
    //Single touch library (MotionInputThroughAPI4AndroidJavaLibrary)
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="3" android:maxSdkVersion="4" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    //Supports Multi-touch
    //Requires:
    //Android Fracture Helper (AndroidAPI5AndUpJavaLibrary)
    //Multi-touch library (MotionInputAPI5AndUpAndroidJavaLibrary)
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="5" android:targetSdkVersion="8" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    //Notes: API 5-7 may not return proper feature info about multitouch
    //as such I need to find out how to detect it properly if for some games
    //Although, my games do not need to know if multi touch is truely available
    //they only need the Multi-touch library.

    //Use the following for dynamic versioning
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="1" android:targetSdkVersion="8" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="1" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:minSdkVersion="4" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-sdk android:targetSdkVersion="33" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!-- @integer/google_play_services_version --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!--
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>meta-data android:name="com.google.android.gms.version" android:value="8" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="com.android.vending.BILLING" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.INTERNET" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!--
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.READ_PHONE_STATE"<xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/uses-permission<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.VIBRATE" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.WAKE_LOCK" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.BROADCAST_STICKY" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    
    
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!-- android:xlargeScreens="true" Note: Is automatically true for sdk 14+, 
    but if you add it then you must use android:targetSdkVersion for when 
    xlargeScreens was added. So, by not having it you can support sdk 1-14 but 
    you lose xlargeScreens from sdk 11-13 of which none is known to exist --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>supports-screens android:largeScreens="true"
        android:normalScreens="true" android:smallScreens="true" android:anyDensity="true" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>uses-feature android:required="false" android:name="android.hardware.touchscreen" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!--
    API <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>= 3 can use the following: InputMethodManager Since: API Level 3

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>supports-screens android:xlargeScreens="true" android:largeScreens="true"
        android:normalScreens="true" android:smallScreens="true" android:anyDensity="true" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!-- android:resizable="true" --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!-- android:screenOrientation="landscape" --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>application android:label="@string/gd_app_name" android:icon="@drawable/gd_icon" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>activity android:label="@string/gd_app_name" android:icon="@drawable/gd_icon"
        <xsl:text disable-output-escaping="yes" >&#10;</xsl:text>
                  android:name="org.allbinary.game.gd.<xsl:for-each select="properties" ><xsl:value-of select="packageName" /><xsl:if test="string-length(packageName) = 0" ><xsl:value-of select="name" /></xsl:if></xsl:for-each>.GDGameAndroidActivity"
                  <xsl:for-each select="properties" ><xsl:if test="androidScreenOrientation = 'landscape'" >android:screenOrientation="landscape"</xsl:if></xsl:for-each>
                  android:configChanges="keyboardHidden|orientation"
                  android:exported="true" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>intent-filter<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>action android:name="android.intent.action.MAIN" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>category android:name="android.intent.category.LAUNCHER" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>category android:name="tv.ouya.intent.category.APP"/<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/intent-filter<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/activity<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>activity
            android:name="org.allbinary.android.activity.WebViewActivity"
            android:exported="true" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/activity<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>service android:enabled="true"
            android:process=":MusicService"
            android:name="org.allbinary.game.gd.MusicService" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>!--
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>activity android:name="com.google.ads.AdActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        --<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/application<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

<xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/manifest<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>

    </xsl:template>

</xsl:stylesheet>
