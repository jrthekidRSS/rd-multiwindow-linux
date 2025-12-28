#!/bin/bash

# Script inside the Docker runtime

QT_PATH="/usr/local/Qt-6.10.1"

g++ -std=c++17 -o "steam_sniper/package/Rhythm Doctor_Data/Plugins/multiwindow_unity.so" -fPIC -shared multiwindow_unity.cpp `pkg-config xcb glew --libs --cflags` -I"$QT_PATH"/include -L"$QT_PATH/lib" -lQt6Widgets -lQt6Gui -lQt6DBus -lQt6Core -O3 -DKWIN_WAYLAND

MULTIWINDOW_PATH="steam_sniper/package"

mkdir -p "$MULTIWINDOW_PATH"

cp $QT_PATH/lib/lib*.so.6 "$MULTIWINDOW_PATH/"
rm "$MULTIWINDOW_PATH/libQt6Test.so.6"
cp -r $QT_PATH/plugins/platforms "$MULTIWINDOW_PATH/"
cp -r $QT_PATH/plugins/wayland-decoration-client "$MULTIWINDOW_PATH/"
cp -r $QT_PATH/plugins/wayland-shell-integration "$MULTIWINDOW_PATH/"
