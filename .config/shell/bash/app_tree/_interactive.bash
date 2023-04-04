

if command -v tree >&/dev/null; then
  alias tree='tree -C'
else
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi
