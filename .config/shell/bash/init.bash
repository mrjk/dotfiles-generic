#!/bin/bash
#
#
# This file is sourced automatically by xsh if the current shell is `bash`.
#
# It should merely register the modules to be loaded for each runcom:
# env, login, interactive and logout.
# The order in which the modules are registered defines the order in which
# they will be loaded. Try `xsh help` for more information.
#

xsh module core

# Load generic modules
xsh module user
case "$USER" in 
  root)
    xsh module admin
    ;;
esac

# Load jez modules
xsh module ps1 
case "${SUDO_USER:-$USER}" in 
  jez)
    xsh module jez
    ;;
esac

#unset ${!_XSH_*}

