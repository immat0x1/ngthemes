  # 0 - Disable
  # 1 - Enable

  USE_CONFIG=0
  
  # a11 and lower
  THEMED_NAVBAR_STYLE=0
  GOOGLE_LOGO_ON_SPACE=0
  HIGH_CONTRAST_FOR_WHITE_THEME=0
  KEEP_KEY_PADDING=0
  FORCE_KEY_SHADOWS=0
  FORBID_SHADOWS=0
  DARKCOMMA=0
  POPUP_V2=0
  DELJOYSTICK=0
  EMAILPROVIDER=0
  
  # a12 only
  SILK_THEME=0
  SILK_POPUP=0

  SKIPUNZIP=1
  unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
  . $TMPDIR/functions.sh