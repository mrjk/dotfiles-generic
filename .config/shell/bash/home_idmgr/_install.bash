
git_clone_pull ()
{
  local dest=$1
  local repo=$2

  if [ -d "$dest/.git" ]; then
    git -C "$dest" pull --ff-only
  else
    git clone "$repo" "$dest"
  fi
}

create_symlink ()
{
  local src=$1
  local dest=$2

  if [ -L "$dest" ] || [ ! -s "$dest" ] ; then
    # Clean broken symlink, empty files
    rm "$dest"
  fi

  if [ ! -L "$dest" ]; then
    ln -r -s "$src" "$dest"
  fi
}


xsh_install_idmgr_git ()
{

  local repo="https://github.com/mrjk/idmgr"
  local dest_git="$HOME/.local/shell/idmgr"
  local dest_bin="$HOME/.local/bin/idmgr"

  mkdir -p "$dest_git"
  git_clone_pull "$dest_git"  "$repo"
  mkdir -p "$HOME/.config/xsh"
  create_symlink "$dest_git/bin/idmgr" "$dest_bin"

}


xsh_install_idmgr_git
>&2 echo "Idmgr has been installed"
