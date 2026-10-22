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

<!-- File generation template (was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />
    <xsl:param name="GD" />

    <xsl:template match="/"><xsl:text>package org.allbinary;&#13;
&#13;
import org.allbinary.game.gd.threed.</xsl:text><xsl:value-of select="$name" /><xsl:text>.R;&#13;
&#13;
public class AndroidResources&#13;
{&#13;
    private static final AndroidResources instance = new AndroidResources();&#13;
&#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    public static AndroidResources getInstance()&#13;
    {&#13;
        return instance;&#13;
    }&#13;
&#13;
    public class Rdrawable {&#13;
        public final int gd_icon = R.drawable.gd_icon;&#13;
        public final int gd_wait_256_by_256 = R.drawable.gd_wait_256_by_256;&#13;
    }&#13;
&#13;
    public Rdrawable drawable = new Rdrawable();&#13;
&#13;
    public class Rid {&#13;
        public final int gd = R.id.gd;&#13;
        public final int gd_gl = R.id.gd_gl;&#13;
        public final int ad_area_bottom = R.id.ad_area_bottom;&#13;
        public final int ad_area_left = R.id.ad_area_left;&#13;
        public final int ad_area_right = R.id.ad_area_right;&#13;
        public final int ad_area_top = R.id.ad_area_top;&#13;
&#13;
        public final int custom_web_view = R.id.custom_web_view;&#13;
    }&#13;
&#13;
    public Rid id = new Rid();&#13;
&#13;
    public class Rlayout {&#13;
        public final int gd_gl_layout = R.layout.gd_gl_layout;&#13;
        public final int gd_ad_overlay_layout = R.layout.gd_ad_overlay_layout;&#13;
        public final int gd_gl_ad_overlay_layout = R.layout.gd_gl_ad_overlay_layout;&#13;
        public final int gd_min3d_ad_overlay_layout = R.layout.gd_min3d_ad_overlay_layout;&#13;
        public final int gd_min3d_layout = R.layout.gd_min3d_layout;&#13;
        public final int gd_layout = R.layout.gd_layout;&#13;
&#13;
        public final int webview_layout = R.layout.webview_layout;        &#13;
    }&#13;
&#13;
    public Rlayout layout = new Rlayout();&#13;
&#13;
    public class Rraw {&#13;
        public final int about = R.raw.about;&#13;
        public final int privacy_policy = R.raw.privacy_policy;&#13;
&#13;
        public final int licenseinitdata = R.raw.licenseinitdata;&#13;
        public final int locked_demo_game_feature_64_by_64 = R.raw.locked_demo_game_feature_64_by_64;&#13;
        public final int locked_demo_game_feature_128_by_128 = R.raw.locked_demo_game_feature_128_by_128;&#13;
        public final int partner = R.raw.partner;&#13;
        public final int select = R.raw.select;&#13;
        public final int error = R.raw.error;&#13;
        public final int like2_fixed_pipeline_lighting_vertex_shader_glsl = R.raw.like2_fixed_pipeline_lighting_vertex_shader_glsl;&#13;
        public final int like2_fixed_pipeline_lighting_fragment_shader_glsl = R.raw.like2_fixed_pipeline_lighting_fragment_shader_glsl;&#13;
&#13;
        </xsl:text><xsl:value-of select="$GD" /><xsl:text>&#13;
    }&#13;
&#13;
    public Rraw raw = new Rraw();&#13;
&#13;
//    public class Rstring {&#13;
//        public final int grey_stripe_id = R.string.grey_stripe_id;&#13;
//        public final int minispacewar_vector_options_app_name = R.string.minispacewar_vector_options_app_name;&#13;
//        public final int progressbar_text = R.string.progressbar_text;&#13;
//        public final int vdopia_id = R.string.vdopia_id;&#13;
//    }&#13;
//&#13;
//    public Rstring string = new Rstring();&#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
