#
# Jez configuration module for bash.
#


if command -v idmgr; then
  eval "$( idmgr shell)"
  alias i=idmgr
  echo "Interactive idmgr loaded"
fi



# #
# ## -----------------------------------------------------------------------------
# ## Interactive environment
# ## -----------------------------------------------------------------------------
# #
# ## cd
# #alias ..='cd ..'
# #alias ...='cd ../..'
# #alias ....='cd ../..'
# #alias cd..='cd ..'
# #
# ## ls
# #alias l='ls -1'
# #alias ls='ls -h --group-directories-first'
# #alias ll='ls -lh'
# #alias la='ll -Ah'
# #
# #alias lll='ls -GClFh'
# #alias ltr='ls -ltr'
# #alias lsd="ls -Gl | grep ^d"
# #
# ## mkdir
# #alias mkdir='mkdir -p'
# #
# ## others
# ##alias h='history'
# #alias j='jobs -l'
# #
# #
# ## Colors
# #if [ -x /usr/bin/dircolors ]; then
# #
# #  if [ -r "$XDG_CONFIG_HOME/dircolors/dircolors" ] ; then
# #    # Try to load local config
# #    eval "$(dircolors -b "${XDG_CONFIG_HOME}/dircolors/dircolors")"
# #  else
# #    # Fall back on system configuration
# #    eval "$(dircolors -b)"
# #  fi
# #
# #  alias ls='ls --color=auto'
# #  alias dir='dir --color=auto'
# #  alias vdir='vdir --color=auto'
# #
# #  alias grep='grep --color=auto'
# #  alias fgrep='fgrep --color=auto'
# #  alias egrep='egrep --color=auto'
# #
# #  alias tree='tree -C'
# #
# #fi
# 
# 
# # -----------------------------------------------------------------------------
# # User aliases
# # -----------------------------------------------------------------------------
# 
# # IDEA
# # Faire un script qui catch les programmes root, et il append le prefix avec sudo ...
# 
# # List directory when moving
# #cd() { builtin cd "$@"; ll; }
# 
# # Faster
# alias v='vim '
# alias si='sudo -i '
# 
# # Command improvment
# command -v colordiff >/dev/null 2>&1 && alias diff='colordiff '
# command -v column >/dev/null 2>&1 && alias tmount='mount |column -t '
# 
# # Iptables
# alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
# alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
# alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
# alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
# 
# 
# 
# # -----------------------------------------------------------------------------
# # Testing
# # -----------------------------------------------------------------------------
# 
# # Cool func
# 
# alias biggest='du --human-readable | sort --human-numeric-sort | tail -n 50'
# 
# 
# ## Aliases for common chmods
# #alias 000='chmod 000'	  # ----------
# #alias 600='chmod 600'	  # -rw-------
# #alias 644='chmod 644'	  # -rw-r--r--
# #alias 755='chmod 755'	  # -rwxr-xr-x
# #alias +x='chmod +x '
# 
# # Aliases for software managment
# alias pacman='sudo pacman'
# #alias update='sudo pacman -Syu'
# 
# ssh_load_ids() {
#   ssh-add $(cat config | grep -i IdentityFile | awk '{print $2}' | sort | uniq | xargs )
#   ssh-add -l
# }
# 
# 
# alias lspath='echo $PATH | tr ':' '\n''
# 
# alias S='>& /dev/null &!'
# alias L='| less'
# 
# 
# # Start a command in background, redirect output to /dev/null:
# s(){
#   ("$@" & disown ) >/dev/null 2>&1 </dev/null
#   which "$1" >/dev/null 2>&1
# }
# 
# alias dfh='df -h'
# alias ducwd='du --si | sort -rn'
# 
# alias ssync='rsync --rsh=ssh'
# alias dl='cd ~/Downloads/'
# 
# alias ondemand='sudo cpupower frequency-set -g ondemand'
# alias performance='sudo cpupower frequency-set -g performance'
# 
# alias nmreconnect='nmcli nm enable false && nmcli nm enable true'
# 
# alias jtl='journalctl -b '
# alias stl='systemctl'
# alias stll='systemctl list-unit-files --state=enabled'
# #alias journalctl_clean_6w='du -sh /var/log/journal/; journalctl --vacuum-time=6weeks;  du -sh /var/log/journal/'
# 
# 
# alias y='yadm'
# 
# 
# reload_bash(){
#     . ${HOME}/.bashrc
# }
# 
# 
