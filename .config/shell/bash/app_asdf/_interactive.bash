

# . "$ASDF_DIR/asdf.sh"
export ASDF_DIR=$HOME/.local/shell/asdf/
export ASDF_DATA_DIR=$HOME/.local/share/asdf

. "${ASDF_DIR}/lib/asdf.sh"
unset _under current_script_path ASDF_BIN ASDF_USER_SHIMS


. "$ASDF_DIR/completions/asdf.bash"

