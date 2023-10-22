direnv hook fish | source
set -x SUDO_EDITOR (which nvim)
fish_add_path ~/.local/bin

kanagawa

alias config='/usr/bin/git --git-dir=$HOME/.mycfg/ --work-tree=$HOME'
