
# Bug here, go path can have muktiple paths ...
export GOPATH="$HOME/.local/opt/go/default"
export GOBIN="$HOME/.local/opt/go/default/bin"
[[ ":$PATH:" != *":$GOPATH/bin:"* ]] && export PATH="$GOPATH/bin:$PATH"

