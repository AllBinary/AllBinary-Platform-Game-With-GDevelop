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

<!-- File generation template for Kotlin (made from the Java template that was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>package org.allbinary&#13;
&#13;
import java.lang.Object&#13;
import org.allbinary.game.gd.</xsl:text><xsl:value-of select="$name" /><xsl:text>.R&#13;
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
    open public inner class Rdrawable {&#13;
        val gd_icon: Int = R.drawable.gd_icon&#13;
        val gd_wait_256_by_256: Int = R.drawable.gd_wait_256_by_256&#13;
    }&#13;
&#13;
    var drawable: Rdrawable = Rdrawable()&#13;
&#13;
    open public inner class Rid {&#13;
        val gd: Int = R.id.gd&#13;
        val gd_gl: Int = R.id.gd_gl&#13;
        val ad_area_bottom: Int = R.id.ad_area_bottom&#13;
        val ad_area_left: Int = R.id.ad_area_left&#13;
        val ad_area_right: Int = R.id.ad_area_right&#13;
        val ad_area_top: Int = R.id.ad_area_top&#13;
&#13;
        val custom_web_view: Int = R.id.custom_web_view&#13;
    }&#13;
&#13;
    var id: Rid = Rid()&#13;
&#13;
    open public inner class Rlayout {&#13;
        val gd_ad_overlay_layout: Int = R.layout.gd_ad_overlay_layout&#13;
        val gd_gl_layout: Int = R.layout.gd_gl_layout&#13;
        val gd_layout: Int = R.layout.gd_layout&#13;
&#13;
        val webview_layout: Int = R.layout.webview_layout&#13;
    }&#13;
&#13;
    var layout: Rlayout = Rlayout()&#13;
&#13;
    open public inner class Rraw {&#13;
        val about: Int = R.raw.about&#13;
        val privacy_policy: Int = R.raw.privacy_policy&#13;
&#13;
        val licenseinitdata: Int = R.raw.licenseinitdata&#13;
        val locked_demo_game_feature_64_by_64: Int = R.raw.locked_demo_game_feature_64_by_64&#13;
        val locked_demo_game_feature_128_by_128: Int = R.raw.locked_demo_game_feature_128_by_128&#13;
        val partner: Int = R.raw.partner&#13;
        val select: Int = R.raw.select&#13;
        val error: Int = R.raw.error&#13;
&#13;
        </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
    }&#13;
&#13;
    var raw: Rraw = Rraw()&#13;
&#13;
//    open public inner class Rstring {&#13;
//        val grey_stripe_id: Int = R.string.grey_stripe_id&#13;
//        val minispacewar_vector_options_app_name: Int = R.string.minispacewar_vector_options_app_name&#13;
//        val progressbar_text: Int = R.string.progressbar_text&#13;
//        val vdopia_id: Int = R.string.vdopia_id&#13;
//    }&#13;
//&#13;
//    var string: Rstring = Rstring()&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The resources, sounds and blank resource (when it is not one of the resources) from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#13;&#10;</xsl:text>
        <xsl:for-each select="/template/resource" >
            <xsl:value-of select="@prefix" /><xsl:text>    val </xsl:text><xsl:value-of select="@name" /><xsl:text>: Int = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="/template/sound" >
            <xsl:text>&#13;&#10;</xsl:text><xsl:text>    val </xsl:text><xsl:value-of select="@name" /><xsl:text>: Int = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:if test="/template/blank" >
            <xsl:text>&#13;&#10;val blank: Int = R.raw.blank&#13;&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
