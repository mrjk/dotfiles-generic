
path_add() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
        fi
    fi
}

path_rm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}


# Add Paths
if [ -d "$XDG_CONFIG_HOME/scripts" ]; then
  path_add "$XDG_CONFIG_HOME/scripts"
fi
path_add "$HOME/.local/bin"
if [ -d "$HOME/.bin" ]; then
  path_add "$HOME/.bin"
fi

