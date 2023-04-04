
if command -v direnv >&/dev/null; then
  eval "$(direnv hook bash)"
fi

# ZSH
# eval "$(direnv hook zsh)"
# FISH
# direnv hook fish | source
# TCSH:
# eval `direnv hook tcsh`
# See: https://direnv.net/docs/hook.html
