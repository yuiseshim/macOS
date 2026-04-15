#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

FORMULAE_FILE="$BASE_DIR/brew_formulae.txt"
CASKS_FILE="$BASE_DIR/brew_casks.txt"

echo '==> Checking Xcode Command Line Tools...'
if ! xcode-select -p >/dev/null 2>&1; then
  echo 'Please run: xcode-select --install'
  exit 1
fi

echo '==> Checking Homebrew...'
if ! command -v brew >/dev/null 2>&1; then
  echo 'Installing Homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Apple Silicon / Intel対応
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo '==> Updating Homebrew...'
brew update

# ------------------------------------------------------------------------------
# install formulae
# ------------------------------------------------------------------------------

echo '==> Installing formulae...'
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
  # 空行・コメントをスキップ
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  if brew list "$pkg" >/dev/null 2>&1; then
    echo "  - already installed: $pkg"
  else
    echo "  - installing: $pkg"
    brew install "$pkg"
  fi
done < "$FORMULAE_FILE"

# ------------------------------------------------------------------------------
# install casks
# ------------------------------------------------------------------------------

echo '==> Installing casks...'
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  if brew list --cask "$pkg" >/dev/null 2>&1; then
    echo "  - already installed: $pkg"
  else
    echo "  - installing: $pkg"
    brew install --cask "$pkg" || {
      echo "  - skipped (failed): $pkg"
    }
  fi
done < "$CASKS_FILE"

echo '==> Cleanup...'
brew cleanup

echo '==> Done.'
