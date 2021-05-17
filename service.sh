  sleep 45
  gboard="com.google.android.inputmethod.latin"
  flags=/data/data/$gboard/shared_prefs/flag_value.xml

  sed -i 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $flags
  sed -i 's/"use_keyboard_redesign_theme_by_default" value="false"/"use_keyboard_redesign_theme_by_default" value="true"/g' $flags
  sed -i 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $flags
  sed -i 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $flags
  sed -i 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $flags
    
  
  if grep TNAVBARS $MODPATH/config.ngt; then
    if ! grep themed_nav_bar_style $flags; then
      # гений мысли отец русского модулестроения
      sed -i "/<map>/a `echo '<long name="themed_nav_bar_style" value="2" />'`" $flags
    else
      sed -i 's/"themed_nav_bar_style" value="0"/"themed_nav_bar_style" value="2"/g' $flags
      sed -i 's/"themed_nav_bar_style" value="1"/"themed_nav_bar_style" value="2"/g' $flags
    fi
  fi

  if grep GLOGO $MODPATH/config.ngt; then
    sed -i 's/"show_branding_on_space" value="false"/"show_branding_on_space" value="true"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="86400000"/"show_branding_interval_seconds" value="0"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="900"/"branding_fadeout_delay_ms" value="9999999999"/g' $flags
  fi

  if grep HIGHCONTRAST $MODPATH/config.ngt; then
    sed -i 's/"keyboard_redesign_higher_contrast" value="false"/"keyboard_redesign_higher_contrast" value="true"/g' $flags
  fi

  if grep PADDING $MODPATH/config.ngt; then
    sed -i 's/"keyboard_redesign_keep_key_padding" value="false"/"keyboard_redesign_keep_key_padding" value="true"/g' $flags
  fi

  if grep SHADOWS $MODPATH/config.ngt; then
    sed -i 's/"keyboard_redesign_force_key_shadows" value="false"/"keyboard_redesign_force_key_shadows" value="true"/g' $flags
  fi

  if grep DARKCOMMA $MODPATH/config.ngt; then
    sed -i 's/"keyboard_redesign_dark_comma" value="false"/"keyboard_redesign_dark_comma" value="true"/g' $flags
  fi

  if grep CLIPBOARDSCREENSHOT $MODPATH/config.ngt; then
    sed -i 's/"enable_clipboard_screenshot_paste" value="false"/"enable_clipboard_screenshot_paste" value="true"/g' $flags
  fi

  if grep POPUPV2 $MODPATH/config.ngt; then
    sed -i 's/"enable_popup_view_v2" value="false"/"enable_popup_view_v2" value="true"/g' $flags
  fi

  if grep DELJOYSTICK $MODPATH/config.ngt; then
    sed -i 's/"enable_joystick_delete" value="false"/"enable_joystick_delete" value="true"/g' $flags
  fi

  if grep EMAILPROVIDER $MODPATH/config.ngt; then
    sed -i 's/"enable_email_provider_completion" value="false"/"enable_email_provider_completion" value="true"/g' $flags
  fi
  
  if grep FORBIDSHADOWS $MODPATH/config.ngt; then
    sed -i 's/"keyboard_redesign_forbid_key_shadows" value="false"/"keyboard_redesign_forbid_key_shadows" value="true"/g' $flags
  fi
  
  if grep PILLSHAPEDKEY $MODPATH/config.ngt; then
    sed -i 's/"pill_shaped_key" value="false"/"pill_shaped_key" value="true"/g' $flags
  fi
  
  if grep SILKTHEME $MODPATH/config.ngt; then
    sed -i 's/"silk_theme" value="false"/"silk_theme" value="true"/g' $flags
  fi

  am force-stop $gboard