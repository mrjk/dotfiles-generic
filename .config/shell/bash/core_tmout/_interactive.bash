#!/bin/bash

# This force prompt auto-logout when used with tty
if [[ "$(tty)" =~ /dev/tty[0-9] ]]; then export TMOUT=900;fi


