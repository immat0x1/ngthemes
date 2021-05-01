  # хуй
  gboard="com.google.android.inputmethod.latin"
  miui=`grep_prop ro.miui.ui.version.name`
  flags=/data/data/$gboard/shared_prefs/flag_value.xml
  etc=/system/etc/gboard_theme

  if [ ! -d /data/data/$gboard ]; then
    abort "- GBoard Not installed!"
  fi
  
  sleep 1
  
  if [ ! -z "$miui" ] && [ -d "$etc" ]; then
    mkdir -p "$MODPATH$etc"
    ui_print ""
    ui_print "- Remove default MIUI theme?"
    ui_print "- Vol+ — Yes | Vol- — No"
    if chooseport 100; then
      ui_print "ro.com.google.ime.theme_file=0" >> $MODPATH/system.prop
      ui_print '- Removed'
    else
      ui_print '- Suck'
    fi
  fi

  if [ -f "$flags" ]; then
    sed -i 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_theme_by_default" value="false"/"use_keyboard_redesign_theme_by_default" value="true"/g' $flags
    sed -i 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $flags
    sed -i 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $flags
  else
    abort "- flag_value.xml: Not found!"
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable themed nav bar style?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"themed_nav_bar_style" value="0"/"themed_nav_bar_style" value="2"/g' $flags
    sed -i 's/"themed_nav_bar_style" value="1"/"themed_nav_bar_style" value="2"/g' $flags
    ui_print "TNAVBARS" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"themed_nav_bar_style" value="2"/"themed_nav_bar_style" value="0"/g' $flags
    ui_print '- Disabled'
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable Google logo on space?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"show_branding_on_space" value="false"/"show_branding_on_space" value="true"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="86400000"/"show_branding_interval_seconds" value="0"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="900"/"branding_fadeout_delay_ms" value="9999999999"/g' $flags
    ui_print "GLOGO" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"show_branding_on_space" value="true"/"show_branding_on_space" value="false"/g' $flags
    sed -i 's/"show_branding_interval_seconds" value="0"/"show_branding_interval_seconds" value="86400000"/g' $flags
    sed -i 's/"branding_fadeout_delay_ms" value="9999999999"/"branding_fadeout_delay_ms" value="900"/g' $flags
    ui_print '- Disabled'
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable higher contrast for white theme?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_higher_contrast" value="false"/"keyboard_redesign_higher_contrast" value="true"/g' $flags
    ui_print "HIGHCONTRAST" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"keyboard_redesign_higher_contrast" value="true"/"keyboard_redesign_higher_contrast" value="false"/g' $flags
    ui_print '- Disabled'
  fi
  
  sleep 1

  ui_print ""
  ui_print "- Keep key padding?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_keep_key_padding" value="false"/"keyboard_redesign_keep_key_padding" value="true"/g' $flags
    ui_print "PADDING" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"keyboard_redesign_keep_key_padding" value="true"/"keyboard_redesign_keep_key_padding" value="false"/g' $flags
    ui_print '- Disabled'
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable key shadows?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_force_key_shadows" value="false"/"keyboard_redesign_force_key_shadows" value="true"/g' $flags
    ui_print "SHADOWS" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"keyboard_redesign_force_key_shadows" value="true"/"keyboard_redesign_force_key_shadows" value="false"/g' $flags
    ui_print '- Disabled'
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable dark commas?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"keyboard_redesign_dark_comma" value="false"/"keyboard_redesign_dark_comma" value="true"/g' $flags
    ui_print "DARKCOMMA" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"keyboard_redesign_dark_comma" value="true"/"keyboard_redesign_dark_comma" value="false"/g' $flags
    ui_print '- Disabled'
  fi
  
  sleep 1
  
  ui_print ""
  ui_print "- Enable screenshot paste in clipboard?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_clipboard_screenshot_paste" value="false"/"enable_clipboard_screenshot_paste" value="true"/g' $flags
    ui_print "CLIPBOARDSCREENSHOT" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"enable_clipboard_screenshot_paste" value="true"/"enable_clipboard_screenshot_paste" value="false"/g' $flags
    ui_print '- Disabled'
  fi
  
  sleep 1
  
  ui_print ""
  ui_print "- Enable key pop-up v2?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_popup_view_v2" value="false"/"enable_popup_view_v2" value="true"/g' $flags
    ui_print "POPUPV2" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"enable_popup_view_v2" value="true"/"enable_popup_view_v2" value="false"/g' $flags
    ui_print '- Disabled'
  fi
  
  sleep 1
  
  ui_print ""
  ui_print "- Enable delete joystick?"
  ui_print "- May not work correctly"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_joystick_delete" value="false"/"enable_joystick_delete" value="true"/g' $flags
    ui_print "DELJOYSTICK" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"enable_joystick_delete" value="true"/"enable_joystick_delete" value="false"/g' $flags
    ui_print '- Disabled'
  fi

  sleep 1
  
  ui_print ""
  ui_print "- Enable email provider completion?"
  ui_print "- May not work correctly"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    sed -i 's/"enable_email_provider_completion" value="false"/"enable_email_provider_completion" value="true"/g' $flags
    ui_print "EMAILPROVIDER" >> $MODPATH/config.ngt
    ui_print '- Enabled'
  else
    sed -i 's/"enable_email_provider_completion" value="true"/"enable_email_provider_completion" value="false"/g' $flags
    ui_print '- Disabled'
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
      ui_print '- Enabled corners (10)'
    else
      sleep 0.5
      ui_print ""
      ui_print "- Vol+ — 20 | Vol- — More"
      if chooseport 100; then
        ui_print "ro.com.google.ime.corner_key_r=20" >> $MODPATH/system.prop
        ui_print '- Enabled corners (20)'
      else
        sleep 0.5
        ui_print ""
        ui_print "- Vol+ — 30 | Vol- — 40"
        if chooseport 100; then
          ui_print "ro.com.google.ime.corner_key_r=30" >> $MODPATH/system.prop
          ui_print '- Enabled corners (30)'
        else
          ui_print "ro.com.google.ime.corner_key_r=40" >> $MODPATH/system.prop
          ui_print '- Enabled corners (40)'
        fi
      fi
    fi
  else
    ui_print '- Disabled'
  fi

  sleep 1

  ui_print ""
  ui_print "- Apply flags every reboot?"
  ui_print "- Vol+ — Yes | Vol- — No"
  if chooseport 100; then
    ui_print '- Enabled'
  else
    rm -rf $MODPATH/service.sh
    ui_print '- Disabled'
  fi
  
  sleep 1
  
  ui_print ""
  am force-stop $gboard