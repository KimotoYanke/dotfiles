#!/bin/fish

export DOTFILES_PATH = ~/dotfiles

git clone --recursive "$GITHUB_URL" "DOTFILES_PATH"

cd $DOTFILES_PATH
if [ $PWD = (realpath $DOTFILES_PATH) ] 
  ./setup.fish
else
  echo "[NOT FOUND] $DOTFILES_PATH"
end
