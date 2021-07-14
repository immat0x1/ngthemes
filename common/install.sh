  gboard="com.google.android.inputmethod.latin"
  miui=`grep_prop ro.miui.ui.version.name`
  flags=/data/data/$gboard/shared_prefs/flag_value.xml
  etc=/system/etc/gboard_theme

  if [ ! -d /data/data/$gboard ]; then
    abort "- GBoard Not installed!"
  fi
  
  sleep 1
  
  if [ ! -z "$miui" ] && [ -d "$etc" ]; then
    ui_print ""
    ui_print "- Remove default MIUI theme?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      ui_print "ro.com.google.ime.theme_file=0" >> $MODPATH/system.prop
      ui_print "- Removed"
    else
      ui_print "- Not the best choice"
    fi
  fi

  if [ -f "$flags" ]; then
    sed -i 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_theme_by_default" value="false"/"use_keyboard_redesign_theme_by_default" value="true"/g' $flags
    sed -i 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $flags
  else
    ui_print ""
    abort "- flag_value.xml: Not found"
  fi


if [ $USE_CONFIG = "1" ]; then
  
  ui_print "- Enabling flags using config"
  sleep 1
  ui_print ""
  
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

else

  ui_print ""
  ui_print "- Enable themed nav bar style?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    if ! grep -q themed_nav_bar_style $flags; then
      sed -i "/<map>/a `echo '<long name="themed_nav_bar_style" value="2" />'`" $flags
    else
      sed -i 's/"themed_nav_bar_style" value="0"/"themed_nav_bar_style" value="2"/g' $flags
      sed -i 's/"themed_nav_bar_style" value="1"/"themed_nav_bar_style" value="2"/g' $flags
    fi
    ui_print "THEMED_NAVBAR_STYLE" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"themed_nav_bar_style" value="2"/"themed_nav_bar_style" value="0"/g' $flags
    ui_print "- Disabled"
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable Google logo on space?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"show_branding_on_space" value="false"/"show_branding_on_space" value="true"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="86400000"/"show_branding_interval_seconds" value="0"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="900"/"branding_fadeout_delay_ms" value="9999999999"/g' $flags
    ui_print "GOOGLE_LOGO_ON_SPACE" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"show_branding_on_space" value="true"/"show_branding_on_space" value="false"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="0"/"show_branding_interval_seconds" value="86400000"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="9999999999"/"branding_fadeout_delay_ms" value="900"/g' $flags
    ui_print "- Disabled"
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable higher contrast for white theme?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_higher_contrast" value="false"/"keyboard_redesign_higher_contrast" value="true"/g' $flags
    ui_print "HIGH_CONTRAST_FOR_WHITE_THEME" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"keyboard_redesign_higher_contrast" value="true"/"keyboard_redesign_higher_contrast" value="false"/g' $flags
    ui_print "- Disabled"
  fi
  
  sleep 1

  ui_print ""
  ui_print "- Keep key padding?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_keep_key_padding" value="false"/"keyboard_redesign_keep_key_padding" value="true"/g' $flags
    ui_print "KEEP_KEY_PADDING" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"keyboard_redesign_keep_key_padding" value="true"/"keyboard_redesign_keep_key_padding" value="false"/g' $flags
    ui_print "- Disabled"
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable key shadows for all themes?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_force_key_shadows" value="false"/"keyboard_redesign_force_key_shadows" value="true"/g' $flags
    ui_print "SHADOWS" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    ui_print "- Disabled"
    sleep 1
    ui_print ""
    ui_print "- Disable key shadows for all themes?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      sed -i 's/"keyboard_redesign_forbid_key_shadows" value="false"/"keyboard_redesign_forbid_key_shadows" value="true"/g' $flags
      ui_print "FORBID_SHADOWS" >> $MODPATH/config.ngt
      ui_print "- Enabled"
    else
      sed -i 's/"keyboard_redesign_forbid_key_shadows" value="true"/"keyboard_redesign_forbid_key_shadows" value="false"/g' $flags
      ui_print "- Disabled"
    fi
    sed -i 's/"keyboard_redesign_force_key_shadows" value="true"/"keyboard_redesign_force_key_shadows" value="false"/g' $flags
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable dark commas?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_dark_comma" value="false"/"keyboard_redesign_dark_comma" value="true"/g' $flags
    ui_print "DARKCOMMA" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"keyboard_redesign_dark_comma" value="true"/"keyboard_redesign_dark_comma" value="false"/g' $flags
    ui_print "- Disabled"
  fi
  
  sleep 1
  
  ui_print ""
  ui_print "- Enable key pop-up v2?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_popup_view_v2" value="false"/"enable_popup_view_v2" value="true"/g' $flags
    ui_print "POPUP_V2" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"enable_popup_view_v2" value="true"/"enable_popup_view_v2" value="false"/g' $flags
    ui_print "- Disabled"
  fi
  
  sleep 1
  
  ui_print ""
  ui_print "- Enable email provider completion?"
  ui_print "- May not work correctly"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_email_provider_completion" value="false"/"enable_email_provider_completion" value="true"/g' $flags
    ui_print "EMAILPROVIDER" >> $MODPATH/config.ngt
    ui_print "- Enabled"
  else
    sed -i 's/"enable_email_provider_completion" value="true"/"enable_email_provider_completion" value="false"/g' $flags
    ui_print "- Disabled"
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Round corners?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sleep 0.5
    ui_print ""
    ui_print "- How much?"
    ui_print "- Vol+ — 10 | Vol- — More"
    if chooseport 100; then
      ui_print "ro.com.google.ime.corner_key_r=10" >> $MODPATH/system.prop
      ui_print "- Enabled corners (10)"
    else
      sleep 0.5
      ui_print ""
      ui_print "- Vol+ — 20 | Vol- — More"
      if chooseport 100; then
        ui_print "ro.com.google.ime.corner_key_r=20" >> $MODPATH/system.prop
        ui_print "- Enabled corners (20)"
      else
        sleep 0.5
        ui_print ""
        ui_print "- Vol+ — 30 | Vol- — 40"
        if chooseport 100; then
          ui_print "ro.com.google.ime.corner_key_r=30" >> $MODPATH/system.prop
          ui_print "- Enabled corners (30)"
        else
          ui_print "ro.com.google.ime.corner_key_r=40" >> $MODPATH/system.prop
          ui_print "- Enabled corners (40)"
        fi
      fi
    fi
  else
    ui_print "- Disabled"
    sleep 1
    ui_print ""
    ui_print "- Enable pill shaped keys?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      sed -i 's/"pill_shaped_key" value="false"/"pill_shaped_key" value="true"/g' $flags
      ui_print "ro.com.google.ime.corner_key_r=false" >> $MODPATH/system.prop
      ui_print "PILLSHAPEDKEY" >> $MODPATH/config.ngt
      ui_print "- Enabled"
    else
      sed -i 's/"pill_shaped_key" value="true"/"pill_shaped_key" value="false"/g' $flags
      ui_print "- Disabled"
    fi
  fi

  if [ "`getprop ro.build.version.codename`" = "S" ]; then
    sleep 1
    ui_print ""
    ui_print "- Enable silk theme?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      sed -i 's/"silk_theme" value="false"/"silk_theme" value="true"/g' $flags
      sed -i 's/"silk_on_all_pixel" value="false"/"silk_on_all_pixel" value="true"/g' $flags
      sed -i 's/"use_silk_theme_by_default" value="false"/"use_silk_theme_by_default" value="true"/g' $flags
      ui_print "SILK_THEME" >> $MODPATH/config.ngt
      ui_print "- Enabled"
    else
      sed -i 's/"silk_theme" value="true"/"silk_theme" value="false"/g' $flags
      sed -i 's/"silk_on_all_pixel" value="true"/"silk_on_all_pixel" value="false"/g' $flags
      sed -i 's/"use_silk_theme_by_default" value="true"/"use_silk_theme_by_default" value="false"/g' $flags
      ui_print "- Disabled"
    fi
    
    sleep 1
    
    ui_print ""
    ui_print "- Enable silk pop-up?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      sed -i 's/"silk_popup" value="false"/"silk_popup" value="true"/g' $flags
      sed -i 's/"silk_popup_modal_backdrop" value="false"/"silk_popup_modal_backdrop" value="true"/g' $flags
      ui_print "SILK_POPUP_AND_BACKDROP" >> $MODPATH/config.ngt
      ui_print "- Enabled"
    else
      sed -i 's/"silk_popup" value="true"/"silk_popup" value="false"/g' $flags
      sed -i 's/"silk_popup_modal_backdrop" value="true"/"silk_popup_modal_backdrop" value="false"/g' $flags
      ui_print "- Disabled"
    fi
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Apply flags every reboot?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    ui_print "- Enabled"
  else
    rm -rf $MODPATH/service.sh
    ui_print "- Disabled"
  fi
  
  sleep 1
  
  ui_print ""
  
fi

  am force-stop $gboard