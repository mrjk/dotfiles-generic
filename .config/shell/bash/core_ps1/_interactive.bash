#!/bin/bash

main ()
{
  local ps1_config=${_XSH_PS1_CONFIG:-colors}
  local ps1_config=${_XSH_PS1_CONFIG:-colors2}

  xsh load core_ps1 $ps1_config
  return

  if ! xsh load core_ps1 $ps1_config >&/dev/null; then
    _xsh_error "Failed to load PS1 '$ps1_config', fallback on default" -
    xsh load core_ps1 default
  fi


  # function prompt_command {
  #   export PS1=$(~/.config/shell/bash/core_ps1/_colors_v2.bash)
  # }
  # export PROMPT_COMMAND=prompt_command

}

main
