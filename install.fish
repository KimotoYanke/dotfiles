#!/usr/bin/env fish

set DOTFILES_PATH ~/dotfiles
set GITHUB_URL https://github.com/KimotoYanke/dotfiles

git clone --recursive "$GITHUB_URL" "$DOTFILES_PATH"

cd $DOTFILES_PATH
if [ $PWD = (realpath $DOTFILES_PATH) ] 
  ./setup.fish
else
  echo "[NOT FOUND] $DOTFILES_PATH"
end
