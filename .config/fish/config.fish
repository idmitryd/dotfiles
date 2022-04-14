direnv hook fish | source
set -x SUDO_EDITOR (which nvim)
# theme_gruvbox dark medium
set_colors

alias config='/usr/bin/git --git-dir=$HOME/.mycfg/ --work-tree=$HOME'
