# -----------------------------------------------------------------------------
# Bash Configuration
# -----------------------------------------------------------------------------

# Base options
shopt -s cdspell              # Spelling correction for cd
shopt -s checkwinsize         # Adjust text to window size after commands
#shopt -s dotglob              # Enable globbing for dotfiles
shopt -s extglob              # Extended globbing
shopt -s histappend           # Append to history, don't overwrite
shopt -s histreedit           # Re-edit failed history substitutions
shopt -s nocaseglob           # Ignore cases for globbing filenames
shopt -s hostcomplete	      # Completion for hosts

# OSX non-compatibility
if [[ ! "$OSTYPE" =~ darwin* ]]; then
	shopt -s autocd               # Enable changing directory without cd
	shopt -s dirspell             # Spelling correction for dirs
	shopt -s globstar             # ZSH-like ** globbing (recursive dir match)
	shopt -s checkjobs
fi

# Prepare detination directory
[ -d "${XDG_DATA_HOME}/bash/" ] || mkdir -p "${XDG_DATA_HOME}/bash/" 2> /dev/null
touch "${HISTFILE}" 2>/dev/null
if [ ! -w "${HISTFILE}" ]; then
  >&2 echo "WARN: Disabling Bash history file"
  unset HISTFILE
fi

# Bash specific options
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=""

## Define dircolors for darwin
#if dot::os::mac ; then
#  export CLICOLOR=1
#  export LSCOLORS=GxFxCxDxBxegedabagaced
#fi
#
## Define pager for linux
#if dot::os::linux ; then
#  export MANPAGER=less
#fi
