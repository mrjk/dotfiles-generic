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

_XSH_RUNCOM_APP=env:login:interactive:logout:install


# Base shell environment
xsh module core $_XSH_RUNCOM_APP
xsh module core_xdg 
xsh module core_path # require xdg
xsh module ps1 

# Home Management tools
xsh module home_xsh $_XSH_RUNCOM_APP
xsh module home_yadm $_XSH_RUNCOM_APP
xsh module home_idmgr $_XSH_RUNCOM_APP

xsh module app_direnv $_XSH_RUNCOM_APP

# Load jez modules
case "${SUDO_USER:-$USER}" in 
  jez)
    xsh module jez
    ;;
esac

#unset ${!_XSH_*}


# user           # Always
# user_root      # If is root
# user_work      # If explicit
# user_desktop   # if has a xorg instance

# Load generic modules
xsh module user
case "$USER" in 
  root)
    xsh module user_root
    ;;
esac
