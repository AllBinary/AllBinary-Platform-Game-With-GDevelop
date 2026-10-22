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

<!-- File generation template for Kotlin (made from the Java template that was GDGameAndroidEarlyResourceInitialization.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />


    <xsl:template match="/"><xsl:text>package org.allbinary.game.gd.resource&#13;
&#13;
/*&#13;
 *  Note that errors may occur even though your importing R correctly&#13;
 *  This usually is caused by Duplicate R classes&#13;
 *  Solution is usually to move the R class from the org.allbinary.game.game_name&#13;
 *  package into the independent src directory not part of the multi process apk&#13;
 *  Remark out for independent Activities&#13;
 */&#13;
&#13;
import java.io.InputStream&#13;
import java.lang.Integer&#13;
import org.allbinary.AndroidResources&#13;
&#13;
import org.allbinary.data.resource.ResourceUtil&#13;
import org.allbinary.game.resource.ResourceInitialization&#13;
import org.allbinary.game.gd.resource.GDResources&#13;
import org.allbinary.media.audio.ErrorSound&#13;
import org.allbinary.media.audio.SelectSound&#13;
import org.allbinary.midlet.MidletIcon&#13;
import org.allbinary.util.BasicArrayList&#13;
&#13;
open public class GDGameAndroidEarlyResourceInitialization : ResourceInitialization&#13;
{&#13;
&#13;
    public constructor() : super()&#13;
    {&#13;
    }&#13;
&#13;
    @Throws(Exception::class)&#13;
    override fun init()&#13;
    {&#13;
        super.init()&#13;
&#13;
        val resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!&#13;
&#13;
        val androidResources: AndroidResources = AndroidResources.getInstance()&#13;
&#13;
        //val gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()&#13;
&#13;
        val gdResources: GDResources = GDResources.getInstance()&#13;
&#13;
        //resourceUtil.addResource(gdProjectStrings.GAME, Integer&#13;
                //.valueOf(androidResources.raw.game))&#13;
&#13;
        //val gdProject: GDProject = GDProject()&#13;
&#13;
        //val inputStream: InputStream = resourceUtil.getResourceAsStream(gdProjectStrings.GAME)&#13;
        //val streamUtil: StreamUtil = StreamUtil.getInstance()&#13;
        //val gdGameConfiguration: String = streamUtil.getAsString(inputStream)&#13;
&#13;
        //gdProject.load(gdGameConfiguration)&#13;
&#13;
        resourceUtil.addResource(MidletIcon.RESOURCE, Integer&#13;
                .valueOf(androidResources.drawable.gd_icon))&#13;
&#13;
        resourceUtil.addResource(SelectSound.getInstance()!!.getResource(), Integer&#13;
                .valueOf(androidResources.raw.select))&#13;
&#13;
        resourceUtil.addResource(ErrorSound.getInstance()!!.getResource(), Integer&#13;
                .valueOf(androidResources.raw.error))&#13;
&#13;
        resourceUtil.addResource(gdResources.BLANK, Integer.valueOf(androidResources.raw.blank))&#13;
&#13;
        </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
&#13;
        //resourceUtil.addResource(TestSound.getInstance()!!.getResource(), Integer&#13;
                //.valueOf(androidResources.raw.test))&#13;
&#13;
        //resourceUtil.addResource(ExplosionResources.getInstance().EXPLOSION_60_RESOURCE, Integer&#13;
          //      .valueOf(AndroidResources.raw.explosion_sprite_60_by_60))&#13;
    }&#13;
&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The sounds and resources from the generator -->
    <xsl:template name="resources" >
        <xsl:for-each select="/template/sound" >
            <xsl:text>        resourceUtil.addResource(</xsl:text><xsl:value-of select="@className" /><xsl:text>.getInstance().getResource(), Integer.valueOf(androidResources.raw.</xsl:text><xsl:value-of select="@androidResource" /><xsl:text>))&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="/template/media" >
            <xsl:text>&#13;&#10;</xsl:text><xsl:value-of select="@prefix" /><xsl:text>        resourceUtil.addResource(gdResources.</xsl:text><xsl:value-of select="@name" /><xsl:text>, Integer.valueOf(androidResources.raw.</xsl:text><xsl:value-of select="@androidResource" /><xsl:text>))&#13;&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
