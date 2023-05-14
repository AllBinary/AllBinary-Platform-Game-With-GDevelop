package org.allbinary;

import org.allbinary.game.gd.miniasteroids.R;

public class AndroidResources
{
    private static final AndroidResources instance = new AndroidResources();

    /**
     * @return the instance
     */
    public static AndroidResources getInstance()
    {
        return instance;
    }

    public class Rdrawable {
        public final int gd_icon = R.drawable.gd_icon;
        public final int gd_wait_256_by_256 = R.drawable.gd_wait_256_by_256;
    }

    public Rdrawable drawable = new Rdrawable();

    public class Rid {
        public final int gd = R.id.gd;
        public final int gd_gl = R.id.gd_gl;
        public final int ad_area_bottom = R.id.ad_area_bottom;
        public final int ad_area_left = R.id.ad_area_left;
        public final int ad_area_right = R.id.ad_area_right;
        public final int ad_area_top = R.id.ad_area_top;

        public final int custom_web_view = R.id.custom_web_view;
    }

    public Rid id = new Rid();

    public class Rlayout {
        public final int gd_ad_overlay_layout = R.layout.gd_ad_overlay_layout;
        public final int gd_gl_layout = R.layout.gd_gl_layout;
        public final int gd_layout = R.layout.gd_layout;

        public final int webview_layout = R.layout.webview_layout;
    }

    public Rlayout layout = new Rlayout();

    public class Rraw {
        public final int about = R.raw.about;
        public final int privacy_policy = R.raw.privacy_policy;

        public final int test = R.raw.test;
        public final int licenseinitdata = R.raw.licenseinitdata;
        public final int locked_demo_game_feature_64_by_64 = R.raw.locked_demo_game_feature_64_by_64;
        public final int locked_demo_game_feature_128_by_128 = R.raw.locked_demo_game_feature_128_by_128;
        public final int partner = R.raw.partner;
        public final int select = R.raw.select;
        public final int error = R.raw.error;

        //GD
    public final int debrish = R.raw.debrish;
    public final int larg_asteroid_1 = R.raw.larg_asteroid_1;
    public final int larg_asteroid_2 = R.raw.larg_asteroid_2;
    public final int larg_asteroid_3 = R.raw.larg_asteroid_3;
    public final int medium_asteroid_1 = R.raw.medium_asteroid_1;
    public final int medium_asteroid_2 = R.raw.medium_asteroid_2;
    public final int medium_asteroid_3 = R.raw.medium_asteroid_3;
    public final int small_asteroid_1 = R.raw.small_asteroid_1;
    public final int small_asteroid_2 = R.raw.small_asteroid_2;
    public final int small_asteroid_3 = R.raw.small_asteroid_3;
    public final int ship_1 = R.raw.ship_1;
    public final int ship_bullet = R.raw.ship_bullet;
    public final int ship_part_1 = R.raw.ship_part_1;
    public final int ship_part_2 = R.raw.ship_part_2;
    public final int ship_part_3 = R.raw.ship_part_3;
    public final int touch_button_turn_left_arrow_80_by_80 = R.raw.touch_button_turn_left_arrow_80_by_80;
    public final int touch_button_turn_right_arrow_80_by_80 = R.raw.touch_button_turn_right_arrow_80_by_80;
    public final int touch_button_a_action_80_by_80 = R.raw.touch_button_a_action_80_by_80;
    public final int touch_button_b_action_80_by_80 = R.raw.touch_button_b_action_80_by_80;

    public final int explosion = R.raw.explosion;

    public final int laser_shoot = R.raw.laser_shoot;

    public final int thruster = R.raw.thruster;

    public final int thruster_down = R.raw.thruster_down;

    }

    public Rraw raw = new Rraw();

//    public class Rstring {
//        public final int grey_stripe_id = R.string.grey_stripe_id;
//        public final int minispacewar_vector_options_app_name = R.string.minispacewar_vector_options_app_name;
//        public final int progressbar_text = R.string.progressbar_text;
//        public final int vdopia_id = R.string.vdopia_id;
//    }
//
//    public Rstring string = new Rstring();
}

