#!/usr/bin/env bash
#
# install.sh — STAGE 0: take a bare macOS machine to a cloned, ready-to-run
# dotfiles repo, then hand off to go.sh (stage 1).
#
# WHY THIS LIVES HERE (in the public `starthere` repo):
#   go.sh lives *inside* the dotfiles repo, and that repo is PRIVATE — so you
#   can't run go.sh until the repo is cloned, and you can't clone a private
#   repo until you have git + GitHub credentials. This script handles exactly
#   that pre-clone gap, so it must live somewhere public:
#
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JaredVogt/starthere/HEAD/install.sh)"
#
#   Override the clone destination with DOTFILES_DIR=/path /bin/bash -c "$(curl ...)"
#
set -euo pipefail
IFS=$'\n\t'

REPO="JaredVogt/dotfiles.v2"
DEST="${DOTFILES_DIR:-$HOME/projects/dotfiles.v2}"

# Official Homebrew install command. Displayed for verification before running
# (see step 2) — confirm it still matches https://brew.sh before approving.
BREW_CMD='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

log() { printf '\033[0;36m==>\033[0m %s\n' "$*"; }

log "Setting up a new Mac — bootstrapping the bare minimum needed to clone."

# 1. Xcode Command Line Tools — provides git and the toolchain Homebrew needs.
#    The installer is a GUI prompt that can't be driven headlessly, so if it's
#    missing we kick it off and ask the user to re-run once it finishes.
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools — accept the GUI prompt, then re-run this script."
  xcode-select --install || true
  exit 1
fi

# 2. Homebrew. Pause and show the exact command first so the user can compare
#    it against the current official command at https://brew.sh before running.
if ! command -v brew >/dev/null 2>&1; then
  echo
  echo "About to install Homebrew with the following command:"
  echo
  echo "  $BREW_CMD"
  echo
  echo "Before continuing, double-check this matches the current official command at:"
  echo "  https://brew.sh"
  echo
  read -r -p "Has the command been verified and good to run? [y/N] " reply </dev/tty
  if [[ "$reply" =~ ^[Yy]$ ]]; then
    log "Installing Homebrew..."
    NONINTERACTIVE=1 eval "$BREW_CMD"
  else
    echo "Aborted. Update install.sh with the current Homebrew command and re-run."
    exit 1
  fi
fi
# Load brew into this shell (Apple Silicon first, then Intel fallback).
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -x /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"

# 3. gh + GitHub auth — the dotfiles repo is private, so the clone needs creds.
if ! command -v gh >/dev/null 2>&1; then
  log "Installing gh..."
  brew install gh
fi
if ! gh auth status >/dev/null 2>&1; then
  log "Authenticating with GitHub (web OAuth)..."
  gh auth login
fi
gh auth setup-git >/dev/null 2>&1 || true

# 4. Clone the dotfiles repo (or refresh it if already present).
if [[ -d "$DEST/.git" ]]; then
  log "$DEST already cloned; pulling latest..."
  git -C "$DEST" pull --ff-only || true
else
  log "Cloning $REPO -> $DEST"
  mkdir -p "$(dirname "$DEST")"
  gh repo clone "$REPO" "$DEST"
fi

# 5. Hand off to go.sh (stage 1). Any args passed to install flow through.
log "Handing off to go.sh"
cd "$DEST"
exec ./go.sh "$@"
