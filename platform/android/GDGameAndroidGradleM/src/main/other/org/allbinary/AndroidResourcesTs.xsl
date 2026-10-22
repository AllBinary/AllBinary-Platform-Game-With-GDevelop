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

<!-- File generation template for TypeScript (made from the Java template that was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>import { Object } from '../../java/lang/Object.js';&#13;
import { R } from '../../org/allbinary/game/gd/</xsl:text><xsl:value-of select="translate($name, '.', '/')" /><xsl:text>/R.js';&#13;
&#13;
export class AndroidResources extends Object&#13;
{&#13;
    static Rdrawable = class {&#13;
        public readonly gd_icon: number = R.drawable.gd_icon;&#13;
        public readonly gd_wait_256_by_256: number = R.drawable.gd_wait_256_by_256;&#13;
    };&#13;
&#13;
    public drawable = new AndroidResources.Rdrawable();&#13;
&#13;
    static Rid = class {&#13;
        public readonly gd: number = R.id.gd;&#13;
        public readonly gd_gl: number = R.id.gd_gl;&#13;
        public readonly ad_area_bottom: number = R.id.ad_area_bottom;&#13;
        public readonly ad_area_left: number = R.id.ad_area_left;&#13;
        public readonly ad_area_right: number = R.id.ad_area_right;&#13;
        public readonly ad_area_top: number = R.id.ad_area_top;&#13;
&#13;
        public readonly custom_web_view: number = R.id.custom_web_view;&#13;
    };&#13;
&#13;
    public id = new AndroidResources.Rid();&#13;
&#13;
    static Rlayout = class {&#13;
        public readonly gd_ad_overlay_layout: number = R.layout.gd_ad_overlay_layout;&#13;
        public readonly gd_gl_layout: number = R.layout.gd_gl_layout;&#13;
        public readonly gd_layout: number = R.layout.gd_layout;&#13;
&#13;
        public readonly webview_layout: number = R.layout.webview_layout;&#13;
    };&#13;
&#13;
    public layout = new AndroidResources.Rlayout();&#13;
&#13;
    static Rraw = class {&#13;
        public readonly about: number = R.raw.about;&#13;
        public readonly privacy_policy: number = R.raw.privacy_policy;&#13;
&#13;
        public readonly licenseinitdata: number = R.raw.licenseinitdata;&#13;
        public readonly locked_demo_game_feature_64_by_64: number = R.raw.locked_demo_game_feature_64_by_64;&#13;
        public readonly locked_demo_game_feature_128_by_128: number = R.raw.locked_demo_game_feature_128_by_128;&#13;
        public readonly partner: number = R.raw.partner;&#13;
        public readonly select: number = R.raw.select;&#13;
        public readonly error: number = R.raw.error;&#13;
&#13;
        </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
    };&#13;
&#13;
    public raw = new AndroidResources.Rraw();&#13;
&#13;
//    static Rstring = class {&#13;
//        public readonly grey_stripe_id: number = R.string.grey_stripe_id;&#13;
//        public readonly minispacewar_vector_options_app_name: number = R.string.minispacewar_vector_options_app_name;&#13;
//        public readonly progressbar_text: number = R.string.progressbar_text;&#13;
//        public readonly vdopia_id: number = R.string.vdopia_id;&#13;
//    };&#13;
//&#13;
//    public string = new AndroidResources.Rstring();&#13;
&#13;
    private static readonly instance: AndroidResources = new AndroidResources();&#13;
&#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    public static getInstance(): AndroidResources&#13;
    {&#13;
        return AndroidResources.instance;&#13;
    }&#13;
}&#13;
</xsl:text></xsl:template>

    <!-- The resources, sounds and blank resource (when it is not one of the resources) from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#13;&#10;</xsl:text>
        <xsl:for-each select="/template/resource" >
            <xsl:value-of select="@prefix" /><xsl:text>        public readonly </xsl:text><xsl:value-of select="@name" /><xsl:text>: number = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>;&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="/template/sound" >
            <xsl:text>&#13;&#10;</xsl:text><xsl:text>        public readonly </xsl:text><xsl:value-of select="@name" /><xsl:text>: number = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>;&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:if test="/template/blank" >
            <xsl:text>&#13;&#10;public readonly blank: number = R.raw.blank;&#13;&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
