
export HOMEBREW_NO_AUTO_UPDATE=1

if [[ -d "$HOME/.local/shell/homebrew/bin" ]] ; then
  path_add $HOME/.local/shell/homebrew/bin
fi
