<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/indexof.xsl" />

    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/game">

package org.allbinary.game.canvas;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.system.SoftwareInformation;
import org.allbinary.logic.system.security.licensing.ClientInformation;

public class GDGameSoftwareInfo
{
    public static Object TEMP_HACK_CLIENT_INFORMATION = NullUtil.getInstance().NULL_OBJECT;

    public static void setTempClientInformation(final ClientInformation clientInformation) {
        GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION = clientInformation;
    }
        
    <xsl:variable name="shortName" ><xsl:value-of select="properties/shortName" /><xsl:if test="not(properties/shortName)" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" ><xsl:value-of select="properties/packageName" /></xsl:with-param><xsl:with-param name="char" select="'.'" /></xsl:call-template></xsl:if></xsl:variable>
    private static final SoftwareInformation SINGLETON = 
        new SoftwareInformation("<xsl:value-of select="properties/packageName" />.GDGame", "1.2.0", <xsl:if test="string-length($shortName) > 8" >Short Name or package ending is to long</xsl:if><xsl:if test="string-length($shortName) = 0" >Short Name or package ending is to short</xsl:if> "<xsl:value-of select="$shortName" />");

    public static SoftwareInformation getInstance()
    {
        return GDGameSoftwareInfo.SINGLETON;
    }
}
        
    </xsl:template>

</xsl:stylesheet>
