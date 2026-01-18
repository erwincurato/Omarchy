#!/usr/bin/env bash
set -e

# 1. Backup location outside repo
BACKUP_ROOT="$HOME/Projects/omarchy-backups"
mkdir -p "$BACKUP_ROOT"  # ensure folder exists

# timestamp for backup
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"

# 2. Install Omarchy
echo "=== Installing Omarchy ==="
curl -fsSL https://omarchy.org/install | bash

# 3. Backup existing configs
echo "=== Backing up existing configs ==="
mkdir -p "$BACKUP_DIR"

for dir in dotfiles/*; do
  name=$(basename "$dir")
  if [ -d "$HOME/.config/$name" ]; then
    echo "Backing up $name"
    cp -r "$HOME/.config/$name" "$BACKUP_DIR/"
  fi
done

# optional: create 'latest' symlink
ln -sfn "$BACKUP_DIR" "$BACKUP_ROOT/latest"

# 4. Apply your dotfiles (copy)
echo "=== Applying personal dotfiles ==="
for dir in dotfiles/*; do
  name=$(basename "$dir")
  rm -rf "$HOME/.config/$name"
  cp -r "$dir" "$HOME/.config/"
done

echo "=== Done ==="
echo "Dotfiles applied in ~/.config"
echo "Backup stored at: $BACKUP_DIR"

# 5. Ask if user wants to create symlinks
read -rp "Do you want to create direct symlinks to the repo dotfiles? (y/N): " CREATE_LINK
if [[ "$CREATE_LINK" =~ ^[Yy]$ ]]; then
  for dir in dotfiles/*; do
    name=$(basename "$dir")
    rm -rf "$HOME/.config/$name"
    ln -s "$PWD/$dir" "$HOME/.config/$name"
    echo "Symlink created: ~/.config/$name → $PWD/$dir"
  done
  echo "All dotfiles now linked to repo."
else
  echo "Skipped symlinks. Dotfiles remain copied."
fi

