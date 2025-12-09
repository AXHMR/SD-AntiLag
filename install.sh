#!/bin/bash
set -e

APP_NAME="SD-AntiLag"
BINARY_NAME="SD-AntiLag"
ICON_NAME="sd-antilag.svg"
UNINSTALL_NAME="uninstall.sh"

REPO_OWNER="AXHMR"
REPO_NAME="SD-AntiLag"
TAG="v1.0.0"

RELEASE_BASE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$TAG"

APP_DIR="$HOME/$APP_NAME"
DESKTOP_DIR="$HOME/Desktop"
LAUNCHER_DIR="$HOME/.local/share/applications"

LAUNCHER_FILE="$LAUNCHER_DIR/sd-antilag.desktop"
DESKTOP_FILE="$DESKTOP_DIR/sd-antilag.desktop"

echo "Installing $APP_NAME..."
echo

mkdir -p "$APP_DIR"

echo "Downloading application..."
curl -fL "$RELEASE_BASE_URL/$BINARY_NAME" -o "$APP_DIR/$BINARY_NAME"
chmod +x "$APP_DIR/$BINARY_NAME"

ICON_PATH="$APP_DIR/$ICON_NAME"
if curl -fL "$RELEASE_BASE_URL/$ICON_NAME" -o "$ICON_PATH"; then
  :
else
  echo "Icon download failed, using generic icon."
  ICON_PATH="drive-harddisk"
fi

UNINSTALL_PATH="$APP_DIR/$UNINSTALL_NAME"
echo "Downloading uninstall script..."
curl -fL "$RELEASE_BASE_URL/$UNINSTALL_NAME" -o "$UNINSTALL_PATH"
chmod +x "$UNINSTALL_PATH"

mkdir -p "$DESKTOP_DIR"
mkdir -p "$LAUNCHER_DIR"

cat > "$LAUNCHER_FILE" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=SD-AntiLag
Comment=Reduce SD card stutter on SteamOS
Exec=$APP_DIR/$BINARY_NAME
Icon=$ICON_PATH
Terminal=false
Categories=Utility;System;
StartupNotify=false
EOF

chmod +x "$LAUNCHER_FILE"
cp "$LAUNCHER_FILE" "$DESKTOP_FILE"
chmod +x "$DESKTOP_FILE"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$LAUNCHER_DIR" || true
fi

echo
echo "$APP_NAME installed successfully!"
echo "App installed to: $APP_DIR/$BINARY_NAME"
echo "Desktop shortcut created"
echo "Uninstall script available at: $APP_DIR/$UNINSTALL_NAME"
