#!/bin/fish

function loop
  if string match "*.git" $argv -q
  else if string match "*.gitignore" $argv -q
  else
    if [ -d $argv ]
      if [ ! -d $HOME/$argv ]
        echo "[MKDIR] $HOME/$argv"
        mkdir $HOME/$argv
      end
      for file in $argv/*
        if [ $file = '.' ]
        else 
          loop "$file"
        end
      end
    else
      echo "[LN] $PWD/$argv -> $HOME/$argv"
      ln -sf $PWD/$argv $HOME/$argv
    end
  end
end

for file in .*
  loop $file
end
