#!/usr/bin/env bash

BIN="$(dirname "$0")"
ROOT="$BIN/.."
cp ~/.config/nvim/init.vim "$ROOT/nvim/"
cp ~/.config/nvim/coc-settings.json "$ROOT/nvim/"

cp ~/.config/karabiner/karabiner.json "$ROOT/karabiner/"

cp ~/.spacemacs $ROOT
cp ~/.zshrc $ROOT
cp ~/.zshenv $ROOT
