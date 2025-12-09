#!/bin/bash
set -e

APP_NAME="SD-AntiLag"
APP_DIR="$HOME/$APP_NAME"
DESKTOP_DIR="$HOME/Desktop"
LAUNCHER_DIR="$HOME/.local/share/applications"

LAUNCHER_FILE="$LAUNCHER_DIR/sd-antilag.desktop"
DESKTOP_FILE="$DESKTOP_DIR/sd-antilag.desktop"

echo "Uninstalling $APP_NAME..."
echo

if [ -d "$APP_DIR" ]; then
  rm -rf "$APP_DIR"
  echo "Removed application directory: $APP_DIR"
else
  echo "Application directory not found!"
fi

if [ -f "$DESKTOP_FILE" ]; then
  rm "$DESKTOP_FILE"
  echo "Removed desktop shortcut: $DESKTOP_FILE"
else
  echo "Desktop shortcut not found!"
fi

if [ -f "$LAUNCHER_FILE" ]; then
  rm "$LAUNCHER_FILE"
  echo "Removed launcher entry: $LAUNCHER_FILE"
else
  echo "Launcher entry not found!"
fi

echo
echo "$APP_NAME uninstalled successfully!"
