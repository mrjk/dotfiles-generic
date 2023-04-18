#
# User configuration module for bash.
#
#
# -----------------------------------------------------------------------------
# COmpletion
# -----------------------------------------------------------------------------

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# -----------------------------------------------------------------------------
# Interactive environment
# -----------------------------------------------------------------------------

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../..'
alias cd..='cd ..'

# ls
alias l='ls -1'
alias ls='ls -h --group-directories-first'
alias ll='ls -lh'
alias la='ll -Ah'

alias lll='ls -GClFh'
alias ltr='ls -ltr'
alias lsd="ls -Gl | grep ^d"

# mkdir
alias mkdir='mkdir -p'

# others
#alias h='history'
alias j='jobs -l'


# Colors
if [ -x /usr/bin/dircolors ]; then

  if [ -r "$XDG_CONFIG_HOME/dircolors/dircolors" ] ; then
    # Try to load local config
    eval "$(dircolors -b "${XDG_CONFIG_HOME}/dircolors/dircolors")"
  else
    # Fall back on system configuration
    eval "$(dircolors -b)"
  fi

  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  alias tree='tree -C'

fi


# Other shortcuts

# Aliases for common chmods
alias 000='chmod 000'   # ----------
alias 600='chmod 600'   # -rw-------
alias 644='chmod 644'   # -rw-r--r--
alias 755='chmod 755'   # -rwxr-xr-x
alias +x='chmod +x '



