#!/bin/bash

# This helps to define path


pathadd_first() {
        if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
                PATH="$1:${PATH:+"$PATH"}"
        fi
}
pathadd_last() {
        if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
                PATH="${PATH:+"$PATH:"}$1"
        fi
}


# Syntax
# path_mgr user|system del <path>
# path_mgr user|system add before|after <path>
path_mgr() {

    local context
    case $1 in
        user)
            context=user
            ;;
        system)
            context=system
            ;;
        *)
            >&2 echo "Error: You must set user or system"
            ;;
    esac
    shift

    local action
    case $1 in
        add)
            action=add
            ;;
        del)
            action=del
            ;;
        *)
            >&2 echo "Error: You must add or remove a path"
            ;;
    esac
    shift

    local order
    if [[ "${action}" == "add" ]]; then
        case $1 in
            before)
                order=before
                ;;
            after)
                order=after
                ;;
            *)
                >&2 echo "Error: You must define where to include path"
                ;;
        esac
    fi

    echo "not implemented yet ..."


}

# Add paths
#for i in $(find ${HOME}/opt/*/bin -type d); do
#    pathadd_first ${i}
#done

#pathadd_first ${HOME}/opt/autobin
#pathadd_first ${HOME}/opt/bin
#pathadd_first ${HOME}/.usr/bin

