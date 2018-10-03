function _add_path
  if test -e $argv
    set -x PATH $PATH $argv
  end
end
_add_path "/home/adam/.gem/ruby/2.5.0/bin"
_add_path "/home/adam/.nimble/bin"
_add_path "/home/adam/emsdk-portable"

function nico-mpv 
  argparse -n nico-mpv 'u/username=' 'v/video=' -- $argv

  set cookies '$HOME/nico-cookies.txt'
  #if test -e $cookies 
    echo $cookies
    set video $_flag_video
    mpv --no-video --input-ipc-server=/tmp/mpvsocket --ytdl-raw-options="cookies=$cookies" $video 
  # else
  #   echo username
  #   set -lq _flag_username
  #   or get --prompt="Enter your username:" | read -l _flag_username
  #
  #   set username $_flag_username
  #   set video $_flag_video
  #
  #   get --prompt="Enter your password:" --silent | read -l pwd
  #
  #   touch $cookies
  #   mpv $video --no-video --input-ipc-server=/tmp/mpvsocket --ytdl-raw-options="username=$username,password=$pwd,cookies=$cookies"
  #end
end

function nico-mpc
  set cookies '$HOME/nico-cookies.txt'
  mpc add (youtube-dl --cookies="$cookies" --prefer-insecure -g $argv)
end
