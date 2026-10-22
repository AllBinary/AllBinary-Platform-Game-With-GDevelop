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

<!-- File generation template for Kotlin (made from the Java template that was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>package org.allbinary&#13;
&#13;
import java.lang.Object&#13;
import org.allbinary.game.gd.threed.</xsl:text><xsl:value-of select="$name" /><xsl:text>.R&#13;
&#13;
open public class AndroidResources : Object&#13;
{&#13;
    companion object {&#13;
&#13;
        private val instance: AndroidResources = AndroidResources()&#13;
    &#13;
        /**&#13;
         * @return the instance&#13;
         */&#13;
        fun getInstance(): AndroidResources&#13;
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
    var drawable: R.Companion.drawable = R.Companion.drawable()&#13;
&#13;
    var id: R.Companion.id = R.Companion.id()&#13;
&#13;
    var layout: R.Companion.layout = R.Companion.layout()&#13;
&#13;
    var raw: R.Companion.raw = R.Companion.raw()&#13;
&#13;
    var string: R.Companion.string = R.Companion.string()&#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
