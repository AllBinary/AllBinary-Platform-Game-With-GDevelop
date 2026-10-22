<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<!-- File generation template (was GDLazyResources.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />


    <xsl:template match="/"><xsl:text>
package org.allbinary.game.gd.resource;&#13;
&#13;
/**&#13;
 *&#13;
 * @author User&#13;
 */&#13;
public class GDLazyResources&#13;
{&#13;
    private static final GDLazyResources instance = new GDLazyResources();&#13;
&#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    public static GDLazyResources getInstance()&#13;
    {&#13;
        return instance;&#13;
    }&#13;
    &#13;
    </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The image widths, image heights and required resources from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#10;final GDResources gdResources = GDResources.getInstance();&#10;&#10;</xsl:text>
        <xsl:text>    public final int[] imageResourceWidthArray = {&#10;32,&#10;</xsl:text>
        <xsl:for-each select="/template/width" >
            <xsl:text>        </xsl:text><xsl:value-of select="@value" /><xsl:text>, //</xsl:text><xsl:value-of select="@name" /><xsl:text> </xsl:text><xsl:value-of select="@index" /><xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    };&#10;&#10;</xsl:text>
        <xsl:text>    public final int[] imageResourceHeightArray = {&#10;32,&#10;</xsl:text>
        <xsl:for-each select="/template/height" >
            <xsl:text>        </xsl:text><xsl:value-of select="@value" /><xsl:text>, //</xsl:text><xsl:value-of select="@name" /><xsl:text> </xsl:text><xsl:value-of select="@index" /><xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    };&#10;&#10;</xsl:text>
        <xsl:text>    public final String[] requiredResourcesBeforeLoadingArray = {&#10;</xsl:text>
        <xsl:for-each select="/template/required" >
            <xsl:text>gdResources.</xsl:text><xsl:value-of select="@name" /><xsl:text>,&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    };&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
