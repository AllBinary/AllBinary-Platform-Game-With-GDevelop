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

<!-- File generation template (was GDResources.origin). The text is output as is: &#13; keeps the windows line endings.
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
public class GDResources&#13;
{&#13;
    private static final GDResources instance = new GDResources();&#13;
&#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    public static GDResources getInstance()&#13;
    {&#13;
        return instance;&#13;
    }&#13;
&#13;
    public int currentLayoutRequiredTotal;&#13;
&#13;
    public final String BLANK = "blank.png";&#13;
&#13;
            //&lt;xsl:for-each select="resources" &gt;&#13;
                //&lt;xsl:for-each select="resources" &gt;&#13;
                //resources=&lt;xsl:value-of select="file" /&gt;&lt;xsl:text&gt; &lt;/xsl:text&gt;&lt;xsl:value-of select="kind" /&gt;&lt;xsl:text&gt; &lt;/xsl:text&gt;&lt;xsl:value-of select="metadata" /&gt;&lt;xsl:text&gt; &lt;/xsl:text&gt;&lt;xsl:value-of select="name" /&gt;&lt;xsl:text&gt; &lt;/xsl:text&gt;&lt;xsl:value-of select="userAdded" /&gt;&#13;
                //&lt;/xsl:for-each&gt;&#13;
            //&lt;/xsl:for-each&gt;&#13;
    </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The resources (icons only write the prefix) and the resource array from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#10;</xsl:text>
        <xsl:for-each select="/template/resource" >
            <xsl:value-of select="@prefix" />
            <xsl:if test="@icon != 'true'" >
                <xsl:text>    public final String </xsl:text><xsl:value-of select="@name" /><xsl:text> = "</xsl:text><xsl:value-of select="@value" /><xsl:text>";&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;    public final String[] resourceStringArray = {&#10;BLANK,&#10;</xsl:text>
        <xsl:for-each select="/template/arrayResource" >
            <xsl:text>        </xsl:text><xsl:value-of select="@prefix" /><xsl:value-of select="@name" /><xsl:text>, //</xsl:text><xsl:value-of select="@index" /><xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    };&#10;&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
