
xsh load lang_go env

if ! command -v go >&/dev/null; then
  return 1
fi

_xsh__python_groups=${_xsh__go_groups:-default}
for patt in $_xsh__go_groups ; do
  f="$HOME/.config/shell/go/requirements.$patt.txt"
  if [[ -f "$f" ]]; then
    >&2 echo "Install go requirements"
    # This only works for go <1.18
    cat  "$f" | xargs -n1 got get -v -u 
  fi
done

