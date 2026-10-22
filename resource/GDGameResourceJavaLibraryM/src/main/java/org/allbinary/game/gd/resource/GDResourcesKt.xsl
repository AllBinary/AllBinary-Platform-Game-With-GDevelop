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

<!-- File generation template for Kotlin (made from the Java template that was GDResources.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />


    <xsl:template match="/"><xsl:text>/*&#13;
* AllBinary Open License Version 1&#13;
* Copyright (c) 2011 AllBinary&#13;
* &#13;
* By agreeing to this license you and any business entity you represent are&#13;
* legally bound to the AllBinary Open License Version 1 legal agreement.&#13;
* &#13;
* You may obtain the AllBinary Open License Version 1 legal agreement from&#13;
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.&#13;
* &#13;
* Created By: Travis Berthelot&#13;
* &#13;
 */&#13;
package org.allbinary.game.gd.resource&#13;
&#13;
import java.lang.Object&#13;
&#13;
/**&#13;
 *&#13;
 * @author User&#13;
 */&#13;
open public class GDResources : Object&#13;
{&#13;
    companion object {&#13;
&#13;
        private val instance: GDResources = GDResources()&#13;
&#13;
        /**&#13;
         * @return the instance&#13;
         */&#13;
        fun getInstance(): GDResources&#13;
        {&#13;
            return instance&#13;
        }&#13;
&#13;
    }&#13;
&#13;
    public constructor() : super()&#13;
    {&#13;
    }&#13;
&#13;
    var currentLayoutRequiredTotal: Int = 0&#13;
&#13;
    val BLANK: String = "blank.png"&#13;
&#13;
    </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The resources (icons only write the prefix) and the resource array from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#13;&#10;</xsl:text>
        <xsl:for-each select="/template/resource" >
            <xsl:value-of select="@prefix" />
            <xsl:if test="@icon != 'true'" >
                <xsl:text>    val </xsl:text><xsl:value-of select="@name" /><xsl:text>: String = "</xsl:text><xsl:value-of select="@value" /><xsl:text>"&#13;&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#13;&#10;    val resourceStringArray: Array&lt;String?&gt; = arrayOf(&#13;&#10;BLANK,&#13;&#10;</xsl:text>
        <xsl:for-each select="/template/arrayResource" >
            <xsl:text>        </xsl:text><xsl:value-of select="@prefix" /><xsl:value-of select="@name" /><xsl:text>, //</xsl:text><xsl:value-of select="@index" /><xsl:text>&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    )&#13;&#10;&#13;&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
