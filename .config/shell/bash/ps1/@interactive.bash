#!/bin/bash

main ()
{
  local ps1_config=${_XSH_PS1_CONFIG:-default}
  
  if ! xsh load ps1 $ps1_config >&/dev/null; then
    _xsh_error "Failed to load PS1 '$ps1_config', fallback on default" -
    xsh load ps1 default
  fi
}

main
