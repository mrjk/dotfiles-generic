#!/bin/bash


shell_ps1_advanced () {

  # Get globals
  local PS1_PREFIX='||\${PS1_PREFIX}||'
  local PS1_SUFFIX='\>${PS1_SUFFIX}<'
  #local PS1_OVERRIDE=${PS1_OVERRIDE}

  # Define colors
  local RESET="\[\e[0m\]"
  local BLACK="\[\e[0;30m\]"        # Black
  local RED="\[\e[0;31m\]"          # Red
  local GREEN="\[\e[0;32m\]"        # Green
  local YELLOW="\[\e[0;33m\]"       # Yellow
  local BLUE="\[\e[0;34m\]"         # Blue
  local PURPLE="\[\e[0;35m\]"       # Purple
  local CYAN="\[\e[0;36m\]"         # Cyan
  local WHITE="\[\e[0;37m\]"        # White

  # Define dynamic prompt variables (Fucking bashisms :-()
  local PS1_RETURN="\$(
  PS1_EXIT=\$?; 
  [[ \$PS1_EXIT == 0 ]] ||  echo -n \"${RED}\${PS1_EXIT}${RESET} \"
  )"

  local PS1_PATH="\$(
  if [ -s \"\${PWD}\" ] ; then
    PS1_DF=\$(command df -P \"\${PWD}\" | grep -E -o '[0-9]{1,3}%' | grep -E -o '[0-9]{1,3}');

    # No timeout command on mac ...
    #	PS1_DF=\$(command timeout 1s df -P \"\${PWD}\" | awk 'END {print \$5} {sub(/%/,\"\")}');

    if [ \"\${PS1_DF:-0}\" -gt 95 ]; then
      PS1_PATH=\"${RED}:\"
    elif [ \"\${PS1_DF:-0}\" -gt 90 ]; then
      PS1_PATH=\"${YELLOW}:\"
    else
      PS1_PATH=\"${WHITE}:\"
    fi
  else
    # Current directory is size '0' (like /proc, /sys etc).
    PS1_PATH=\"${YELLOW}:\";
  fi

  # Replace $HOME per ~
  PS1_PWD=\${PWD/\${HOME//\//\\\/}/\~}

  # Make string smaller than 40
  PWD_PREFIX=\${PS1_PWD/\/*/}
  PWD_REDUCED=\${PS1_PWD: -40}
  PWD_REDUCED=\${PWD_REDUCED/#\//}
  PS1_PWD=\${PWD_REDUCED:-\$PS1_PWD}

  # Make beautiful path start
  PS1_PWD=\${PS1_PWD/#+([!\/\~])/\${PWD_PREFIX}..}


  if [ -w \"\${PWD}\" ] ; then
    PS1_PATH=\"\${PS1_PATH}${BLUE}\${PS1_PWD}\"
  else
    # No 'write' privilege in the current directory.
    PS1_PATH=\"\${PS1_PATH}${YELLOW}\${PS1_PWD}\"
  fi

  echo -e \"\${PS1_PATH}\"
  )"

  # Get jobs
  local PS1_JOBS="\$(
  PS1_JOBS='';
  PS1_JOBS_RUNNING=\$(jobs -r | wc -l);
  PS1_JOBS_STOPPED=\$(jobs -s | wc -l);
  if [ \${PS1_JOBS_RUNNING} -gt 0 ] || [ \${PS1_JOBS_STOPPED} -gt 0 ]; then
    if [ \${PS1_JOBS_RUNNING:-0} -gt 0 ]; then
      PS1_JOBS_RUNNING=\"${GREEN}\${PS1_JOBS_RUNNING}${RESET}\"
    else
      PS1_JOBS_RUNNING=''
    fi

    if [ \${PS1_JOBS_STOPPED:-0} -gt 0 ]; then
      PS1_JOBS_STOPPED=\"${YELLOW}\${PS1_JOBS_STOPPED}${RESET}\"
    else
      PS1_JOBS_STOPPED=''
    fi

    PS1_JOBS=\"\${PS1_JOBS_RUNNING}:\${PS1_JOBS_STOPPED} \";
  else
    PS1_JOBS=''
  fi
  echo -e \"\${PS1_JOBS}\";
  )"

  # Time execution checker

  # Maximal time to consider prompt as slow in ms
  local PS1_MAX_EXEC_TIME=500
  # Number of time needed before swithing to basic prompt
  local PS1_MAX_TIME=3
  # Time windows to check
  local PS1_MAX_EXEC_DELAY=60
  # Time before reloading full PS1 after showing simple prompt
  local PS1_DELAY_RELOAD=300

  # Debug
  #	local PS1_MAX_EXEC_TIME=5
  #	local PS1_MAX_TIME=3
  #	local PS1_MAX_EXEC_DELAY=60
  #	local PS1_DELAY_RELOAD=30

  local PS1_TMP_FILE=/tmp/.load-$(whoami)
  chown $(whoami):$(whoami) ${PS1_TMP_FILE} 2>/dev/null
  local PS1_START="\$(
  if [ -f ${PS1_TMP_FILE} ] && [ \"\$(cat ${PS1_TMP_FILE} | grep -E -o '^reset')\" = \"reset\" ]
  then
    echo '\u@\h:\[\033[01;34m\]\w\[\033[00m\]\\$ '
    if [ \$((\$(date +%s) - \$(stat -c %Y ${PS1_TMP_FILE}) )) -gt ${PS1_DELAY_RELOAD} ]
    then
      echo -n \"Shell: full prompt reactivated.\n\"
      > ${PS1_TMP_FILE};
    fi
  else
    ts=\$(date +%s); 
    echo -e \""
    local PS1_STOP="\"; 
    tt=\$(((\$(date +%s) - \${ts})));
    if [ \${tt} -gt ${PS1_MAX_EXEC_TIME} ]
    then
      echo 1 >> ${PS1_TMP_FILE};
      if [ \$((\$(date +%s) - \$(stat -c %Y ${PS1_TMP_FILE}) )) -gt ${PS1_MAX_EXEC_DELAY} ] || [ \$(wc -l ${PS1_TMP_FILE} | grep -E -o '^[0-9]{1,3}') -gt ${PS1_MAX_TIME} ]
      then
	echo "reset" > ${PS1_TMP_FILE};
	echo -n \"Shell: prompt is taking more than ${PS1_MAX_EXEC_TIME}ms to anwser. Normal prompt will be reactivated in ${PS1_DELAY_RELOAD}s. Execute 'rm ${PS1_TMP_FILE}' to force.\n\" ;
      fi
    fi 
  fi
  )"

  # Define static prompt variables
  local PS1_ACOUNT="${WHITE}\\$ "
  local PS1_CHROOT_DEB="${debian_chroot:+($debian_chroot)}"

  # Set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    local debian_chroot=$(cat /etc/debian_chroot)
  fi

  # Define prompt depending user
  if [ $(id -u) -eq 0 ];
  then # you are root, make the prompt red
    # Are you root ?
    local PS1_USER="${GREEN}\u"
    # In green
  elif [ -n "$(cat /etc/passwd  | grep $(whoami)  | grep -E -v ':/bin/(ba|z|t)?sh')" ]; then
    # The you are a no login user ...
    local PS1_USER="${RED}\u"
    # In red
  elif [ $(id -u) -lt 1000 ]; then
    # Are you a system user ?
    local PS1_USER="${YELLOW}\u"
    # In orange
  elif [ $(id -u) -ge 1000 ]; then
    # Are you a regular user ?
    local PS1_USER="${WHITE}\u"
    # In white
  fi

  # Detect serial connection (virtualisation, ttySx)
  if [ $(ps ax | grep $$ | awk '{ print $2 }' | grep 'ttyS.' | wc -l ) -gt 0 ]; then
    local PS1_HOST="@${RED}\h"
  else
    local PS1_HOST="${GREEN}@\h"
  fi

  # Add git prompt support
  #local PS1_GIT="\$(__git_ps1 '(%s) ' 2>/dev/null )"
  local PS1_GIT=""

  # Set the prompt depending the shell
  case "${@:-${SHELL##*/}}" in
    bash)
      PS1="\${PS1_OVERRIDE:-${RESET}\${PS1_RETURN}${PS1_START}\${PS1_PREFIX:+\$PS1_PREFIX }${PS1_JOBS}${PS1_USER}${PS1_HOST}${PS1_PATH}${PS1_ACOUNT}${RESET}${PS1_GIT}\${PS1_SUFFIX:+\${PS1_SUFFIX} }${PS1_STOP}}"
      ;;
    dash)
      PS1='$USER@$HOSTNAME:$PWD\$ '
      ;;
    *)
      PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      ;;
  esac

}

# Load the prompt
shell_ps1_advanced

