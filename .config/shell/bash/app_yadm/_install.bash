

xsh_install_yadm_dist ()
{
  local dest_bin="$HOME/.local/bin/yadm"
  mkdir -p "${dest_bin%/*}"
  curl -fLo "$dest_bin" https://github.com/TheLocehiliosan/yadm/raw/master/yadm \
    && chmod a+x "$dest_bin"
}

xsh_install_yadm_dev ()
{
  local dest_git="$HOME/.local/shell/yadm"
  local dest_bin="$HOME/.local/bin/yadm"
  git clone https://github.com/TheLocehiliosan/yadm.git "$dest_git"
  ln -s "$dest_git/yadm" "$dest_bin"
}

xsh_install_yadm_dist

>&2 echo "Yadm has been installed"
