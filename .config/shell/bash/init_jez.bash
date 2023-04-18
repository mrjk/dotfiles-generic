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


_xsh__hostname=$(hostname)


case "$hostname" in
  xpjez)
      xsh module linux_archlinux $_XSH_RUNCOM_APP
    ;;
esac


# Core home
# ============================
_xsh__python_tags=default

# Lang managers
# ============================
xsh module lang_go $_XSH_RUNCOM_APP
xsh module lang_python $_XSH_RUNCOM_APP


# Plugin managers
# ============================
xsh module home_idmgr $_XSH_RUNCOM_APP
xsh module home_basher $_XSH_RUNCOM_APP
xsh module home_ellipsis $_XSH_RUNCOM_APP
xsh module app_asdf $_XSH_RUNCOM_APP
xsh module home_homebrew $_XSH_RUNCOM_APP


# Other apps
# ============================
xsh module app_direnv $_XSH_RUNCOM_APP
xsh module app_mani $_XSH_RUNCOM_APP
xsh module app_taskfile $_XSH_RUNCOM_APP


xsh module app_tea $_XSH_RUNCOM_APP
xsh module app_gh $_XSH_RUNCOM_APP

# OR via brew:
# brew install gh
# brew install tea
# brew install direnv
# brew install go-task


# user           # Always
# user_root      # If is root
# user_work      # If explicit
# user_desktop   # if has a xorg instance

