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

<!-- File generation template for JavaScript (made from the Java template that was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>import { Object } from '../../java/lang/Object.js';&#13;
import { R } from '../../org/allbinary/game/gd/threed/</xsl:text><xsl:value-of select="translate($name, '.', '/')" /><xsl:text>/R.js';&#13;
&#13;
export class AndroidResources extends Object&#13;
{&#13;
    constructor()&#13;
    {&#13;
        super();&#13;
&#13;
        this.drawable = new AndroidResources.Rdrawable();&#13;
&#13;
        this.id = new AndroidResources.Rid();&#13;
&#13;
        this.layout = new AndroidResources.Rlayout();&#13;
&#13;
        this.raw = new AndroidResources.Rraw();&#13;
&#13;
//        this.string = new AndroidResources.Rstring();&#13;
    }&#13;
&#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    static getInstance()&#13;
    {&#13;
        return AndroidResources.instance;&#13;
    }&#13;
}&#13;
&#13;
AndroidResources.Rdrawable = class {&#13;
    constructor()&#13;
    {&#13;
        this.gd_icon = R.drawable.gd_icon;&#13;
        this.gd_wait_256_by_256 = R.drawable.gd_wait_256_by_256;&#13;
    }&#13;
};&#13;
&#13;
AndroidResources.Rid = class {&#13;
    constructor()&#13;
    {&#13;
        this.gd = R.id.gd;&#13;
        this.gd_gl = R.id.gd_gl;&#13;
        this.ad_area_bottom = R.id.ad_area_bottom;&#13;
        this.ad_area_left = R.id.ad_area_left;&#13;
        this.ad_area_right = R.id.ad_area_right;&#13;
        this.ad_area_top = R.id.ad_area_top;&#13;
&#13;
        this.custom_web_view = R.id.custom_web_view;&#13;
    }&#13;
};&#13;
&#13;
AndroidResources.Rlayout = class {&#13;
    constructor()&#13;
    {&#13;
        this.gd_gl_layout = R.layout.gd_gl_layout;&#13;
        this.gd_ad_overlay_layout = R.layout.gd_ad_overlay_layout;&#13;
        this.gd_gl_ad_overlay_layout = R.layout.gd_gl_ad_overlay_layout;&#13;
        this.gd_min3d_ad_overlay_layout = R.layout.gd_min3d_ad_overlay_layout;&#13;
        this.gd_min3d_layout = R.layout.gd_min3d_layout;&#13;
        this.gd_layout = R.layout.gd_layout;&#13;
&#13;
        this.webview_layout = R.layout.webview_layout;&#13;
    }&#13;
};&#13;
&#13;
AndroidResources.Rraw = class {&#13;
    constructor()&#13;
    {&#13;
        this.about = R.raw.about;&#13;
        this.privacy_policy = R.raw.privacy_policy;&#13;
&#13;
        this.licenseinitdata = R.raw.licenseinitdata;&#13;
        this.locked_demo_game_feature_64_by_64 = R.raw.locked_demo_game_feature_64_by_64;&#13;
        this.locked_demo_game_feature_128_by_128 = R.raw.locked_demo_game_feature_128_by_128;&#13;
        this.partner = R.raw.partner;&#13;
        this.select = R.raw.select;&#13;
        this.error = R.raw.error;&#13;
        this.like2_fixed_pipeline_lighting_vertex_shader_glsl = R.raw.like2_fixed_pipeline_lighting_vertex_shader_glsl;&#13;
        this.like2_fixed_pipeline_lighting_fragment_shader_glsl = R.raw.like2_fixed_pipeline_lighting_fragment_shader_glsl;&#13;
&#13;
        </xsl:text><xsl:call-template name="resources" /><xsl:text>&#13;
    }&#13;
};&#13;
&#13;
//AndroidResources.Rstring = class {&#13;
//    constructor()&#13;
//    {&#13;
//        this.grey_stripe_id = R.string.grey_stripe_id;&#13;
//        this.minispacewar_vector_options_app_name = R.string.minispacewar_vector_options_app_name;&#13;
//        this.progressbar_text = R.string.progressbar_text;&#13;
//        this.vdopia_id = R.string.vdopia_id;&#13;
//    }&#13;
//};&#13;
&#13;
AndroidResources.instance = new AndroidResources();&#13;
</xsl:text></xsl:template>

    <!-- The resources, sounds and blank resource (when it is not one of the resources) from the generator -->
    <xsl:template name="resources" >
        <xsl:text>//GD&#13;&#10;</xsl:text>
        <xsl:for-each select="/template/resource" >
            <xsl:value-of select="@prefix" /><xsl:text>        this.</xsl:text><xsl:value-of select="@name" /><xsl:text> = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>;&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="/template/sound" >
            <xsl:text>&#13;&#10;</xsl:text><xsl:text>        this.</xsl:text><xsl:value-of select="@name" /><xsl:text> = R.raw.</xsl:text><xsl:value-of select="@name" /><xsl:text>;&#13;&#10;</xsl:text>
        </xsl:for-each>
        <xsl:if test="/template/blank" >
            <xsl:text>&#13;&#10;this.blank = R.raw.blank;&#13;&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
