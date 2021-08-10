  #######################
  # INSTALLATION SCRIPT #
  #######################
  
  source $MODPATH/config.txt && sed -i '/   /d' $MODPATH/config.txt && sed -i '/#/d' $MODPATH/config.txt
  gboard="com.google.android.inputmethod.latin"
  miui=`grep_prop ro.miui.ui.version.name`
  flags=/data/data/$gboard/shared_prefs/flag_value.xml
  etc=/system/etc/gboard_theme

  if [ ! -d "/data/data/$gboard" ]; then
    abort "- gboard: not installed"
  fi

  if [ ! -f "$flags" ]; then
    abort "- flag_value.xml: not found"
  fi

  if [ $REMOVE_MIUI_THEME = "1" ] && [ ! -z "$miui" ] && [ -d "$etc" ]; then
    echo "ro.com.google.ime.theme_file=0" >> $MODPATH/system.prop
  fi

  if [ $OLD_REDESIGN_THEMES = "1" ]; then
    sed -i 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_theme_by_default" value="false"/"use_keyboard_redesign_theme_by_default" value="true"/g' $flags
    sed -i 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $flags
  else
    sed -i 's/"enable_keyboard_redesign" value="true"/"enable_keyboard_redesign" value="false"/g' $flags
    sed -i 's/"use_keyboard_redesign_theme_by_default" value="true"/"use_keyboard_redesign_theme_by_default" value="false"/g' $flags
    sed -i 's/"enable_keyboard_redesign_theme" value="true"/"enable_keyboard_redesign_theme" value="false"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme" value="true"/"use_keyboard_redesign_on_existing_theme" value="false"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/g' $flags
  fi
  
  if [ $THEMED_NAVBAR_STYLE = "1" ]; then
    if ! grep -q themed_nav_bar_style $flags; then
      sed -i "/<map>/a `echo '<long name="themed_nav_bar_style" value="2" />'`" $flags
    else
      sed -i 's/"themed_nav_bar_style" value="0"/"themed_nav_bar_style" value="2"/g' $flags
      sed -i 's/"themed_nav_bar_style" value="1"/"themed_nav_bar_style" value="2"/g' $flags
    fi
  else
    sed -i 's/"themed_nav_bar_style" value="2"/"themed_nav_bar_style" value="0"/g' $flags
  fi

  if [ $GOOGLE_LOGO_ON_SPACE = "1" ]; then
    sed -i 's/"show_branding_on_space" value="false"/"show_branding_on_space" value="true"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="86400000"/"show_branding_interval_seconds" value="0"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="900"/"branding_fadeout_delay_ms" value="9999999999"/g' $flags
  else
    sed -i 's/"show_branding_on_space" value="true"/"show_branding_on_space" value="false"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="0"/"show_branding_interval_seconds" value="86400000"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="9999999999"/"branding_fadeout_delay_ms" value="900"/g' $flags
  fi

  if [ $HIGH_CONTRAST_FOR_WHITE_THEME = "1" ]; then
    sed -i 's/"keyboard_redesign_higher_contrast" value="false"/"keyboard_redesign_higher_contrast" value="true"/g' $flags
  else
    sed -i 's/"keyboard_redesign_higher_contrast" value="true"/"keyboard_redesign_higher_contrast" value="false"/g' $flags
  fi

  if [ $KEEP_KEY_PADDING = "1" ]; then
    sed -i 's/"keyboard_redesign_keep_key_padding" value="false"/"keyboard_redesign_keep_key_padding" value="true"/g' $flags
  else
    sed -i 's/"keyboard_redesign_keep_key_padding" value="true"/"keyboard_redesign_keep_key_padding" value="false"/g' $flags
  fi

  if [ $FORCE_KEY_SHADOWS = "1" ]; then
    sed -i 's/"keyboard_redesign_force_key_shadows" value="false"/"keyboard_redesign_force_key_shadows" value="true"/g' $flags
  else
    sed -i 's/"keyboard_redesign_force_key_shadows" value="true"/"keyboard_redesign_force_key_shadows" value="false"/g' $flags
  fi

  if [ $DARKCOMMA = "1" ]; then
    sed -i 's/"keyboard_redesign_dark_comma" value="false"/"keyboard_redesign_dark_comma" value="true"/g' $flags
  else
    sed -i 's/"keyboard_redesign_dark_comma" value="true"/"keyboard_redesign_dark_comma" value="false"/g' $flags
  fi

  if [ $POPUP_V2 = "1" ]; then
    sed -i 's/"enable_popup_view_v2" value="false"/"enable_popup_view_v2" value="true"/g' $flags
  else
    sed -i 's/"enable_popup_view_v2" value="true"/"enable_popup_view_v2" value="false"/g' $flags
  fi

  if [ $DELJOYSTICK = "1" ]; then
    sed -i 's/"enable_joystick_delete" value="false"/"enable_joystick_delete" value="true"/g' $flags
  else
    sed -i 's/"enable_joystick_delete" value="true"/"enable_joystick_delete" value="false"/g' $flags
  fi

  if [ $EMAILPROVIDER = "1" ]; then
    sed -i 's/"enable_email_provider_completion" value="false"/"enable_email_provider_completion" value="true"/g' $flags
  else
    sed -i 's/"enable_email_provider_completion" value="true"/"enable_email_provider_completion" value="false"/g' $flags
  fi
  
  if [ $FORBID_SHADOWS = "1" ]; then
    sed -i 's/"keyboard_redesign_forbid_key_shadows" value="false"/"keyboard_redesign_forbid_key_shadows" value="true"/g' $flags
  else
    sed -i 's/"keyboard_redesign_forbid_key_shadows" value="true"/"keyboard_redesign_forbid_key_shadows" value="false"/g' $flags
  fi
  
  if [ $SILK_THEME = "1" ]; then
    sed -i 's/"silk_theme" value="false"/"silk_theme" value="true"/g' $flags
    sed -i 's/"silk_on_all_pixel" value="false"/"silk_on_all_pixel" value="true"/g' $flags
    sed -i 's/"use_silk_theme_by_default" value="false"/"use_silk_theme_by_default" value="true"/g' $flags
  else
    sed -i 's/"silk_theme" value="true"/"silk_theme" value="false"/g' $flags
    sed -i 's/"silk_on_all_pixel" value="true"/"silk_on_all_pixel" value="false"/g' $flags
    sed -i 's/"use_silk_theme_by_default" value="true"/"use_silk_theme_by_default" value="false"/g' $flags
  fi
  
  if [ $SILK_POPUP_AND_MODAL_BACKDROP = "1" ]; then
    sed -i 's/"silk_popup" value="false"/"silk_popup" value="true"/g' $flags
    sed -i 's/"silk_popup_modal_backdrop" value="false"/"silk_popup_modal_backdrop" value="true"/g' $flags
  else
    sed -i 's/"silk_popup" value="true"/"silk_popup" value="false"/g' $flags
    sed -i 's/"silk_popup_modal_backdrop" value="true"/"silk_popup_modal_backdrop" value="false"/g' $flags
  fi

  if [ $PILL_SHAPED_KEYS = "1" ]; then
    sed -i 's/"pill_shaped_key" value="false"/"pill_shaped_key" value="true"/g' $flags
  else
    sed -i 's/"pill_shaped_key" value="true"/"pill_shaped_key" value="false"/g' $flags
  fi

  if [ $MATERIAL3_THEMES = "1" ]; then
    sed -i 's/"material3_theme" value="false"/"material3_theme" value="true"/g' $flags
  else
    sed -i 's/"material3_theme" value="true"/"material3_theme" value="false"/g' $flags
  fi

  if [ $MATERIAL_YOU_REDESIGN = "1" ]; then
    sed -i 's/"gm3_dynamic_colors" value="false"/"gm3_dynamic_colors" value="true"/g' $flags
    sed -i 's/"theme_listing_m3" value="false"/"theme_listing_m3" value="true"/g' $flags
    sed -i 's/"gm3_collapsing_toolbar" value="false"/"gm3_collapsing_toolbar" value="true"/g' $flags
  else
    sed -i 's/"gm3_dynamic_colors" value="true"/"gm3_dynamic_colors" value="false"/g' $flags
    sed -i 's/"theme_listing_m3" value="true"/"theme_listing_m3" value="false"/g' $flags
    sed -i 's/"gm3_collapsing_toolbar" value="true"/"gm3_collapsing_toolbar" value="false"/g' $flags
  fi
  
  if [ ! "$corner_key_radius" = "0" ]; then
    echo "ro.com.google.ime.corner_key_r=$corner_key_radius" >> $MODPATH/system.prop
  elif [ "$corner_key_radius" = "0" ]; then
    echo "ro.com.google.ime.corner_key_r=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_landscape_bottom" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_b=$keyboard_padding_landscape_bottom" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_landscape_bottom" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_b=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_landscape_left" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_l=$keyboard_padding_landscape_left" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_landscape_left" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_l=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_landscape_right" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_r=$keyboard_padding_landscape_right" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_landscape_right" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_land_r=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_portrait_bottom" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_b=$keyboard_padding_portrait_bottom" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_portrait_bottom" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_b=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_portrait_left" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_l=$keyboard_padding_portrait_left" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_portrait_left" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_l=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_padding_portrait_right" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_r=$keyboard_padding_portrait_right" >> $MODPATH/system.prop
  elif [ "$keyboard_padding_portrait_right" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_r=false" >> $MODPATH/system.prop
  fi

  if [ ! "$keyboard_height_ratio" = "0" ]; then
    echo "ro.com.google.ime.height_ratio=$keyboard_height_ratio" >> $MODPATH/system.prop
  elif [ "$keyboard_height_ratio" = "0" ]; then
    echo "ro.com.google.ime.kb_pad_port_r=false" >> $MODPATH/system.prop
  fi