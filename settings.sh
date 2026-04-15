#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------------------
# Screenshot settings
# - Change default save location
# ------------------------------------------------------------------------------

SCREENSHOT_DIR="$HOME/ScreenShots"

echo "==> Setting screenshot location: $SCREENSHOT_DIR"

# Create directory if not exists
mkdir -p "$SCREENSHOT_DIR"

# Update macOS setting
defaults write com.apple.screencapture location "$SCREENSHOT_DIR"

# Apply changes
killall SystemUIServer 2>/dev/null || true

echo "==> Done."
