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
# ============================
xsh module core $_XSH_RUNCOM_APP
xsh module core_xdg 
xsh module core_path # require xdg
xsh module core_ps1 
xsh module core_tty 
xsh module core_tmout 
xsh module core_user


# Home Management tools
# ============================

# Manage shell initialization
xsh module home_xsh $_XSH_RUNCOM_APP

# Manage dotfiles in git
#xsh module home_yadm $_XSH_RUNCOM_APP

# Manage identyties
#xsh module home_idmgr $_XSH_RUNCOM_APP


# Linux apps
# ============================
xsh module app_ssh_agent $_XSH_RUNCOM_APP
xsh module app_vim $_XSH_RUNCOM_APP
xsh module app_git $_XSH_RUNCOM_APP
xsh module app_less $_XSH_RUNCOM_APP
xsh module app_tree $_XSH_RUNCOM_APP


# Plugin managers
# ============================
#xsh module home_basher $_XSH_RUNCOM_APP
#xsh module home_ellipsis $_XSH_RUNCOM_APP
#xsh module app_asdf $_XSH_RUNCOM_APP


# Lang managers
# ============================
#xsh module lang_go $_XSH_RUNCOM_APP
#xsh module lang_python $_XSH_RUNCOM_APP


# Other apps
# ============================
#xsh module app_direnv $_XSH_RUNCOM_APP


# Linux distro support
# ============================
# xsh module linux_archlinux $_XSH_RUNCOM_APP

