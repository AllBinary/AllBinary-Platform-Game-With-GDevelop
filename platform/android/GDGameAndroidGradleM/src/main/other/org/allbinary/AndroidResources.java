package org.allbinary;

import org.allbinary.game.gd.R;

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
    }

    public Rid id = new Rid();

    public class Rlayout {
        public final int gd_ad_overlay_layout = R.layout.gd_ad_overlay_layout;
        public final int gd_gl_layout = R.layout.gd_gl_layout;
        public final int gd_layout = R.layout.gd_layout;
    }

    public Rlayout layout = new Rlayout();

    public class Rraw {
        public final int begin = R.raw.begin;
        public final int error = R.raw.error;
        public final int explosion = R.raw.explosion;
        public final int test = R.raw.test;
        public final int licenseinitdata = R.raw.licenseinitdata;
        public final int locked_demo_game_feature_64_by_64 = R.raw.locked_demo_game_feature_64_by_64;
        public final int locked_demo_game_feature_128_by_128 = R.raw.locked_demo_game_feature_128_by_128;
        public final int ouya_a = R.raw.ouya_a;
        //public final int ouya_key = R.raw.ouya_key;
        public final int ouya_o = R.raw.ouya_o;
        public final int ouya_u = R.raw.ouya_u;
        public final int ouya_y = R.raw.ouya_y;
        public final int partner = R.raw.partner;
        public final int select = R.raw.select;
        public final int touch_button_64_by_64 = R.raw.touch_button_64_by_64;
        public final int touch_button_128_by_128 = R.raw.touch_button_128_by_128;
        public final int touch_button_down_arrow_64_by_64 = R.raw.touch_button_down_arrow_64_by_64;
        public final int touch_button_down_arrow_128_by_128 = R.raw.touch_button_down_arrow_128_by_128;
        public final int touch_button_generic_action_64_by_64 = R.raw.touch_button_generic_action_64_by_64;
        public final int touch_button_generic_action_128_by_128 = R.raw.touch_button_generic_action_128_by_128;
        public final int touch_button_start_64_by_64 = R.raw.touch_button_start_64_by_64;
        public final int touch_button_start_128_by_128 = R.raw.touch_button_start_128_by_128;
        public final int touch_button_strafe_left_arrow_64_by_64 = R.raw.touch_button_strafe_left_arrow_64_by_64;
        public final int touch_button_strafe_left_arrow_128_by_128 = R.raw.touch_button_strafe_left_arrow_128_by_128;
        public final int touch_button_strafe_right_arrow_64_by_64 = R.raw.touch_button_strafe_right_arrow_64_by_64;
        public final int touch_button_strafe_right_arrow_128_by_128 = R.raw.touch_button_strafe_right_arrow_128_by_128;
        public final int touch_button_turn_left_arrow_64_by_64 = R.raw.touch_button_turn_left_arrow_64_by_64;
        public final int touch_button_turn_left_arrow_128_by_128 = R.raw.touch_button_turn_left_arrow_128_by_128;
        public final int touch_button_turn_right_arrow_64_by_64 = R.raw.touch_button_turn_right_arrow_64_by_64;
        public final int touch_button_turn_right_arrow_128_by_128 = R.raw.touch_button_turn_right_arrow_128_by_128;
        public final int touch_button_up_arrow_64_by_64 = R.raw.touch_button_up_arrow_64_by_64;
        public final int touch_button_up_arrow_128_by_128 = R.raw.touch_button_up_arrow_128_by_128;
        public final int youlose = R.raw.youlose;
        public final int youwin = R.raw.youwin;
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
