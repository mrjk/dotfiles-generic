
  # XDG paths:
  # $HOME/.config # $XDG_CONFIG_HOME
  # $HOME/.local/share # $XDG_DATA_HOME
  # PATH+ =  $HOME/.local/bin
  # $HOME/.local/state  # $XDG_STATE_HOME
  # $HOME/.cache # $XDG_CACHE_HOME
  # # Optonal: /run/user/1000 # $XDG_RUNTIME_DIR


export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

