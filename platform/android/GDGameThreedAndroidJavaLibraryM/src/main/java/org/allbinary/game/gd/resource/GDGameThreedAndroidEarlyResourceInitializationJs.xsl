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

<!-- File generation template for JavaScript (made from the Java template that was GDGameThreedAndroidEarlyResourceInitialization.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />


    <xsl:template match="/"><xsl:text>/*&#13;
 *  Note that errors may occur even though your importing R correctly&#13;
 *  This usually is caused by Duplicate R classes&#13;
 *  Solution is usually to move the R class from the org.allbinary.game.game_name&#13;
 *  package into the independent src directory not part of the multi process apk&#13;
 *  Remark out for independent Activities&#13;
 */&#13;
&#13;
import { Integer } from '../../../../../java/lang/Integer.js';&#13;
import { AndroidResources } from '../../../../../org/allbinary/AndroidResources.js';&#13;
&#13;
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;&#13;
import { ResourceInitialization } from '../../../../../org/allbinary/game/resource/ResourceInitialization.js';&#13;
import { GDResources } from '../../../../../org/allbinary/game/gd/resource/GDResources.js';&#13;
&#13;
export class GDGameThreedAndroidEarlyResourceInitialization extends ResourceInitialization&#13;
{&#13;
&#13;
    init()&#13;
    {&#13;
        super.init();&#13;
&#13;
        const resourceUtil = ResourceUtil.getInstance();&#13;
&#13;
        const androidResources = AndroidResources.getInstance();&#13;
&#13;
        const gdResources = GDResources.getInstance();&#13;
&#13;
        //resourceUtil.addResource(gdResources.BLANK, Integer.valueOf(androidResources.raw.blank));&#13;
&#13;
        </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
&#13;
    }&#13;
&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The media resources from the generator -->
    <xsl:template name="resources" >
        <xsl:for-each select="/template/media" >
            <xsl:text>&#13;&#10;</xsl:text><xsl:value-of select="@prefix" /><xsl:text>        resourceUtil.addResource(gdResources.</xsl:text><xsl:value-of select="@name" /><xsl:text>, Integer.valueOf(androidResources.raw.</xsl:text><xsl:value-of select="@androidResource" /><xsl:text>));</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
