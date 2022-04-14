This README is a very short version of a nice tutorial that can be found [here](https://www.atlassian.com/git/tutorials/dotfiles). 

# Install dotfiles into a new system
```fish
alias config='/usr/bin/git --git-dir=$HOME/.mycfg/ --work-tree=$HOME'
git clone --bare <git-repo-url> $HOME/.mycfg
config checkout
```
