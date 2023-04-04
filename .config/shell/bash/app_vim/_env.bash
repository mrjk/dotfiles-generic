
if command -v vim >&/dev/null; then
  mkdir -p $XDG_CACHE_HOME/vim $XDG_CONFIG_HOME/vim
  touch "$XDG_CONFIG_HOME/vim/vimrc"
  #alias vim='vim -u "$XDG_CONFIG_HOME/vim/vimrc" -u /etc/vimrc'
  alias vim='vim -u /etc/vimrc -u "$XDG_CONFIG_HOME/vim/vimrc"'
fi
