<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/indexof.xsl" />

    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/game">

package org.allbinary.game.canvas;

import org.allbinary.logic.system.SoftwareInformation;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

public class GDGameSoftwareInfo
{
    public static AbeClientInformationInterface TEMP_HACK_CLIENT_INFORMATION;

    private static final SoftwareInformation SINGLETON = 
    new SoftwareInformation("<xsl:value-of select="properties/packageName" />.GDGame", "1.2.0", <xsl:if test="string-length(properties/shortName) > 8" >Short Name is to long</xsl:if><xsl:if test="string-length(properties/shortName) < 2" >Short Name is to short</xsl:if>"<xsl:value-of select="properties/shortName" />");

    public static SoftwareInformation getInstance()
    {
        return SINGLETON;
    }
}
        
    </xsl:template>

</xsl:stylesheet>
