<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />

    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/game">

package org.allbinary.game.canvas;

import org.allbinary.logic.system.SoftwareInformation;

public class GDGameSoftwareInfo
{
    private static final SoftwareInformation SINGLETON = 
        new SoftwareInformation("<xsl:value-of select="properties/packageName" />.GDGame", "1.2.0");

    public static SoftwareInformation getInstance()
    {
        return SINGLETON;
    }
}
        
    </xsl:template>

</xsl:stylesheet>
