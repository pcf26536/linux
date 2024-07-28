# Firefox support opting into Wayland mode via an environment variable
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

# allows Qt to use the xcb (X11) plugin instead if Wayland is not available
export QT_QPA_PLATFORM="wayland;xcb"

# Matching window decoration for Qt apps on GNOME Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORMTHEME='qt5ct' #other options [gnome, qt6ct]
   # Don't use QT_QPA_PLATFORMTHEME in combination with QT_STYLE_OVERRIDE
   # export QT_STYLE_OVERRIDE=kvantum
fi

# To run a Clutter application on Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export CLUTTER_BACKEND=wayland
fi

# To run an SDL2 application on Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export SDL_VIDEODRIVER=wayland
fi

# fix misbehavior where java application starts with a blank screen on wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export _JAVA_AWT_WM_NONREPARENTING="1"
fi

# Using KDE file picker (kdialog) as default
#export GTK_USE_PORTAL=1
