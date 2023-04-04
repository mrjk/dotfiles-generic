
export PYTHONUSERBASE="$HOME/.local/opt/python/default"
[[ ":$PATH:" != *":$PYTHONUSERBASE/bin:"* ]] && export PATH="$PYTHONUSERBASE/bin:$PATH"

