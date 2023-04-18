
xsh load lang_python env


pip_cmd=
for cmd in pip pip3; do
  if command -v "$cmd" >&/dev/null; then
    pip_cmd=$cmd
  fi
done

if [[ -z "$pip_cmd" ]]; then
  return 1
fi


# Comma separated values
_xsh__python_tags=${_xsh__python_tags:-default}
for patt in ${_xsh__python_tags//,/ }; do
  f="$HOME/.config/shell/python/requirements.$patt.txt"
  if [[ -f "$f" ]]; then
    >&2 echo "Install pip requirements"
    $pip_cmd install --user -r "$f"
  fi
done

